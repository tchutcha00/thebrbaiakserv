local resets = 30

function onStepIn(cid, item,pos,fromPosition)
if not isPlayer(cid) then
return true
end
  if getPlayerResets(cid) >= resets then

  else
    doPlayerPopupFYI(cid, "Você precisa ter ["..resets.."] resets para passar.")
    doTeleportThing(cid, fromPosition, false)
    return true
  end
end