function onLogout(cid)
	local player = Player(cid)
	Zombie:onLeave(player)
	return true
end

function onThink(cid)
	local player = Player(cid)

	if Zombie:eventState() ~= EVENT_STATE_CLOSED then
		if player:getIp() == 0 then
			Zombie:onLeave(player)
		end
	end

	return true
end

function onCombat(creature, target)
	creature = Creature(creature)
	target = Player(target)
	return Zombie:onTargetCombat(creature, target)
end