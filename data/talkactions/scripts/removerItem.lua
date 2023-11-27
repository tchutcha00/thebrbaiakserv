function onSay(cid, words, param)
	pos = getPlayerPosition(cid)
	if (param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O comando necessita de parametros (nomePlayer,idItem,quantidade). Ex.: /remover Bugador,2160,100")
		if (not isPlayerGhost(cid)) then
			doSendMagicEffect(pos, CONST_ME_POFF)
		end
	return true
	end
	
	local aux = string.explode(param, ",")
	local pid = getPlayerByNameWildcard(aux[1])
	
	if (not pid or (isPlayerGhost(pid))) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Player " .. aux[1] .. " nao encontrado.")
		return true
	elseif (getPlayerAccess(pid) > getPlayerAccess(cid)) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao pode remover itens de um superior seu.")
		doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "O membro da staff " ..getCreatureName(cid).. " tentou remover um item de voce!")
		return true
	end
	
	aux[1] = aux[1]:lower()
	local qntd = 1
	
	if(aux[3]) then
		if (tonumber(aux[3]) <= 0) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Nao eh permitido valores nulos/negativos! Caso queira remover apenas 1x, use /remover Player,idItem")
		return true
		else
			qntd = aux[3]
		end
	end
	
	if (doPlayerRemoveItem(pid, tonumber(aux[2]), qntd) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Removido " ..qntd.. "x " ..getItemNameById(aux[2]).. " do player "..aux[1])
		posPlayer = getCreaturePosition(pid)
		doSendMagicEffect(posPlayer, CONST_ME_PLANTATTACK)
		return true
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O Player " ..aux[1].. " nao tem o item ou a quantidade do item informada em seu inventario.")
	end
return true
end
