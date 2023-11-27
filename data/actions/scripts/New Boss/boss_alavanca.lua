function onUse(cid, item, pos, itemEx, toPosition)
local actionid = 19000
local valueid = 3000 --store global
local dia_atual, ultimo_dia = tonumber(os.date("%d")), tonumber(getGlobalStorageValue(valueid))

	if(ultimo_dia ~= dia_atual)then
		setGlobalStorageValue(valueid,dia_atual)
		doCreateMonster("claptomaniaco", {x=78,y=153,z=7}) -- nome do boss e posição
		doPlayerPopupFYI(cid, "O Boss ressurgiu das cinzas, mate-o!!!")
	else
		doPlayerPopupFYI(cid, "[IMPORTANTE]: O Boss esta morto, somente daqui 24h, nao entre no covil ou voce perde seus tokens!")
	end	
	return true
end