 local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 14)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(cid)
	local voc_t = getPlayerVocation(cid)
	if (voc_t == 3 or voc_t == 7) then
	local lvl_caster = getPlayerLevel(cid)
	local multiplier = 10000 * getPlayerResets(cid)
	local min = math.ceil(((lvl_caster / 00.2) + (multiplier)))
	local max = math.ceil(((lvl_caster / 00.1) + (multiplier)))
	return min, max
else
	local lvl_caster = getPlayerLevel(cid)
    local multiplier = 10000 * getPlayerResets(cid)
	local min = math.ceil(((lvl_caster / 00.1) + (multiplier)))
	local max = math.ceil(((lvl_caster / 00.1) + (multiplier)))
    return min, max
end
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end 
 