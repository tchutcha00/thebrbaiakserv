function onUse(cid, item, fromPosition, itemEx, toPosition)

if not isPlayer(itemEx.uid) then return true end

if isKnight(cid) then
return true
end

if exhaustion.check(cid, 33434) == TRUE then
return true
end

local mana = 0
local lvl_caster = getPlayerLevel(cid)
local multiplier = 10000 * getPlayerResets(cid)

if isSorcerer(cid) or isDruid(cid) then
mana = math.random(math.ceil(((lvl_caster / 00.2) + (multiplier))), math.ceil(((lvl_caster / 00.1) + (multiplier))))
else
mana = math.random(math.ceil(((lvl_caster / 00.1) + (multiplier))), math.ceil(((lvl_caster / 00.1) + (multiplier)))+10)
end

doPlayerAddMana(itemEx.uid, mana)

doSendMagicEffect(getCreaturePos(itemEx.uid), 14)

exhaustion.set(cid, 33434, 1)
addEvent(function()
if not isPlayer(cid) then return true end
exhaustion.set(cid, 33434, -1)
end, 1000)

return true
end