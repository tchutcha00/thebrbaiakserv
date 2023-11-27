 local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid)
	local lvl_caster = getPlayerLevel(cid)

    local multiplier = 13000 * getPlayerResets(cid)
    
	local min = math.ceil(((lvl_caster / 00.1) + (multiplier)))
	local max = math.ceil(((lvl_caster / 00.1) + (multiplier)))
    return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end 