local SHOP_MSG_TYPE = MESSAGE_EVENT_ORANGE
local SQL_interval = 30
--- ### Outfits List ###
local femaleOutfits = { 
	["citizen"]={136}, 
	["hunter"]={137}, 
	["mage"]={138}, 
	["knight"]={139}, 
	["noblewoman"]={140}, 
	["summoner"]={141}, 
	["warrior"]={142}, 
	["barbarian"]={147}, 
	["druid"]={148}, 
	["wizard"]={149}, 
	["oriental"]={150}, 
	["pirate"]={155}, 
	["assassin"]={156}, 
	["beggar"]={157}, 
	["shaman"]={158}, 
	["norsewoman"]={252}, 
	["nightmare"]={269}, 
	["jester"]={270}, 
	["brotherhood"]={279}, 
	["demonhunter"]={288}, 
	["yalaharian"]={324}, 
	["warmaster"]={336},
	["wayfarer"]={366}, 
	["afflicted"]={431}, 
	["elementalist"]={433}, 
	["deepling"]={464}, 
	["insectoid"]={466}, 
	["red baron"]={471}, 
	["crystal warlord"]={513},
	["soil guardian"]={514}, 
	["demon"]={542} 
}
local maleOutfits = { 
	["citizen"]={128}, 
	["hunter"]={129}, 
	["mage"]={130}, 
	["knight"]={131}, 
	["noblewoman"]={132},
	["summoner"]={133}, 
	["warrior"]={134}, 
	["barbarian"]={143}, 
	["druid"]={144}, 
	["wizard"]={145}, 
	["oriental"]={146}, 
	["pirate"]={151}, 
	["assassin"]={152}, 
	["beggar"]={153}, 
	["shaman"]={154}, 
	["norsewoman"]={251}, 
	["nightmare"]={268}, 
	["jester"]={273}, 
	["brotherhood"]={278}, 
	["demonhunter"]={289}, 
	["yalaharian"]={325}, 
	["warmaster"]={335}, 
	["wayfarer"]={367}, 
	["afflicted"]={430},
	["elementalist"]={432}, 
	["deepling"]={463}, 
	["insectoid"]={465}, 
	["red baron"]={472}, 
	["crystal warlord"]={512}, 
	["soil guardian"]={516},
	["demon"]={541} 
}

function onThink(interval, lastExecution)
	local result_plr = db.getResult("SELECT * FROM z_ots_comunication")
	if(result_plr:getID() ~= -1) then
		while(true) do
		
			id = tonumber(result_plr:getDataInt("id"))
			local action = tostring(result_plr:getDataString("action"))
			local delete = tonumber(result_plr:getDataInt("delete_it"))
			local cid = getCreatureByName(tostring(result_plr:getDataString("name")))
			
			if isPlayer(cid) then
			
				local itemtogive_id = tonumber(result_plr:getDataInt("param1"))
				local itemtogive_count = tonumber(result_plr:getDataInt("param2"))
				local outfit_name = string.lower(tostring(result_plr:getDataString("param3")))
				local itemvip = tonumber(result_plr:getDataInt("param4"))
				local add_item_type = tostring(result_plr:getDataString("param5"))
				local add_item_name = tostring(result_plr:getDataString("param6"))
				local points = tonumber(result_plr:getDataInt("param7"))
				local received_item = 0
				local full_weight = 0
				
				if(action == 'give_item') then
					full_weight = getItemWeightById(itemtogive_id, itemtogive_count)
					if isItemRune(itemtogive_id) == TRUE then
						full_weight = getItemWeightById(itemtogive_id, 1)
					else
						full_weight = getItemWeightById(itemtogive_id, itemtogive_count)
					end
					
					local free_cap = getPlayerFreeCap(cid)

					local new_item = doCreateItemEx(itemtogive_id, itemtogive_count)
					
					if full_weight <= free_cap then
						received_item = doPlayerAddItemEx(cid, new_item)
						if received_item == RETURNVALUE_NOERROR then
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, 'A Equipe agradece sua compra, você acabou de receber >> '.. add_item_name ..' << relogue para salvar seus novos items.')
							db.executeQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
						        db.query("UPDATE `z_shop_history_item` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")
						else
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '>> '.. add_item_name ..' << do shop do OTServer está esperando você. Por favor, coloque este item em sua mochila/mãos e espere cerca de '.. SQL_interval ..' segundos para obter-lo.')
						end
					else
						doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '>> '.. add_item_name ..' << do shop do OTServer está esperando você. o peso é '.. full_weight ..' oz., você tem somente '.. free_cap ..' oz. de espaço livre. Coloque alguns items no depot e espere aproximadamente '.. SQL_interval ..' segundos para pegar seus items.')
					end
				end
				
				if(action == 'give_outfit') then
					if outfit_name ~= "" and maleOutfits[outfit_name] and femaleOutfits[outfit_name] then
						local add_outfit = getPlayerSex(cid) == 0 and femaleOutfits[outfit_name][1] or maleOutfits[outfit_name][1]
						if not canPlayerWearOutfit(cid, add_outfit, 3) then
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
							doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
                			doPlayerAddOutfit(cid, add_outfit, 3)
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, "Você recebeu a outfit " .. add_item_name .. " do nosso Shop Online.")
						else
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, "Você já tem esta outfit. Seus pontos estão retornando. Obrigado!.")
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
							db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
						end
					end
				end
				
			end
			if not(result_plr:next()) then
				break
			end
		end
		result_plr:free()
	end
	
	return true
end