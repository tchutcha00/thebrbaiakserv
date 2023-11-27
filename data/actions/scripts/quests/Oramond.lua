function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, 85742) == -1) then
doPlayerSendTextMessage(cid,22,"Você ganhou acesso a oramond.") 
setPlayerStorageValue(cid, 85742, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest")
end
return true
end