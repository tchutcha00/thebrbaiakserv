local tpId = 1387
local tps = {
  ["Alpha Tower"] = {pos = {x = 983, y = 1619, z = 3}, toPos = {x = 115, y = 80, z = 7}, time = 500},
}

function removeTp(tp)
  local t = getTileItemById(tp.pos, tpId)
  if t then
    doRemoveItem(t.uid, 1)
    doSendMagicEffect(tp.pos, CONST_ME_POFF)
  end
end

function onDeath(cid)
  local tp = tps[getCreatureName(cid)]
  if tp then
    doCreateTeleport(tpId, tp.toPos, tp.pos)
    addEvent(removeTp, tp.time*1000, tp)
  end
  return TRUE
end