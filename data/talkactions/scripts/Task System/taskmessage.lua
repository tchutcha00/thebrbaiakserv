function onSay(cid, words, param)
  if(not checkExhausted(cid, 7384, 3)) then
    return true
  end
  
	param = param:lower()
	
	if param == 'on' then
		setPlayerStorageValue(cid, STORAGEVALUE_TASKMESSAGE, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você ativou o contador de kills da task.')
	elseif param == 'off' then
		setPlayerStorageValue(cid, STORAGEVALUE_TASKMESSAGE, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você desativou o contador de kills da task.')
	else
		doPlayerSendCancel(cid, 'Informe on ou off.')
	end
	
	return true
end