CASTLE48H_STATE_CLOSED = -1
CASTLE48H_STATE_OPEN = 0

CASTLE48H_OBJECTIVE_MORETIME = 1
CASTLE48H_OBJECTIVE_LASTDOMINANT = 2
CASTLE48H_OBJECTIVE_DEFAULT = CASTLE48H_OBJECTIVE_MORETIME

local getGuildNameByGuidId = function(guildId)
	local result = db.getResult('SELECT `name` FROM `guilds` WHERE `id` = ' .. guildId)
	local name = ''
	
	if result:getID() ~= -1 then
		name = result:getDataString('name')
		result:free()
	end
	return name
end

function castle()
local result = db.getResult("SELECT * FROM `players` WHERE `guild_id` = "..id..";")
	if result:getID() ~= -1 then
		local guildId = result:getDataInt('guild_id')
		
		Castle48h.dominant = guildId
		Castle48h.dominantName = getGuildNameByGuidId(guildId)
		result:free()
	else
		db.executeQuery('INSERT INTO `castle48h_config` VALUES (0, 0)')
		print('>> Warning Castle48h, Missing default line. Updated')
	end
end

if not Castle48h then
	Castle48h = {
		state = CASTLE48H_STATE_CLOSED,
		openfor = 60,
		minLevel = 150,
		reward = {2090, 1},

		-- cache
		dominant = 0,
		dominantName = '',
		started = false,
		voteEnabled = false,
		objectiveOption = CASTLE48H_OBJECTIVE_DEFAULT,
		votes = {},
		invaders = {},
		guilds = {},
		activePlayers = {}
	}

	function Castle48h:startVoteObjetive()
		if self:eventState() ~= CASTLE48H_STATE_CLOSED or self.voteEnabled then
			return false
		end
		self.voteEnabled = true
		broadcastMessage('[Castle War]: Foi iniciada a votação para decidir o objetivo do castelo que abre em alguns minutos. Use !castle1 para votar no objetivo "Dominar o castelo por mais tempo". Use !castle2 para votar no objetivo "Último que dominar o castelo". Caso não haja votações, o padrão será o primeiro objetivo.')
	end

	function Castle48h:open()
		if self:eventState() == CASTLE48H_STATE_OPEN then
			return false
		end

		-- objetive vote new feature
		local obj1Count = 0
		local obj2Count = 0
		local voteCount = 0
		for ip, vote in pairs(self.votes) do
			voteCount = voteCount + 1
			if vote == CASTLE48H_OBJECTIVE_MORETIME then
				obj1Count = obj1Count + 1
			elseif vote == CASTLE48H_OBJECTIVE_LASTDOMINANT then
				obj2Count = obj2Count + 1
			end
		end

		self.objectiveOption = obj1Count >= obj2Count and CASTLE48H_OBJECTIVE_MORETIME or CASTLE48H_OBJECTIVE_LASTDOMINANT
		self.voteEnabled = false
		self.votes = {}
		local voteString = 'Resultado das votações: [All: ' .. voteCount .. ', First: ' .. obj1Count .. ', Second: ' .. obj2Count .. '], Conclusão: O objetivo é ' .. (obj1Count >= obj2Count and 'dominar por mais tempo' or 'ser o último dominante') .. '.'

		self.started = true
		self.invaders = {}
		self.guilds = {}
		self.activePlayers = {}
		self.timeleft = os.time() + (self.openfor * 60)
		self:eventState(CASTLE48H_STATE_OPEN)
		self:checkInterval()
		self:clear()
		broadcastMessage('[Castle War]: Atenção, o CASTELO está aberto para batalha, junte-se com sua guild e conquiste-o. O castelo encerra em  ' .. string.diff(self.openfor * 60, true) .. '.\n' .. voteString)
		return true
	end

	function Castle48h:close()
		if self:eventState() == CASTLE48H_STATE_CLOSED then
			return false
		end

		self.started = false

		for name in pairs(self.invaders) do
			local cid = getCreatureByName(name)
			if cid then
				unregisterPlayerEvent(cid, 'Castle48hHealth')
				unregisterPlayerEvent(cid, 'Castle48hMana')
				unregisterPlayerEvent(cid, 'Castle48hThink')
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			end
		end

		self:saveNewDominant()

		for guid, time in pairs(self.activePlayers) do
			local pid = getPlayerByGUID(guid)
			if pid ~= 0 then
				local guildId = getPlayerGuildId(pid)
				if guildId ~= 0 and guildId == self.dominant then
					doPlayerAddItem(pid, self.reward[1], self.reward[2])
					doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, 'Você recebeu ' .. self.reward[2] .. 'x ' .. getItemInfo(self.reward[1]).name .. ' para usar na roleta dentro do castelo.')
				end
			end
		end

		self.invaders = {}
		self.guilds = {}
		self.activePlayers = {}
		self:eventState(CASTLE48H_STATE_CLOSED)
		return true
	end

	function Castle48h:clear()
		if self.dominant == 0 then
			return
		end
		
		for _, pid in ipairs(getPlayersOnline()) do
			if getPlayerGuildId(pid) == self.dominant then
				if self:memberInside(pid) then
					self:expulsePlayer(pid)
				end
			end
		end

		self.dominant = 0
		self.dominantName = ''
	end

	function Castle48h:onVisit(guildId)
		return guildId == self.dominant
	end

	function Castle48h:onDominate(guildId)
		if guildId == self.dominant then
			return false
		end

		local newDominantName = getGuildNameByGuidId(guildId)
		self.dominant = guildId
		self.dominantName = newDominantName
		broadcastMessage(('[Castle War]: A guild %s acaba de tomar o domínio do castelo.'):format(newDominantName))
		return true
	end

	function Castle48h:expulsePlayer(cid)
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		self:memberInside(cid, false)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, '[Castle War]: O domínio do castelo foi anulado para uma nova guerra mais tarde.')
	end

	function Castle48h:saveNewDominant()
		if self.dominant == 0 then
			broadcastMessage('[Castle War]: Nenhuma guild teve a capacidade de dominar o castelo e o mesmo foi fechado sem dominantes.')
		else
			if self.objectiveOption == CASTLE48H_OBJECTIVE_MORETIME then
				local bestTime = 0
				for guildId, seconds in pairs(self.guilds) do
					if seconds > bestTime then
						bestTime = seconds
						self.dominant = guildId
						self.dominantName = getGuildNameByGuidId(guildId)
					end
				end
				broadcastMessage(('[Castle War]: A guild %s manteve o domínio do CASTELO por mais tempo (%s) e venceu a guerra. A guild vencedora terá o domínio do castelo até às 21:00 de amanhã.'):format(self.dominantName, string.diff(bestTime, true)), MSG_EVENT_ADVANCE)
			elseif self.objectiveOption == CASTLE48H_OBJECTIVE_LASTDOMINANT then
				local guildName = getGuildNameByGuidId(self.dominant)
				broadcastMessage(('[Castle War]: A guild %s foi a última dominante e venceu a guerra. A guild vencedora terá o domínio do castelo até às 21:00 de amanhã.'):format(guildName or 'unknown'), MSG_EVENT_ADVANCE)
			end
		end

		db.executeQuery(('UPDATE `castle48h_config` SET `guild_id` = "%s", `day` = "%d"'):format(self.dominant, os.time()))
		return true
	end

	function Castle48h:memberInside(cid, value)
		if value == nil then
			return getPlayerStorageValue(cid, STORAGEVALUE_CASTLE48H_MEMBER) > -1
		end
		setPlayerStorageValue(cid, STORAGEVALUE_CASTLE48H_MEMBER, value and 1 or -1)
	end

	function Castle48h:eventState(state)
		if state == nil then
			return self.state
		end
		self.state = state
	end

	function Castle48h:checkInterval()
		addEvent(function()
			if self:eventState() == CASTLE48H_STATE_OPEN then
				local guildId = self.dominant
				if guildId ~= 0 then
					if not self.guilds[guildId] then
						self.guilds[guildId] = 0
					end
					self.guilds[guildId] = self.guilds[guildId] + 1
				end

				for name in pairs(self.invaders) do
				end
				if self.timeleft then
					local time = self.timeleft - os.time()
					if time == 300 then
						broadcastMessage('[Castle War]: Atenção, faltam 5 minutos para o encerramento da guerra.')
					elseif time == 180 then
						broadcastMessage('[Castle War]: Atenção, faltam 3 minutos para o encerramento da guerra.')
					elseif time == 60 then
						broadcastMessage('[Castle War]: Atenção, faltam 1 minuto para o encerramento da guerra.')
					elseif time <= 0 then
						self:close()
					end
				end

				self:checkInterval()
			end
		end, 1000)
	end
end
