local query = db.query or db.executeQuery

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getItemAttribute(item.uid, "pontos") and tonumber(getItemAttribute(item.uid, "pontos")) then
		local points = tonumber(getItemAttribute(item.uid, "pontos"))
		local seller = tonumber(getItemAttribute(item.uid, "seller"))
		if doRemoveItem(item.uid) then
			query("UPDATE `accounts` SET `premium_points` = `premium_points` + '"..points.."' WHERE `id` = '"..getPlayerAccountId(cid).."'")
			if seller ~= getPlayerAccountId(cid) then
				query("INSERT INTO z_shop_history_sell (from_account,to_account,points) VALUES ('"..seller.."','"..getPlayerAccountId(cid).."','"..tonumber(points).."')")
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Sell Points System] Voc� recebeu "..points.." points!")
			doSendMagicEffect(getThingPos(cid), 28)
		end
	else
		doPlayerSendCancel(cid, "Este documento n�o vale nenhum ponto.")
	end
	return true
end
