function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, 79432) == -1) then
doPlayerSendTextMessage(cid,22,"Você ganhou acesso a Roshamuul.") 
setPlayerStorageValue(cid, 79432, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest")
end
return true
end