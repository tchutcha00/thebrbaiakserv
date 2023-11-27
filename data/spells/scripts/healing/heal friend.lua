local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 14)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.2, 0.2, 0.2, 0.2)

function onTargetCombat(cid, target)
	if (isPlayer(target)) then 
		local voc_t = getPlayerVocation(target)
		if (voc_t == 4 or voc_t == 8) then
			local lvl_caster = getPlayerLevel(cid)
			local ml_caster = getPlayerMagLevel(cid)
			local min = math.ceil(((lvl_caster / 0.4) + (ml_caster * 14)))
			local max = math.ceil(((lvl_caster / 0.4) + (ml_caster * 15)))
			doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, CONST_ME_NONE)
		end 
	end 
end

setCombatCallback(combat, 4, "onTargetCombat")

function onCastSpell(cid, var)
	local myPosition = getThingPos(cid)
	local friend = var.number

	if isPlayer(friend) then
		doSendDistanceShoot(myPosition, getThingPos(friend), 4)
		doSendCreatureSquare(friend, 194)
	end

	doSendMagicEffect(myPosition, 13)
	return doCombat(cid, combat, var)
end

