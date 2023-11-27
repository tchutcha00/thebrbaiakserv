function onSay(cid, words, param)
  if(not checkExhausted(cid, 7384, 3)) then
    return true
  end
  
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your account balance is ".. getPlayerBalance(cid) .." gold.")
  return true
end