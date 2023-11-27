function onUse(cid, item, frompos, item2, topos)
if item.uid == 9771 then
queststatus = getPlayerStorageValue(cid,9771)
if queststatus == -1 or queststatus == 0 then
doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Red Skull Amulet ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)

item_uid = doPlayerAddItem(cid,10133,1)
setPlayerStorageValue(cid,9771,1)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest.")
end
else
return 0
end
return 1
end