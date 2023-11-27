function onUse(cid, item, frompos, item2, topos)
if item.uid == 38497 then
queststatus = getPlayerStorageValue(cid,34675)
if queststatus == -1 or queststatus == 0 then
doBroadcastMessage("[Information:] Bem-vindo "..getCreatureName(cid).." entrou no servidor e resgatou uma [Absolute Arma] Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
item_uid = doPlayerAddItem(cid,12711,1)
setPlayerStorageValue(cid,34675,1)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest.")
end
else
return 0
end
return 1
end