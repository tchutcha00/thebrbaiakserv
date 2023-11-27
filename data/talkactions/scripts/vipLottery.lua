function onSay(cid,words,param,channel)
	local players = getPlayersOnline()
	local pid = players[math.random(1,#players)]
	if isPlayer(pid) then
		local q = db.getResult("SELECT premium_points FROM accounts WHERE id = '"..getPlayerAccountId(pid).."'")
		local a = q:getDataInt("premium_points")
		q:free()
		local points = tonumber(a) + 1
		doBroadcastMessage("[Loteria X10] O jogador "..getCreatureName(pid).." foi sorteado e ganhou 1 [+1000%] EXP Potion.")
		db.query("UPDATE accounts SET premium_points = '"..points.."' WHERE id = '"..getPlayerAccountId(pid).."'")
	end
	return true
end
