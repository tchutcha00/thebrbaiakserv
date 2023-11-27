local config = {
	eft_dg = CONST_ANI_SUDDENDEATH, -- Efeito que vai vir das diagonais
	vezes = 1, -- quantas vezes o efeito da diagonal vai ser enviado?
	delay = 0.1, -- intervalo de um efeito para o outro na diagonal (caso tenha colocado mais de 1 vez aqui em cima)
	resets = 50 -- quantos resets necessita para castar a spell
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -100, -135, -100, -140, 3, 3, 2, 1)

local area = {
	{-2, -2}, {2, -2}, {2, 2}, {-2, 2},
	{-1, -1}, {1, -1}, {1, 1}, {-1, 1}
}

local function sndEft(cid, variant, i, j)
	if (isCreature(cid)) then -- antes por conta de seguranca, contra crashs de abusers
		if (i <= j) then 
			local t = getCreatureTarget(cid)
			if (t and isCreature(t)) then -- seguranca e pos
				local tp = getCreaturePosition(t)
				for i = 1, #area do 
					local ntp = {x = tp.x + area[i][1], y = tp.y + area[i][2], z = tp.z}
					doSendDistanceShoot(ntp, tp, config.eft_dg)
				end 
				addEvent(sndEft, config.delay * 1000, cid, variant, i + 1, j)
			end
		else 
			doCombat(cid, combat, variant)
		end 
	end
end

function onCastSpell(cid, var)
    if getPlayerStorageValue(cid, 21374) >= 9 then
		if (getPlayerResets(cid) >= config.resets) then
			sndEft(cid, var, 1, config.vezes)
			return true 
		else
			doPlayerSendCancel(cid, "You need to have at least " .. config.resets .. " resets to cast this spell.")
		end
    else
		doSendMagicEffect(getCreaturePosition(cid), 2)
		doPlayerSendTextMessage(cid, 22, "Você precisa completar a quest de 50 RESET para usar esta magia.")
	end
	return false
end 