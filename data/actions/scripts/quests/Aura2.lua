function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, 89124) == -1) then
doPlayerSendTextMessage(cid,22,"You won Aura Level 2.") 
setPlayerStorageValue(cid, 89124, 1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
else
doPlayerSendTextMessage(cid,22,"You already got your Aura Level 2.")
end
return true
end