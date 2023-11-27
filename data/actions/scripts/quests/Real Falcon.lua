function onUse(cid, item, frompos, item2, topos)
if item.uid == 14657 then
queststatus = getPlayerStorageValue(cid,54637)
if queststatus == -1 or queststatus == 0 then
doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Real Falcon ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da Real Falcon!! Parabéns guerreiro!")
item_uid = doPlayerAddItem(cid,12746,1) -- item_uid = doPlayerAddItem(cid,2160~id do item~,100~Quantidade~)
setPlayerStorageValue(cid,54637,1)
else
doPlayerSendTextMessage(cid,22,"Você já fez essa quest.") -- ira aprecer quando vc ja tiver pego e tentar dnv
end
else
return 0
end
return 1
end