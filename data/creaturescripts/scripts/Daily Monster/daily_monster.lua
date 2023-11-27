function onLogin(cid)
        local name = getGlobalStorageValue('dailymonstername')
        local type = getGlobalStorageValue('dailymonstertype')
        local percent = getGlobalStorageValue('dailymonsterpercent')
		
        if name and type and percent then
            local config = {
                [DAILYMONSTER_LOOT] = {message = "O b�nus do monstro foi loot, ent�o o monstro ter� melhor drop de loot.", type = "Loot"},
                [DAILYMONSTER_EXPERIENCE] = {message = "O b�nus do monstro foi experi�ncia, ent�o o monstro lhe dar� mais experi�ncia..", type = "Experience"}
            }

            local boost = config[type]
            if not boost then
            	return true
            end

            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "O monstro selecionado hoje foi: ".. name .."\nO atributo selecionado foi: (".. boost.type ..") com um b�nus de: (".. (type == DAILYMONSTER_LOOT and 'Rate +' .. percent or percent .. '') .."%).\n\n" .. boost.message)
        end
	return true
end
