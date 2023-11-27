function onSay(cid, words, param)
  if(not checkExhausted(cid, 7384, 3)) then
    return true
  end

  local config = {
    bankSystemEnabled = getBooleanFromString(getConfigInfo('bankSystem'))
  }

  if config.bankSystemEnabled == TRUE then

      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Alright, you have added the amount of " .. getPlayerMoney(cid) .. " gold to your balance. You can withdraw your money anytime you want to.")
      doPlayerDepositAllMoney(cid)
      return TRUE
  else
    return FALSE
  end
end