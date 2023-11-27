local ITEM_IDS = {
[12768] = 12766,
[12765] = 12766,
[12766] = 12767,
[12767] = 12765,
[12765] = 12768,
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, 11577) >= os.time()) then
doCreatureSay(cid, "[Arrow Elemental] Você só pode trocar o seu elemento a cada 3 segundos.", TALKTYPE_ORANGE_1)
doSendMagicEffect(toPosition, CONST_ME_POFF)
return true
end
if(not ITEM_IDS[item.itemid]) then
return false
end


doTransformItem(item.uid, ITEM_IDS[item.itemid])
setPlayerStorageValue(cid,11577,os.time()+2)
doDecayItem(item.uid)
return true
end