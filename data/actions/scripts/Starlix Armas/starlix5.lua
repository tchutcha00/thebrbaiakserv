function onUse(cid, item, frompos, item2, topos)
if item.uid == 56479 then
queststatus = getPlayerStorageValue(cid,45867)
if queststatus == -1 or queststatus == 0 then
doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Starlix Armas ], Parab�ns!", MESSAGE_STATUS_CONSOLE_RED)

item_uid = doPlayerAddItem(cid,12704,1)
setPlayerStorageValue(cid,45867,1)
else
doPlayerSendTextMessage(cid,22,"Voc� j� fez essa quest.")
end
else
return 0
end
return 1
end