function onCombat(cid, target)
if isPlayer(target) then
local a, b = getPlayerParty(cid), getPlayerParty(target)
if a and b and a == b then
return false
end
end
return true
end