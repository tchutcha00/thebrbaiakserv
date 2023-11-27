local config = {
	-- Localização do templo, quando o VIP acabar ele ser teleportado pra lá
	temple_position = {x = 113, y = 81, z = 7},
	
	msgs = {
		war_vip = "Resta apenas 1 dia para acabar o seu VIP! Renove agora mesmo no site: king-baiak.com.", -- Caso ele logue com 1 dia restante 
		end_vip = "Lamentamos, mas você foi removido da área donate porque seus dias premium acabaram.", -- msg quando acabar o vip
	},

}


function onLogin(cid)
	if (isPremium(cid)) then 
		-- Registro de historico
		if (getPlayerStorageValue(cid, 89875) ~= 1) then 
			setPlayerStorageValue(cid, 89875, 1)
		end 
		
		-- Alerta
		if (getPlayerPremiumDays(cid) == 1) then 			
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, config.msgs.war_vip)
		end 
		
	elseif (not isPremium(cid) and getPlayerStorageValue(cid, 89875) == 1) then 
		doPlayerPopupFYI(cid, config.msgs.end_vip)
		setPlayerStorageValue(cid, 89875, -1)
		doTeleportThing(cid, config.temple_position)
	end 
	
	return true 
end 