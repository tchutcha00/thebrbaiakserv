function onUse(cid, item, frompos, item2, topos)
if item.uid == 21437 then
queststatus = getPlayerStorageValue(cid,21437)
if queststatus == -1 or queststatus == 0 then
doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Real Boots ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da Real Boots!! Parabéns guerreiro!")
item_uid = doPlayerAddItem(cid,12770,1)
setPlayerStorageValue(cid,21437,1)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest.")
end
else
return 0
end
return 1
end