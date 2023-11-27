require('data/funevents/battlefield/config')
local events = {'BFCombat', 'BFDeath', 'BFThink'}

BF_STATE_CLOSED = -1
BF_STATE_WAITING = 0
BF_STATE_GAME = 1
BF_STATE_ENDING = 2

if battlefield then

	function battlefield:open()
		if self:eventState() ~= BF_STATE_CLOSED then
			return false
		end

		local item = doCreateItem(1387, 1, self.joinpos)
		doItemSetAttribute(item, 'aid', 19620)

		broadcastMessage('[Battlefield]: O evento foi aberto. Para participar, vá até o teleport localizado no templo ou utilize o comando !battlefield join.', MESSAGE_EVENT_ADVANCE)

		self:eventState(BF_STATE_WAITING)
		self:initCountdown()
		return true
	end


	function battlefield:close()
		if self:eventState() == BF_STATE_CLOSED then
			return false
		end

		for _, pid in pairs(self:players()) do
			self:onLeave(pid)
		end

		self:removeTp()
		self:eventState(BF_STATE_CLOSED)
		return true
	end


	function battlefield:onJoin(player)
		if self:playerState(player) == 1 then
			return false
		end

		if self:eventState() == BF_STATE_GAME or getPlayerAccess(player) > 2 then
			self:teleportTo(player, self.teams[3].solo)
			return doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, 'Você se juntou aos ' .. self.teams[3].name .. '.')
		end

		if self:eventState() == BF_STATE_WAITING then
			if self:ban(player) > os.time() then
				return false, self:banPopup(player)
			end

			if getPlayerLevel(player) < self.game.min.level then
				return false, doPlayerSendCancel(player, 'Apenas jogadores com nível ' .. self.game.min.level .. ' ou superior podem entrar.')
			end

			if self.game.antimc then
				for _, pid in ipairs(self:players()) do

					if rawequal(getPlayerIp(player), getPlayerIp(pid)) then
						return false, doPlayerSendCancel(player, '[Anti Multi Client]: não foi possível participar.')
					end
				end
			end

			for _, ev in ipairs(events) do
				registerCreatureEvent(player, ev)
			end


			self:teleportTo(player, self.waitpos)
			self:regen(player)

			self:playerState(player, 1)
			doRemoveCondition(player, CONDITION_INVISIBLE)
			playingEvent(player, FUNEVENT_BATTLEFIELD)
		elseif self:eventState() == BF_STATE_ENDING then
			return false, doPlayerSendCancel(player, 'Ops, parece que você se atrasou! O Battlefield está em fase de finalização.')
		end

		return true
	end


	function battlefield:onLeave(player, restart)
		if self:playerState(player) < 1 then
			return true
		end

		for _, ev in ipairs(events) do
			unregisterCreatureEvent(player, ev)
		end

		local team = self:playerTeam(player)
		local enemy = self:getEnemyTeam(player)
		if not restart then
			self:teleportTo(player, getTownTemplePosition(getPlayerTown(player)))
			self:regen(player)
		end

		self:playerState(player, 0)
		self:playerTeam(player, 0)
		doRemoveCondition(player, CONDITION_OUTFIT)
		playingEvent(player, FUNEVENT_NONE)
		doCreatureSetDropLoot(player, true)
		doPlayerSave(player)

		if not restart and self:eventState() == BF_STATE_GAME and #self:getPlayersByTeam(team) == 0 then
			self:eventState(BF_STATE_ENDING)
			self:finishCountdown(enemy)
			broadcastMessage('[Battlefield]: Os ' .. self.teams[enemy].name .. ' acabam de vencer os ' .. self.teams[team].name .. ' e o evento chegou ao fim. Os participantes vivos da equipe vencedora serão recompensados.')
		end
		return false
	end


	function battlefield:formTeams()
		local function sortByValue(t, func)
		 	local keys = {}

			for key in pairs(t) do
		    	table.insert(keys, key)
		  	end

		  	table.sort(keys, function(a, b) return func(t[a], t[b]) end)

		  	return keys
		end

		local function valueReset()
			local players = {}

			for _, pid in ipairs(self:players()) do
		   		players[pid] = getPlayerLevel(pid)
			end

			return players
		end

		for i, pid in ipairs(sortByValue(valueReset(), function(a, b) return a < b end)) do
			local team = i % 2 == 0 and 1 or 2

			self:joinPlayer(pid, team)
		end
	end


	function battlefield:joinPlayer(player, team)
		if getPlayerAccess(player) > 2 then
			return false
		end

		self:teleportTo(player, self.teams[team].solo)

		self:playerTeam(player, team)
		self:changeOutfit(player, team)
		return doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, 'Você se juntou ao ' .. self.teams[team].name .. '.')
	end


	function battlefield:startgame(restart)
		if self:eventState() == BF_STATE_WAITING then

			if #self:players() < self.game.min.players then
				broadcastMessage('[Battlefield]: O evento foi encerrado por não ter a quantidade mínima de participantes.', MESSAGE_EVENT_ADVANCE)
				return self:close()
			end

			if not restart then
				broadcastMessage('[Battlefield]: O evento foi iniciado, boa sorte aos participantes.', MESSAGE_EVENT_ADVANCE)
			end

			self:formTeams()
			self:eventState(BF_STATE_GAME)

			self:createWalls()
			self:wallsCountdown()
			self:sendCancel('O Battlefield foi iniciado.')
		end
	end

	
	function battlefield:restartGame()
		if self:eventState() ~= BF_STATE_GAME then
			return false
		end

		self:eventState(BF_STATE_WAITING)

		for _, pid in ipairs(self:players()) do
			self:onLeave(pid, true)
			self:onJoin(pid)
		end

		self:initCountdown(true)
		return true
	end


	function battlefield:switchTeams()
		if self:eventState() ~= BF_STATE_GAME then
			return false
		end

		local red, blue = {}, {}

		for team = 1, 2 do
			for _, pid in ipairs(self:getPlayersByTeam(team)) do
				table.insert(team == 1 and blue or red, pid)
			end
		end

		for i = 1, 2 do
			for _, pid in ipairs(i == 1 and red or blue) do
				self:changeOutfit(pid, i)
				self:playerTeam(pid, i)
			end

			self:teleportTeam(i)
		end

		self:eventState(BF_STATE_GAME)
		return true
	end


	function battlefield:changeOutfit(player, team)
		local color = team == 1 and 114 or 94

		local outfit = {
			lookType = team == 1 and (getPlayerSex(player) == 0 and 156 or 152) or (getPlayerSex(player) == 0 and 147 or 143),
			lookHead = color,
			lookBody = color,
			lookLegs = color,
			lookFeet = color,
			lookAddons = 3
		}

		return doSetCreatureOutfit(player, outfit)
	end


	function battlefield:teleportTo(player, pos)
		return doTeleportThing(player, pos), doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end


	function battlefield:teleportTeam(team)
		for _, pid in ipairs(self:getPlayersByTeam(team)) do
			self:teleportTo(pid, self.teams[team].solo)
		end
	end


	function battlefield:removeTp()
		if getTileItemById(self.joinpos, 1387).uid > 0 then
			doRemoveItem(getTileItemById(self.joinpos, 1387).uid)
		end
	end


	function battlefield:removeWalls()
		for _, it in ipairs(self.walls) do
			if getThingfromPos(it.position).itemid == it.id then
				doRemoveItem(getThingfromPos(it.position).uid, 1)
			end
			doSendMagicEffect(it.position, CONST_ME_POFF)
		end
		
		self:sendCancel('Paredes removidas.')
	end


	function battlefield:createWalls()
		for _, it in ipairs(self.walls) do
			if getThingfromPos(it.position).itemid ~= it.id then
				doCreateItem(it.id, 1, it.position)
			end
		end
	end


	function battlefield:players()
		local players = {}

		for _, pid in ipairs(getPlayersOnline()) do
			if self:playerState(pid) == 1 then
				table.insert(players, pid)
			end
		end

		return players
	end


	function battlefield:getPlayersByTeam(team)
		local players = {}

		for _, pid in ipairs(self:players()) do
			if self:playerTeam(pid) == team then
				table.insert(players, pid)
			end
		end

		return players
	end


	function battlefield:sendCancel(msg)
		for _, pid in ipairs(self:players()) do
			doPlayerSendCancel(pid, msg)
		end
	end


	function battlefield:sendMessage(msg, type)
		local t = {}

		for _, pid in ipairs(getPlayersOnline()) do
			if getPlayerAccess(pid) > 2 then
				table.insert(t, pid)
			end
		end

		for _, pid in ipairs(self:players()) do
			table.insert(t, pid)
		end

		for _, pid in ipairs(t) do
			doPlayerSendTextMessage(pid, not type and MESSAGE_STATUS_CONSOLE_BLUE or type, msg)
		end
	end


	function battlefield:initCountdown(restart)
		local n = 0

		local function decrease()
			local time = self.time.start - n
			if time > 0 then
				self:sendCancel('Aguarde, o Battlefield começa em ' .. string.diff(time, true))
				n = n + 1

				addEvent(function()
					if self:eventState() == BF_STATE_WAITING then
						decrease()
					end
				end, 1000)
			else
				self:startgame(restart)
			end
		end

		decrease()
	end


	function battlefield:finishCountdown(team)
		local n = 0

		local function decrease()
			local time = self.time.finish - n
			if time > 0 then
				self:sendCancel('Finalizando, o Battlefield encerra em ' .. string.diff(time, true))
				n = n + 1

				addEvent(function()
					if self:eventState() == BF_STATE_ENDING then
						decrease()
					end
				end, 1000)
			else
				self:reward(team)
			end
		end

		decrease()
	end


	function battlefield:wallsCountdown()
		local n = 0

		local function decrease()
			local time = self.time.wall - n
			if time > 0 then
				self:sendCancel('As paredes serão removidas em ' .. string.diff(time, true))
				n = n + 1

				addEvent(function()
					if self:eventState() == BF_STATE_GAME then
						decrease()
					end
				end, 1000)
			else
				self:removeWalls()
			end
		end

		decrease()
	end


	function battlefield:reward(team)
		if team then
			for _, pid in pairs(self:getPlayersByTeam(team)) do
				for _, item in ipairs(self.rewards) do
					doPlayerAddItem(pid, item[1], item[2])
				end
			end
		end
		
		self:close()
	end

	function battlefield:banPopup(player)
		local string = 'Você foi temporariamente banido do Battlefield.\nExpira: %s às %s'
		doPlayerPopupFYI(player, string:format(string.date(self:ban(player)), os.date('%X', self:ban(player)):sub(1, 5)))
	end


	battlefield.storages = {global = {state = 334450}, player = {state = 334550, team = 334551, ban = 334552}}

	function battlefield:regen(player)
		return doCreatureAddHealth(player, getCreatureMaxHealth(player), nil, nil, true), doCreatureAddMana(player, getCreatureMaxMana(player))
	end

	function battlefield:getEnemyTeam(player)
		return self:playerTeam(player) == 1 and 2 or 1
	end
	
	function battlefield:eventState(state)
		if state == nil then
			return getGlobalStorageValue(self.storages.global.state)
		end
		setGlobalStorageValue(self.storages.global.state, state)
	end

	function battlefield:playerState(player, state)
		if state == nil then
			return getPlayerStorageValue(player, self.storages.player.state)
		end
		setPlayerStorageValue(player, self.storages.player.state, state)
	end

	function battlefield:playerTeam(player, team)
		if team == nil then
			return getPlayerStorageValue(player, self.storages.player.team)
		end
		setPlayerStorageValue(player, self.storages.player.team, team)
	end

	function battlefield:ban(player, time)
		if time == nil then
			return getPlayerStorageValue(player, self.storages.player.ban)
		end
		setPlayerStorageValue(player, self.storages.player.ban, os.time() + time * 60 * 60 * 24)
	end
	
end
