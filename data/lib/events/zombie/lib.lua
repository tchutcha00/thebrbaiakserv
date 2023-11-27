 dofile('data/lib/events/zombie/config.lua')
local events = {'ZombieThink', 'ZombieCombat'}

EVENT_STATE_CLOSED = -1
EVENT_STATE_WAITING = 0
EVENT_STATE_GAME = 1
EVENT_STATE_ENDING = 2

if not zombieLock then
	zombieLock = {
		playerData = {},
		state = EVENT_STATE_CLOSED,
		timeleft = 0,
		zombies = {}
	}
end

Zombie.storages = {inGame = 722690}

function Zombie:open()
	if self:eventState() ~= EVENT_STATE_CLOSED then
		return false
	end
		
	local item = Game.createItem(1387, 1, self.joinpos)
	doItemSetAttribute(item, 'aid', self.teleportActionId)

	self:initCountdown()
	self:broadcastMessage('O evento foi aberto. Para participar, vá até o teleport localizado na area de eventos no templo.', MESSAGE_EVENT_ADVANCE)
	return true
end

function Zombie:close(manual)
	if self:eventState() == EVENT_STATE_CLOSED then
		return false
	end

	self:removeTp()
	self:eventState(EVENT_STATE_CLOSED)
	
	for _, player in pairs(self:players()) do
		self:onLeave(player)
	end

	self:clearZombies()
	zombieLock.timeleft = 0
	return true
end

function Zombie:onJoin(player)
	if self:isParticipant(player) then
		return false
	end
	
	if player:getAccess() > 2 then
		self:teleportTo(player, self.waitpos)
		return true
	end
	
	if self:eventState() ~= EVENT_STATE_WAITING then
		self:sendCancel('Ops, parece que você se atrasou, o Zombie já começou.')
		return false
	end
	
	if self:ban(player) > os.time() then
		self:banPopup(player)
		return false
	end

	if player:getLevel() < self.minlevel then
		player:sendCancelMessage('Apenas jogadores com nível ' .. self.minlevel .. ' ou superior podem entrar.')
		return false
	end

	if self.antimc then
		for _, it in ipairs(self:players()) do
			if it:getIp() == player:getIp() then
				player:sendCancelMessage('Você não pode participar com multiplos personagens.')
				return false
			end
		end
	end

	for _, event in ipairs(events) do
		player:registerEvent(event)
	end
	
	self:teleportTo(player, self.waitpos)
	self:regen(player)
	zombieLock.playerData[player:getId()] = {team = 1}
	doRemoveCondition(player.cid, CONDITION_INVISIBLE)
	playingEvent(player.cid, FUNEVENT_ZOMBIE)
	return true
end

function Zombie:onLeave(player)
	if not self:isParticipant(player) then
		return false
	end

	for _, event in ipairs(events) do
		player:unregisterEvent(event)
	end
	
	self:teleportTo(player, self.exitpos)
	self:regen(player)

	zombieLock.playerData[player:getId()] = nil
	self:checkFinish()
	playingEvent(player.cid, FUNEVENT_NONE)
end

function Zombie:startgame()
	if self:eventState() ~= EVENT_STATE_WAITING then
		return
	end
	
	if #self:players() < self.minplayers then
		self:broadcastMessage('O evento foi encerrado por não ter a quantidade mínima de participantes.', MESSAGE_EVENT_ADVANCE)
		self:close()
		return false
	end	
	
	self:removeTp()
	self:sendCancel('O Zombie foi iniciado.')
	self:broadcastMessage('O evento foi iniciado, boa sorte aos participantes.', MESSAGE_EVENT_ADVANCE)
	self:eventState(EVENT_STATE_GAME)

	for _, player in ipairs(self:players()) do
		self:teleportTo(player, self.arenaPosition)
	end

	zombieLock.timeleft = os.time() + self.time.left
	addEvent(function()
		self:spawnZombies()
	end, self.timeToStartSpawn * 1000)
end

function Zombie:spawnZombies()
	if self:eventState() ~= EVENT_STATE_GAME then
		return
	end

	self:broadcastMessage('Os zombies começaram a aparecer, fujam e sobrevivam!')
	local function decrease()
		if self:eventState() ~= EVENT_STATE_GAME then
			return
		end

		if #zombieLock.zombies < self.zombieMaxSpawns then
			local x = math.random(self.topPosition.x, self.bottomPosition.x)
            local y = math.random(self.topPosition.y, self.bottomPosition.y)
            local position = Position(x, y, self.topPosition.z)

            if isWalkable(position, false, true, false) then
				local zombie = doCreateMonster('Zombie Event', position)
				doSendMagicEffect(position, CONST_ME_TELEPORT)
				if zombie then
					Creature(zombie):registerEvent('ZombieCombat')
					table.insert(zombieLock.zombies, zombie)
				end
			end	
			addEvent(decrease, self.zombieSpawnTime * 1000)
		end
	end

	decrease()
end

function Zombie:clearZombies()
	for _, zombie in ipairs(zombieLock.zombies) do
		if isCreature(zombie) then
			doSendMagicEffect(Creature(zombie):getPosition(), CONST_ME_POFF)
			Creature(zombie):remove()
		end
	end
	zombieLock.zombies = {}
end

function Zombie:onTargetCombat(creature, target)
	if self:eventState() == EVENT_STATE_CLOSED then
		return true
	end

	if creature:isPlayer() and self:isParticipant(creature) then
		return false
	end

	if self:eventState() == EVENT_STATE_GAME and creature:getName() == 'Zombie Event' then
		doSendMagicEffect(target:getPosition(), CONST_ME_MORTAREA)
		self:sendMessage(MESSAGE_STATUS_CONSOLE_RED, target:getName() .. ' foi infectado.')
		target:sendTextMessage(MESSAGE_INFO_DESCR, 'Você foi infectado e foi removido do evento.')
		self:onLeave(target)
	end
	return false
end

function Zombie:players()
	local players = {}

	for id in pairs(zombieLock.playerData) do
		if isPlayer(id) then
			table.insert(players, Player(id))
		end
	end

	return players
end

function Zombie:eventState(state)
	if state == nil then
		return zombieLock.state
	end
	zombieLock.state = state
end

function Zombie:isParticipant(player)
	return zombieLock.playerData[player:getId()] ~= nil
end

function Zombie:playerTeam(player, team)
	local id = player:getId()
	local data = zombieLock.playerData[id]
	if not data then
		return 0
	end

	if team == nil then
		return data.team
	end
	data.team = team
end

function Zombie:checkFinish()
	if self:eventState() ~= EVENT_STATE_GAME then
		return
	end
	
	if #self:players() == 1 then
		local winner = self:players()[1]
		self:finishCountdown(winner)
		self:broadcastMessage('O participante ' .. winner:getName() .. ' foi o último sobrevivente e venceu o evento.')
		self:clearZombies()
	end
end

function Zombie:initCountdown()
	local n = 0

	self:eventState(EVENT_STATE_WAITING)
	local function decrease()
		local time = self.time.start - n
		if time > 0 then
			if self:eventState() ~= EVENT_STATE_WAITING then
				return
			end

			n = n + 1
			self:sendCancel('Aguarde, o Zombie começa em ' .. string.diff(time, true))
			addEvent(decrease, 1000)
		else
			self:startgame()
		end
	end

	decrease()
end

function Zombie:finishCountdown(winner)
	local n = 0
	
	self:eventState(EVENT_STATE_ENDING)
	local function decrease()
		local time = self.time.finish - n
		if time > 0 then
			if self:eventState() ~= EVENT_STATE_ENDING then
				return
			end

			n = n + 1
			self:sendCancel('Finalizando, o Zombie encerra em ' .. string.diff(time, true))
			addEvent(decrease, 1000)
		else
			self:giveReward(winner)
		end
	end

	decrease()
end

function Zombie:giveReward(winner)
	if winner then
		for _, item in ipairs(self.rewards) do
			winner:addItem(item[1], item[2], false)
		end
	end
	self:close()
end

function Zombie:broadcastMessage(message, type)
	broadcastMessage('[Zombie]: ' .. message, type)
end

function Zombie:regen(player)
	player:addHealth(player:getMaxHealth())
	player:addMana(player:getMaxMana())
end

function Zombie:ban(player, time, ignorePopup)
	if time == nil then
		return player:getStorageValue(self.banStorage)
	end
	player:setStorageValue(self.banStorage, os.time() + time * 60 * 60 * 24)
	if not ignorePopup and time > 0 then
		self:banPopup(player)
	end
end

function Zombie:banPopup(player)
	local string = 'Você foi temporariamente banido do Zombie.\nExpira: %s às %s'
	player:popupFYI(string:format(string.date(self:ban(player), true), os.date('%X', self:ban(player)):sub(1, 5)))
end

function Zombie:sendCancel(message)
	for _, player in ipairs(self:players()) do
		player:sendCancelMessage(message)
	end
end

function Zombie:sendMessage(type, message)
	for _, player in ipairs(self:players()) do
		player:sendTextMessage(type or MESSAGE_STATUS_DEFAULT, message)
	end
end

function Zombie:removeTp()
	if getTileItemById(self.joinpos, 1387).uid > 0 then
		doRemoveItem(getTileItemById(self.joinpos, 1387).uid)
	end
end

function Zombie:teleportTo(player, pos)
	player:teleportTo(pos)
	doSendMagicEffect(pos, CONST_ME_TELEPORT)
end