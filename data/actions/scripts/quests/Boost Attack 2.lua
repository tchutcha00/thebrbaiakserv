function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, 32151) == -1) then
doPlayerSendTextMessage(cid,22,"Você ganhou o efeito do Boost Attack.") 
setPlayerStorageValue(cid, 32151, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest")
end
return true
end