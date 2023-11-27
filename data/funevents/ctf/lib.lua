require('data/funevents/ctf/config')
local events = {'CTFCombat', 'CTFDeath', 'CTFThink'}

CTF_STATE_CLOSED = -1
CTF_STATE_WAITING = 0
CTF_STATE_GAME = 1
CTF_STATE_ENDING = 2

if CTF then

	function CTF:open()
		if self:eventState() ~= CTF_STATE_CLOSED then
			return false
		end

		broadcastMessage('[Capture The Flag]: O evento foi aberto. Para participar, utilize !ctf join ou vá até o teleport localizado no templo.', MESSAGE_EVENT_ADVANCE)
		local item = doCreateItem(1387, 1, self.joinpos)
		doItemSetAttribute(item, 'aid', 33840)

		self:eventState(CTF_STATE_WAITING)

		self:initCountdown()
		return true
	end


	function CTF:close()
		if self:eventState() == CTF_STATE_CLOSED then
			return false
		end

		for _, pid in pairs(self:players()) do
			self:onLeave(pid)
		end

		self:removeTeamFlag(1)
		self:removeTeamFlag(2)

		self.timeleft = nil

		self:eventState(CTF_STATE_CLOSED)
		return true
	end


	function CTF:onJoin(player, manual)
		if self:eventState() == CTF_STATE_CLOSED or self:playerState(player) == 1 then
			return false
		end

		if getPlayerAccess(player) > 2 then
			return self:teleportTo(player, self:eventState() == CTF_STATE_WAITING and self.waitpos or self.teams[math.random(2)].solo)
		end

		if self:eventState() == CTF_STATE_WAITING then
			if self:ban(player) > os.time() then
				return false, self:banPopup(player)
			end

			if getPlayerLevel(player) < self.game.min.level then
				return false, doPlayerSendCancel(player, 'Apenas jogadores com nível ' .. self.game.min.level .. ' ou superior podem entrar.')
			end

			if self.game.antimc then
				for _, pid in ipairs(self:players()) do

					if getPlayerIp(player) == getPlayerIp(pid) then
						return false, doPlayerSendCancel(player, '[Anti Multi Client]: Não foi possível participar.')
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

		end

		return true
	end


	function CTF:onLeave(player, r)
		if self:playerState(player) < 1 then
			return true
		end

		for _, ev in ipairs(events) do
			unregisterCreatureEvent(player, ev)
		end

		if not r then
			self:teleportTo(player, getTownTemplePosition(getPlayerTown(player)))
			self:regen(player)
		end

		doRemoveCondition(player, CONDITION_OUTFIT)

		if self:withFlag(player) then
			self:withFlag(player, false)
			self:dropFlag(self:getEnemyTeam(player))
		end

		self:playerTeam(player, 0)
		self:playerState(player, 0)
		doCreatureSetDropLoot(player, true)
		doPlayerSave(player)
		return true
	end


	function CTF:onDeath(player)
		self:teleportTo(player, self.deadpos)
		self:regen(player)

		if self:withFlag(player) then
			self:withFlag(player, false)
			self:dropFlag(self:getEnemyTeam(player))

			self:changeOutfit(player, self:playerTeam(player))

			self:sendMessage(getCreatureName(player) .. ' dropou a bandeira do ' .. self:getTeamName(self:getEnemyTeam(player)) .. ' após ser abatido.', MESSAGE_STATUS_CONSOLE_BLUE)
		end

		local function deathCountdown()
			local n = 0

			local function decrease()
				local time = self.time.death - n
				if time > 0 then
					doPlayerSendCancel(player, 'Você morreu, aguarde '.. string.diff(time, true))
					n = n + 1

					addEvent(function()
						if self:eventState() == CTF_STATE_GAME then
							decrease()
						end
					end, 1000)
				else
					self:teleportTo(player, self.teams[self:playerTeam(player)].solo)
					doPlayerSendCancel(player, 'Você foi ressuscitado.')
				end
			end

			decrease()
		end

		deathCountdown()
		return false
	end


	function CTF:formTeams()
		local function sortByValue(t, func)
		 	local keys = {}

			for key in pairs(t) do
		    	table.insert(keys, key)
		  	end

		  	table.sort(keys, function(a, b) return func(t[a], t[b]) end)

		  	return keys
		end

		local function resets()
			local players = {}

			for _, pid in ipairs(self:players()) do
		   		players[pid] = getPlayerLevel(pid)
			end

			return players
		end

		for i, pid in ipairs(sortByValue(resets(), function(a, b) return a < b end)) do
			local team = i %2 == 0 and 2 or 1

			self:joinPlayer(pid, team)
		end

		self:teamScore(1, 0)
		self:teamScore(2, 0)
	end


	function CTF:joinPlayer(player, team)
		if getPlayerAccess(player) > 2 then
			return false
		end

		self:teleportTo(player, self.teams[team].solo)

		self:playerTeam(player, team)
		self:changeOutfit(player, team)

		self:withFlag(player, false)
		return doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, 'Você se juntou ao ' .. self:getTeamName(team) .. '.')
	end


	function CTF:switchTeams()
		if self:eventState() ~= CTF_STATE_GAME then
			return false
		end

		local red, blue = {}, {}

		for team = 1, 2 do
			for _, pid in ipairs(self:getPlayersByTeam(team)) do
				table.insert(team == 1 and blue or red, pid)

				if self:withFlag(pid) then
					self:dropFlag(self:getEnemyTeam(pid))
					self:withFlag(pid, false)
				end
			end
		end

		local scores = {}

		for i = 1, 2 do
			for _, pid in ipairs(i == 1 and red or blue) do
				self:changeOutfit(pid, i)
				self:playerTeam(pid, i)
			end

			self:teleportTeam(i)
			scores[i] = self:teamScore(i)
		end

		self:teamScore(1, scores[2])
		self:teamScore(2, scores[1])

		self:eventState(CTF_STATE_GAME)
		return true
	end


	function CTF:changeOutfit(player, team, flag)
		local color = team == 1 and 94 or 105

		local outfit = {
			lookType = flag and (getPlayerSex(player) == 0 and 324 or 325) or (getPlayerSex(player) == 0 and 136 or 128),
			lookHead = 0,
			lookBody = color,
			lookLegs = color,
			lookFeet = 0,
			lookAddons = flag and 3 or 0
		}

		return doSetCreatureOutfit(player, outfit)
	end


	function CTF:startgame(r)
		if self:eventState() ~= CTF_STATE_WAITING then
			return false
		end

		self:removeTp()

		if #self:players() < self.game.min.players then
			broadcastMessage('[Capture The Flag]: O evento foi encerrado por não ter a quantidade mínima de participantes.', MESSAGE_EVENT_ADVANCE)

			return self:close()
		end

		self:dropFlag(1)
		self:dropFlag(2)

		self:eventState(CTF_STATE_GAME)

		self:formTeams()

		if not r then
			broadcastMessage('[Capture The Flag]: O evento começou, capture a bandeira do time adversário ' .. self.game.goals .. ' vezes para vencer. Boa sorte à todos.', MESSAGE_EVENT_ADVANCE)
		end

		self:timeLeft(not self.timeleft and 0 or self.timeleft)
		self:sendCancel('O Capture The Flag foi iniciado.')
	end


	function CTF:restartGame()
		if self:eventState() ~= CTF_STATE_GAME then
			return false
		end

		self:eventState(CTF_STATE_WAITING)

		for _, pid in ipairs(self:players()) do
			self:onLeave(pid, true)
			self:onJoin(pid)
		end

		self:initCountdown(true)
		return true
	end


	function CTF:goal(player)
		local team = self:playerTeam(player)

		self:teamScore(team, self:teamScore(team) + 1)

		self:withFlag(player, false)
		self:dropFlag(self:getEnemyTeam(player))

		self:changeOutfit(player, self:playerTeam(player))
		doSendMagicEffect(getThingPos(player), 6)

		self:sendMessage(getCreatureName(player) .. ' marcou um ponto para o ' .. self:getTeamName(team) .. '.', MESSAGE_STATUS_CONSOLE_BLUE)
		self:sendMessage('Red: [' .. self:teamScore(1) .. '] versus [' .. self:teamScore(2) .. '] :Blue', MESSAGE_STATUS_CONSOLE_ORANGE)

		if self:teamScore(team) >= self.game.goals then
			doBroadcastMessage('[Capture The Flag]: O ' .. self:getTeamName(team) .. ' acaba de vencer o evento com um placar de ' .. self:teamScore(team) .. ' x ' .. self:teamScore(self:getEnemyTeam(player)) .. '.', MESSAGE_EVENT_ADVANCE)

			self:eventState(CTF_STATE_ENDING)
			self:finishCountdown(team)
		end
	end


	function CTF:teleportTo(player, pos)
		return doTeleportThing(player, pos), not isPlayerGhost(player) and doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end


	function CTF:teleportTeam(team)
		for _, pid in ipairs(self:getPlayersByTeam(team)) do
			self:teleportTo(pid, self.teams[team].solo)
		end
	end


	function CTF:flagAnimation(player)
		doSendAnimatedText(getThingPos(player), 'Flag !', self:getEnemyTeam(player) == 1 and 144 or 23)
		doSendMagicEffect(getThingPos(player), self:playerTeam(player) == 1 and 12 or 13)
		addEvent(function()
			if isCreature(player) then
				if self:eventState() == CTF_STATE_GAME and (self:playerState(player) == 1 and self:withFlag(player)) then
					self:flagAnimation(player)
				end
			end
		end, self.game.effectperiod)
	end


	function CTF:dropFlag(team)
		doCleanTile(self.teams[team].flag.pos)

		local flag = doCreateItem(self.teams[team].flag.id, 1, self.teams[team].flag.pos)
		doItemSetAttribute(flag, 'aid', 29816 + team)
		doSendMagicEffect(self.teams[team].flag.pos, 6)
	end


	function CTF:captureFlag(player, obj)
		if self:eventState() ~= CTF_STATE_GAME or obj.actionid == 29816 + self:playerTeam(player) then
			return true
		end

		doRemoveItem(obj.uid)
		self:withFlag(player, true)
		self:flagAnimation(player)

		self:changeOutfit(player, self:playerTeam(player), true)

		self:sendMessage(getCreatureName(player) .. ' capturou a bandeira do ' .. self:getTeamName(self:getEnemyTeam(player)) .. '.', MESSAGE_STATUS_CONSOLE_BLUE)
		return true
	end


	function CTF:findFlag(team)
		local uid = getTileItemById(self.teams[team].flag.pos, self.teams[team].flag.id).uid
		return uid > 0 and uid
	end


	function CTF:removeTeamFlag(team)
		return self:findFlag(team) and doRemoveItem(self:findFlag(team))
	end


	function CTF:removeTp()
		local uid = getTileItemById(self.joinpos, 1387).uid

		if uid > 0 then
			doRemoveItem(uid)
		end
	end


	function CTF:players()
		local players = {}

		for _, pid in ipairs(getPlayersOnline()) do
			if isCreature(pid) then
				if self:playerState(pid) == 1 then
					table.insert(players, pid)
				end
			end
		end

		return players
	end


	function CTF:getPlayersByTeam(team)
		local players = {}

		for _, pid in ipairs(self:players()) do
			if self:playerTeam(pid) == team then
				table.insert(players, pid)
			end
		end

		return players
	end


	function CTF:sendCancel(msg)
		for _, pid in ipairs(self:players()) do
			doPlayerSendCancel(pid, msg)
		end
	end


	function CTF:sendMessage(msg, type)
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


	function CTF:initCountdown(r)
		local n = 0

		local function decrease()
			local time = self.time.start - n
			if time > 0 then
				self:sendCancel('Aguarde, o Capture The Flag começa em '.. string.diff(time, true))
				n = n + 1

				addEvent(function()
					if self:eventState() == CTF_STATE_WAITING then
						decrease()
					end
				end, 1000)
			else
				self:startgame(r)
			end
		end

		decrease()
	end


	function CTF:finishCountdown(team)
		local n = 0

		local function decrease()
			local time = self.time.finish - n
			if time > 0 then
				self:sendCancel('Finalizando, o Capture The Flag encerra em '.. string.diff(time, true))
				n = n + 1

				addEvent(function()
					if self:eventState() == CTF_STATE_ENDING then
						decrease()
					end
				end, 1000)
			else
				self:reward(team)
			end
		end

		decrease()
	end


	function CTF:getTeamByHighestScore()
		if self:teamScore(1) == self:teamScore(2) then
			return 0 -- draw game!
		end

		return self:teamScore(1) > self:teamScore(2) and 1 or 2
	end


	function CTF:reward(team)
		if team then
			for _, pid in ipairs(self:getPlayersByTeam(team)) do
				for _, item in ipairs(self.rewards) do
					doPlayerAddItem(pid, item[1], item[2])
				end
			end
		end

		self:close()
	end


	function CTF:banPopup(player)
		if self:ban(player) <= os.time() then
			return false
		end

		local string = 'Você foi temporariamente banido do Capture The Flag.\nExpira: %s às %s'
		doPlayerPopupFYI(player, string:format(string.date(self:ban(player)), os.date('%X', self:ban(player)):sub(1, 5)))
	end


	CTF.storages = {global = {state = 518230, score = 518240, timeleft = 518260}, player = {state = 518230, team = 518231, flag = 518232, ban = 518233}}

	function CTF:regen(player)
		return doCreatureAddHealth(player, getCreatureMaxHealth(player), nil, nil, true), doCreatureAddMana(player, getCreatureMaxMana(player))
	end

	function CTF:getEnemyTeam(player)
		return self:playerTeam(player) == 1 and 2 or 1
	end

	function CTF:getTeamName(team)
		return self.teams[team].name
	end

	function CTF:eventState(state)
		if state == nil then
			return getGlobalStorageValue(self.storages.global.state)
		end
		setGlobalStorageValue(self.storages.global.state, state)
	end

	function CTF:playerState(player, state)
		if state == nil then
			return getPlayerStorageValue(player, self.storages.player.state)
		end
		setPlayerStorageValue(player, self.storages.player.state, state)
	end

	function CTF:playerTeam(player, team)
		if team == nil then
			return getPlayerStorageValue(player, self.storages.player.team)
		end
		setPlayerStorageValue(player, self.storages.player.team, team)
	end

	function CTF:withFlag(player, state)
		if state == nil then
			return getPlayerStorageValue(player, self.storages.player.flag) == 1 and true
		end

		setPlayerStorageValue(player, self.storages.player.flag, state and 1 or 0)
	end

	function CTF:teamScore(team, value)
		if value == nil then
			return getGlobalStorageValue(self.storages.global.score + team)
		end
		setGlobalStorageValue(self.storages.global.score + team, value)
	end

	function CTF:ban(player, time)
		if time == nil then
			return getPlayerStorageValue(player, self.storages.player.ban)
		end
		setPlayerStorageValue(player, self.storages.player.ban, os.time() + time * 60 * 60 * 24)
	end

	function CTF:timeLeft(time)
		if time == nil then
			return getGlobalStorageValue(self.storages.global.timeleft)
		end
		setGlobalStorageValue(self.storages.global.timeleft, os.time() + (time < 1 and self.time.left or time))
	end

	return CTF
end
