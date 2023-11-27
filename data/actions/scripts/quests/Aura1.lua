function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, 89123) == -1) then
doPlayerSendTextMessage(cid,22,"You won Aura Level 1.") 
setPlayerStorageValue(cid, 89123, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
else
doPlayerSendTextMessage(cid,22,"You already got your Aura Level 1.")
end
return true
end