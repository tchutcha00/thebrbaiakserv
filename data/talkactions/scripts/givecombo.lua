function onSay(cid, words, param, channel)
    local filtered = {}
    for _, id in ipairs(getPlayersOnline()) do
        filtered[getPlayerIp(id)] = true
    end

    for i, tid in ipairs(filtered) do
    doPlayerAddItem(tid,6542)
    doPlayerAddItem(tid,6543)
    doPlayerAddItem(tid,6544)
    doPlayerAddItem(tid,6545)
	doPlayerAddItem(tid,2328)
	doPlayerAddItem(tid,6541)
    end
    doBroadcastMessage(getPlayerName(cid) .. " acabou de dar um COMBO para todos os player online.")
    doBroadcastMessage(getPlayerName(cid) .. " acabou de dar um COMBO para todos os player online.", MESSAGE_STATUS_CONSOLE_BLUE)
    return true
end