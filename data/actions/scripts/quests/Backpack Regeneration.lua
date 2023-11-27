function onUse(cid, item, frompos, item2, topos)
if item.uid == 9881 then
queststatus = getPlayerStorageValue(cid,9881)
if queststatus == -1 or queststatus == 0 then
item_uid = doPlayerAddItem(cid,12670,1) -- item_uid = doPlayerAddItem(cid,2160~id do item~,100~Quantidade~)
doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Backpack Regeneration ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
setPlayerStorageValue(cid,9881,1)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest.") -- ira aprecer quando vc ja tiver pego e tentar dnv
end
else
return 0
end
return 1
end