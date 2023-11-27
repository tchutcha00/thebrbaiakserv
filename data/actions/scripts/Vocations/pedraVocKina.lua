-- Pedra para se transformar em Elite Knight (ID 8)
local config = {
	nova_voc = 8, -- ID da nova vocação a ser transformado
	msgs = {
		falha = "Voce ja é um %s",
		not_p = "Voce nao pode utilizar esta pedra.",
		fl_it = "Faz-se necessario DESEQUIPAR todos seus itens, exceto a backpack.",
	},
	
	reset_ml_lvl = 1, -- level que vai ser resetado o ml
	reset_skl_lvl = 10, -- level que vai ser resetado as skills
	
	-- Nao mexer, isso vai controlar o timing do acesso para as modificações
	storage = 48009
}

local function updateInfos(cid, lvl, pid, vc_atg)
	setPlayerStorageValue(cid, config.storage, os.time() + 6)
	
	-- HP e MP 
	local nvc_if = getVocationInfo(config.nova_voc)
	local n_ghp, n_gmp = nvc_if.healthGain, nvc_if.manaGain
	
	local nmax_hp = (lvl[1] * n_ghp) + 185
	local nmax_mp = (lvl[2] * n_gmp) + 35
	
	-- Skill de shield
	local shield_at = getPlayerSkillLevel(cid, SKILL_SHIELD)
	local n_shield = shield_at
	if (PEDRA_VOC[vc_atg].reduce_shield[config.nova_voc]) then 
		n_shield = math.floor(shield_at * (PEDRA_VOC[vc_atg].reduce_shield[config.nova_voc]))
	end
	
	if (PEDRA_VOC[vc_atg].multi_shield[config.nova_voc]) then 
		n_shield = math.floor(shield_at * (PEDRA_VOC[vc_atg].multi_shield[config.nova_voc]))
	end 
	
	-- Add skills
	local tot_skls
	if ((#PEDRA_VOC[vc_atg].reset_skills[config.nova_voc]) > 1) then 
		local t = {}
		for i, v in ipairs(PEDRA_VOC[vc_atg].reset_skills[config.nova_voc]) do 
			if (v == SKILL__MAGLEVEL) then 
				t[#t + 1] = getPlayerMagLevel(cid)
			else
				t[#t + 1] = getPlayerSkillLevel(cid, v)
			end
		end 
		table.sort(t)
		tot_skls = t[#t]
	else 
		if (PEDRA_VOC[vc_atg].reset_skills[config.nova_voc][1] == SKILL__MAGLEVEL) then 
			tot_skls = getPlayerMagLevel(cid)
		else 
			tot_skls = getPlayerSkillLevel(cid, PEDRA_VOC[vc_atg].reset_skills[config.nova_voc][1])
		end
	end 
	
	-- Desloga
	doRemoveCreature(cid)
	
	-- Skills (DB)
	if (PEDRA_VOC[vc_atg].novas_skills[config.nova_voc]) then 
		for i, v in ipairs(PEDRA_VOC[vc_atg].novas_skills[config.nova_voc]) do 
			if (v == SKILL__MAGLEVEL) then 
				db.executeQuery("UPDATE `players` SET `maglevel` = " .. tot_skls .. " WHERE `id` = " .. pid .. ";")
			else 
				db.executeQuery("UPDATE `player_skills` SET `value` = " .. tot_skls .. " WHERE `skillid` = " .. v .. " AND `player_id` = " .. pid .. ";")
			end 
		end 
	end 
	
	-- Skills reset (DB)
	if (PEDRA_VOC[vc_atg].reset_skills[config.nova_voc]) then 
		for i, v in ipairs(PEDRA_VOC[vc_atg].reset_skills[config.nova_voc]) do 
			if (v == SKILL__MAGLEVEL) then 
				db.executeQuery("UPDATE `players` SET `maglevel` = " .. config.reset_ml_lvl .. ", `manaspent` = " .. 0 .. " WHERE `id` = " .. pid .. ";")
			else 
				db.executeQuery("UPDATE `player_skills` SET `value` = " .. config.reset_skl_lvl .. ", `count` = " .. 0 .. " WHERE `skillid` = " .. v .. " AND `player_id` = " .. pid .. ";")
			end 
		end 
	end 
	
	-- Add nova vocação
	db.executeQuery("UPDATE `players` SET `vocation` = " .. config.nova_voc .. " WHERE `id` = " .. pid .. ";")
	-- HP e MANA (DB)
	db.executeQuery("UPDATE `players` SET `health` = " .. nmax_hp .. ", `healthmax` = " .. nmax_hp .. ", `mana` = " .. nmax_mp .. ", `manamax` = " .. nmax_mp .. " WHERE `id` = " .. pid .. ";")
	-- Shield (DB)
	db.executeQuery("UPDATE `player_skills` SET `value` = " .. n_shield .. ", `count` = " .. 0 .. " WHERE `skillid` = " .. SKILL_SHIELD .. " AND `player_id` = " .. pid .. ";")
end 

local function ckc_in_update(cid, vc)
	for v, tb in pairs(PEDRA_VOC) do 
		if (v == vc) then 
			return true
		end 
	end 
	return false
end 

local function ckc_slts(cid)
	for i = CONST_SLOT_FIRST, CONST_SLOT_LAST do 
		if not (i == CONST_SLOT_BACKPACK) then 
			local i_p = getPlayerSlotItem(cid, i).uid
			if (i_p and i_p > 0) then 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, config.msgs.fl_it)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
				return false
			end 
		end 
	end 
	return true
end 

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local vc_at = getPlayerVocation(cid)
	if (vc_at == config.nova_voc) then 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, string.format(config.msgs.falha, getPlayerVocationName(cid)))
		return false
	end
	
	if not (ckc_in_update(cid, vc_at)) then 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, config.msgs.not_p)
		return false
	end 
	
	if not (isInArray({5,6,7,8}, vc_at)) then 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Falha ao utilizar o item, contate o ADM.")
		return false
	end
	
	if (ckc_slts(cid)) then 
		doPlayerSave(cid)
		addEvent(function()
			-- Total de leveis, sem necessidade de depender dos resets (evitando também que players burlem o max por itens)
			local max_hp, max_mp
			local pid = getPlayerGUID(cid)
			result_p = db.getResult("SELECT `healthmax`, `manamax` FROM `players` WHERE `id` = " .. pid .. ";")
			if (result_p:getID() ~= -1) then
				max_hp = result_p:getDataInt("healthmax")
				max_mp = result_p:getDataInt("manamax")
				result_p:free()
			end 
	 
			local vc_if = getVocationInfo(vc_at)
			local ghp_at, gmp_at = vc_if.healthGain, vc_if.manaGain

			local clc_th = math.floor((max_hp - 185)/ghp_at)
			local clc_tm = math.floor((max_mp - 35)/gmp_at)
			local tot_l = {clc_th, clc_tm}
			
			updateInfos(cid, tot_l, pid, vc_at)
		end, 100) 
		doRemoveItem(item.uid, 1)
	end 
	
	return true
end