function onSay(cid, words, param)
  if(not checkExhausted(cid, 7384, 3)) then
    return true
  end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu level atual de mineração é: "..getPlayerStorageValue(cid, 20000).." ")
end