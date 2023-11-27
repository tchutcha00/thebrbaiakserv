function onUse(cid, item, frompos, item2, topos)
if item.uid == 57490 then
queststatus = getPlayerStorageValue(cid,45869)
if queststatus == -1 or queststatus == 0 then
doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Starlix Backpack ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)

item_uid = doPlayerAddItem(cid,12720,1)
setPlayerStorageValue(cid,45869,1)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest.")
end
else
return 0
end
return 1
end