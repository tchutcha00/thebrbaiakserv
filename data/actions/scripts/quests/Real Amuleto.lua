function onUse(cid, item, frompos, item2, topos)
 

voc = getPlayerVocation(cid)

queststatus = getPlayerStorageValue(cid,49502)

 

 
if voc == 1 or getPlayerVocation(cid) == 5 or voc == 2 or getPlayerVocation(cid) == 6 then

if queststatus == -1 then

doPlayerAddItem(cid,12673,1)
doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Real Amuleto ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da Real Amuleto!! Parabéns guerreiro!")
setPlayerStorageValue(cid,49502,1)

else

doPlayerSendTextMessage(cid,22,"Você já fez essa quest.")

end

elseif voc == 3 or getPlayerVocation(cid) == 7 or  voc == 4 or getPlayerVocation(cid) == 8 then

if queststatus == -1 then

doPlayerAddItem(cid,12694,1)
doBroadcastMessage("Information: O Jogador "..getCreatureName(cid).." conseguiu completar a quest [ Real Amuleto ], Parabéns!", MESSAGE_STATUS_CONSOLE_RED)
doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da Real Amuleto!! Parabéns guerreiro!")
setPlayerStorageValue(cid,49502,1)

else

doPlayerSendTextMessage(cid,22,"Você já fez essa quest.")

end

return 1

end

end