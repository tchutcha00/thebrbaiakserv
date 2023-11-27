function onStepIn(cid, item, pos, fromPosition)
	local player = Player(cid)
	
	if not Zombie:onJoin(player) then
		player:teleportTo(fromPosition, true)
	end

	return true
end