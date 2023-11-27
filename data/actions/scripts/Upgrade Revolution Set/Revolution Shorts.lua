local req = {
{i=2159, q=100}, -- i = id do item, q=quantidade
{i=12756, q=1} -- i = id do item, q=quantidade
}
local win = {i=9777, q=1} -- i = id do item, q = quantidade que vai receber
function onUse(cid, item, frompos, item2, topos)

if getPlayerItemCount(cid, req[1].i) >= req[1].q and getPlayerItemCount(cid, req[2].i) >= req[2].q then
doPlayerRemoveItem(cid, req[1].i, req[1].q)
doPlayerRemoveItem(cid, req[2].i, req[2].q) 
doPlayerAddItem(cid, win.i, win.q)
doCreatureSay(cid, "Parabéns você fez upgrade.", TALKTYPE_ORANGE_1)
doSendMagicEffect(getCreaturePosition(cid), math.random(30,30))
else
doPlayerPopupFYI(cid, "voce precisa de:\n*100 revolution coins\n*real shorts\n\npara realizar o upgrade.")
end
return true
end
