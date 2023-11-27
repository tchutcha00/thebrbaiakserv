function onThink(interval, lastExecution)
  for _, cid in pairs(getPlayersOnline()) do
    if getPlayerAccess(cid) < 4 then
      doSendAnimatedText(getPlayerPosition(cid), "EXP 2X", 215)
      doSendMagicEffect(getPlayerPosition(cid), 17)
      local spot = getThingPosition(cid)
      doSendDistanceShoot({x = spot.x + 1, y = spot.y + 1, z = spot.z}, spot, 34)
      doSendDistanceShoot({x = spot.x - 1, y = spot.y - 1, z = spot.z}, spot, 34)
      doSendDistanceShoot({x = spot.x + 1, y = spot.y - 1, z = spot.z}, spot, 34)
      doSendDistanceShoot({x = spot.x - 1, y = spot.y + 1, z = spot.z}, spot, 34)
      doSendDistanceShoot({x = spot.x + 1, y = spot.y + 0, z = spot.z}, spot, 34)
      doSendDistanceShoot({x = spot.x + 0, y = spot.y + 1, z = spot.z}, spot, 34)
      doSendDistanceShoot({x = spot.x - 1, y = spot.y + 0, z = spot.z}, spot, 34)
      doSendDistanceShoot({x = spot.x + 0, y = spot.y - 1, z = spot.z}, spot, 34)
    end
  end
  return true
end