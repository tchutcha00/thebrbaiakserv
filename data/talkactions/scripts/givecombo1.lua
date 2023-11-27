function onSay(cid, words, param, channel)
  for i, tid in ipairs(getPlayersOnline()) do
    doPlayerAddItem(tid,6542)
    doPlayerAddItem(tid,6543)
    doPlayerAddItem(tid,6544)
    doPlayerAddItem(tid,6545)
	doPlayerAddItem(tid,2328)
	doPlayerAddItem(tid,6541)
	doPlayerAddItem(tid,12599)
	doPlayerAddItem(tid,8300)
  end
  doBroadcastMessage(getPlayerName(cid) .. " acabou de dar um COMBO FULL para todos os player online.")
  doBroadcastMessage(getPlayerName(cid) .. " acabou de dar um COMBO FULL para todos os player online.", MESSAGE_STATUS_CONSOLE_BLUE)
  return true
end