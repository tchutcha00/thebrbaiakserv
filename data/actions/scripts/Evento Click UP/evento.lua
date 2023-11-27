function onUse(cid,item)
if (getPlayerStorageValue(cid, 11577) >= os.time()) then
doCreatureSay(cid, "Você só pode usar em  ".. (getPlayerStorageValue(cid, 11577)-os.time()+(1)) .."  segundos. ", TALKTYPE_ORANGE_1)
return TRUE
end
if getPlayerLevel(cid) <= 999999 then
doPlayerAddLevel(cid,50)
doRemoveItem(item.uid,1)
setPlayerStorageValue(cid,11577,os.time()+2)
doSendMagicEffect(getPlayerPosition(cid), 35)
else
doPlayerSendTextMessage(cid, 22, "Você já está level muito alto para participar deste evento.")
end
return TRUE
end