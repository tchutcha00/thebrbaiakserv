function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, 85742) == -1) then
doPlayerSendTextMessage(cid,22,"Voc� ganhou acesso a oramond.") 
setPlayerStorageValue(cid, 85742, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
else
doPlayerSendTextMessage(cid,22,"Voc� j� fez essa quest")
end
return true
end