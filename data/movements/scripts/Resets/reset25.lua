local resets = 25

function onStepIn(cid, item,pos,fromPosition)
if not isPlayer(cid) then
return true
end
  if getPlayerResets(cid) >= resets then
  	doTeleportThing(cid, {x = 1238, y = 1469, z = 7})
  else
    doPlayerPopupFYI(cid, "Você precisa ter ["..resets.."] resets para passar.")
    doTeleportThing(cid, fromPosition, false)
    return true
  end
end