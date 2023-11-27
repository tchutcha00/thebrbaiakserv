function onUse(cid, item, fromPosition, itemEx, toPosition)
	local info = 'Informações do Castle War:\n\nGuild Dominante: '
	if Castle48h.started then
		info = info .. 'Aguarde o resultado final para saber.'
	elseif Castle48h.dominantName and Castle48h.dominantName ~= '' then
		info = info .. Castle48h.dominantName
	else
		info = info .. 'Nenhuma guild está dominando.'
	end

	info = info ..'\n\nBatalha todos os dias às 21:00 PM.'
	doShowTextDialog(cid, 8977, info)
	return true
end
