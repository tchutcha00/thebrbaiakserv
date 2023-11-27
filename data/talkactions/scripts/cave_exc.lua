local function convertTime(a)
  if(type(tonumber(a)) == "number" and a > 0) then
    if (a <= 3599) then
      local minute = math.floor(a/60)
      local second = a - (60 * minute)
      if(second == 0) then
        return ((minute)..((minute > 1) and " minutos" or " minuto"))
      else
        return ((minute ~= 0) and ((minute>1) and minute.." minutos e " or minute.." minuto e ").. ((second>1) and second.." segundos" or second.." segundo") or ((second>1) and second.." segundos" or second.. " segundo"))
      end
    else
      local hour = math.floor(a/3600)
      local minute = math.floor((a - (hour * 3600))/60)
      local second = (a - (3600 * hour) - (minute * 60))
      if (minute == 0 and second > 0) then
        return (hour..((hour > 1) and " horas e " or " hora e "))..(second..((second > 1) and " segundos" or " segundo"))
      elseif (second == 0 and minute > 0) then
        return (hour..((hour > 1) and " horas e " or " hora e "))..(minute..((minute > 1) and " minutos" or " minuto"))
      elseif (second == 0 and minute == 0) then
        return (hour..((hour > 1) and " horas" or " hora"))
      end
      return (hour..((hour > 1) and " horas, " or " hora, "))..(minute..((minute > 1) and " minutos e " or " minuto e "))..(second..((second > 1) and " segundos" or " segundo"))
    end
  end
end

function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

    if param == "qtd 1" or param == "quantidade 1" then
		if getPlayerStorageValue(cid, 45315) <= 0 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cave Exclusiva] A quantidade de monstros já está registrada como 1 em seu personagem.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cave Exclusiva] Você alterou a quantidade de monstros para 1 (chance = 100%).")
			setPlayerStorageValue(cid, 45315, 0)
		end
    elseif param == "qtd 2" or param == "quantidade 2" then
		if getPlayerStorageValue(cid, 45315) == 1 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cave Exclusiva] A quantidade de monstros já está registrada como 2 em seu personagem.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cave Exclusiva] Você alterou a quantidade de monstros para 2 (chance = 85%).")
			setPlayerStorageValue(cid, 45315, 1)
		end
	elseif param == "qtd 3" or param == "quantidade 3" then
		if getPlayerStorageValue(cid, 45315) == 2 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cave Exclusiva] A quantidade de monstros já está registrada como 3 em seu personagem.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cave Exclusiva] Você alterou a quantidade de monstros para 3 (chance = 60%).")
			setPlayerStorageValue(cid, 45315, 2)
		end
	elseif param == "qtd 4" or param == "quantidade 4" then
		if getPlayerStorageValue(cid, 45315) == 3 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cave Exclusiva] A quantidade de monstros já está registrada como 4 em seu personagem.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Cave Exclusiva] Você alterou a quantidade de monstros para 4 (chance = 50%).")
			setPlayerStorageValue(cid, 45315, 3)
		end
		
	elseif param == "tempo" or param == "time" then
		-- SALA 1
		if getGlobalStorageValue(cid, 30050) - os.time() <= 0 and getPlayerStorageValue(cid, 45319) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45319) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30050) - os.time() > 0 and getPlayerStorageValue(cid, 45319) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45319) - os.time()) ..". (Sala: 1)")
		end
		
		-- SALA 2
		if getGlobalStorageValue(cid, 30051) - os.time() <= 0 and getPlayerStorageValue(cid, 45320) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45320) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30051) - os.time() > 0 and getPlayerStorageValue(cid, 45320) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45320) - os.time()) ..". (Sala: 2)")
		end
		
		-- SALA 3
		if getGlobalStorageValue(cid, 30052) - os.time() <= 0 and getPlayerStorageValue(cid, 45321) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45321) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30052) - os.time() > 0 and getPlayerStorageValue(cid, 45321) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45321) - os.time()) ..". (Sala: 3)")
		end
		
		-- SALA 4
		if getGlobalStorageValue(cid, 30053) - os.time() <= 0 and getPlayerStorageValue(cid, 45322) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45322) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30053) - os.time() > 0 and getPlayerStorageValue(cid, 45322) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45322) - os.time()) ..". (Sala: 4)")
		end
		
		-- SALA 5
		if getGlobalStorageValue(cid, 30054) - os.time() <= 0 and getPlayerStorageValue(cid, 45323) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45323) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30054) - os.time() > 0 and getPlayerStorageValue(cid, 45323) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45323) - os.time()) ..". (Sala: 5)")
		end
		
		-- SALA 6
		if getGlobalStorageValue(cid, 30055) - os.time() <= 0 and getPlayerStorageValue(cid, 45324) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45324) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30055) - os.time() > 0 and getPlayerStorageValue(cid, 45324) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45324) - os.time()) ..". (Sala: 6)")
		end
			
		-- SALA 7
		if getGlobalStorageValue(cid, 30056) - os.time() <= 0 and getPlayerStorageValue(cid, 45325) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45325) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30056) - os.time() > 0 and getPlayerStorageValue(cid, 45325) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45325) - os.time()) ..". (Sala: 7)")
		end
		
		-- SALA 8
		if getGlobalStorageValue(cid, 30057) - os.time() <= 0 and getPlayerStorageValue(cid, 45326) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45326) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30057) - os.time() > 0 and getPlayerStorageValue(cid, 45326) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45326) - os.time()) ..". (Sala: 8)")
		end
		
		-- SALA 9
		if getGlobalStorageValue(cid, 30058) - os.time() <= 0 and getPlayerStorageValue(cid, 45327) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45327) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30058) - os.time() > 0 and getPlayerStorageValue(cid, 45327) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45327) - os.time()) ..". (Sala: 9)")
		end
		
		-- SALA 10
		if getGlobalStorageValue(cid, 30059) - os.time() <= 0 and getPlayerStorageValue(cid, 45328) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45328) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30059) - os.time() > 0 and getPlayerStorageValue(cid, 45328) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45328) - os.time()) ..". (Sala: 10)")
		end
		
		-- SALA 11
		if getGlobalStorageValue(cid, 30060) - os.time() <= 0 and getPlayerStorageValue(cid, 45329) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45329) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30060) - os.time() > 0 and getPlayerStorageValue(cid, 45329) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45329) - os.time()) ..". (Sala: 11)")
		end
		
		-- SALA 12
		if getGlobalStorageValue(cid, 30061) - os.time() <= 0 and getPlayerStorageValue(cid, 45330) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Infelizmente o servidor deu SaveServer ou caiu e você perdeu seu acesso. Lamentamos muito o ocorrido, aguarde ".. convertTime(getPlayerStorageValue(cid, 45330) - os.time()) .." para acessar alguma Cave Exclusiva novamente.")
		elseif getGlobalStorageValue(cid, 30061) - os.time() > 0 and getPlayerStorageValue(cid, 45330) - os.time() > 0 then
			doPlayerSendTextMessage(cid, 27, "[Cave Exclusiva] Você ainda possui ".. convertTime(getPlayerStorageValue(cid, 45330) - os.time()) ..". (Sala: 12)")
		end		
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cave Exclusiva: Informe um valor válido.")	
    end
    return true
end