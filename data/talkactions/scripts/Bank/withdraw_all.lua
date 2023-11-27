function onSay(cid, words, param)

  if(not checkExhausted(cid, 7384, 3)) then
    return true
  end
  local config = {
    bankSystemEnabled = getBooleanFromString(getConfigInfo('bankSystem'))
  }

  if config.bankSystemEnabled == TRUE then

      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Here you are, " .. getPlayerBalance(cid) .. " gold.")
      doPlayerWithdrawAllMoney(cid)
      return TRUE
  else
    return FALSE
  end
end