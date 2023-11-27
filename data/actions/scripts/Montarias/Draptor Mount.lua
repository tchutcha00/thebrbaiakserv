local config = {
	storage = 31021,
	outfit_male = 132,
	outfit_female = 140,
	outfit_name = "Draptor Mount",
}

function onUse(cid, item, frompos, item2, topos)

	if getPlayerStorageValue(cid, config.storage) < 1 then
		doPlayerSendTextMessage(cid,22, "Voc� ganhou o ".. config.outfit_name ..".")
		doRemoveItem(item.uid,1)
		doPlayerAddOutfit(cid, config.outfit_male, 1)
		doPlayerAddOutfit(cid, config.outfit_male, 2)
		doPlayerAddOutfit(cid, config.outfit_female, 1)
		doPlayerAddOutfit(cid, config.outfit_female, 2)
		setPlayerStorageValue(cid, config.storage, 1)
	else
		doPlayerSendCancel(cid, "Voc� j� pegou essa montaria.")
	end
	
	return true
end