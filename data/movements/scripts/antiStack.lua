function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local pro = 0
 	for i = 1, 4 do
  		local thing = getThingfromPos({x = position.x, y = position.y, z = position.z, stackpos = i}).uid
  		if isPlayer(thing) then
   			pro = pro + 1
  		end
 	end
 	if pro > 1 then
  		return doTeleportThing(cid, fromPosition, false)
 	end
end
