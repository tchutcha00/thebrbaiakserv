local resets = 30

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50, -85, -50, -85, 3, 3, 2, 1)

function onCastSpell(cid, var)
    if getPlayerStorageValue(cid, 21466) >= 10 then
	if getPlayerResets(cid) >= resets then
setPlayerStorageValue(cid, CRITICAL_STORAGE, 1)
    	return doCombat(cid, combat, var)
    else
        doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
    end
	else
	doSendMagicEffect(getThingPos(cid), 2)
	doPlayerSendTextMessage(cid, 22, "Você precisa completar a quest de 30 RESET para usar esta magia.")
	return false
end
end
