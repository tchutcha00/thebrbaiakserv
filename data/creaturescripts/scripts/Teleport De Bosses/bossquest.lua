local tpId = 1387
local tps = {
  ["Scorn of the Emperor"] = {pos = {x=833, y=1176, z=14}, toPos = {x=800, y=1195, z=14}, time = 120},
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
    doCreatureSay(cid, "O teleport ir� sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
    addEvent(removeTp, tp.time*1000, tp)
  end
  return TRUE
end