local resets = 40

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 35)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -60, -95, -60, -95, 3, 3, 2, 1)

local area = createCombatArea({
	{0, 0, 0, 0, 0,},
	{0, 0, 3, 0, 0,},
	{0, 0, 0, 0, 0,}
})

setCombatArea(combat, area)

function onTargetTile(cid, pos)
target = getCreatureTarget(cid)
doSendDistanceShoot(getThingPos(cid), {x = getThingPos(cid).x - 4, y = getThingPos(cid).y - 5, z = getThingPos(cid).z}, 30)
doSendDistanceShoot({x = getThingPos(target).x - 4, y = getThingPos(target).y - 5, z = getThingPos(target).z}, getThingPos(target), 24)
doSendDistanceShoot({x = getThingPos(target).x - 4, y = getThingPos(target).y - 5, z = getThingPos(target).z}, getThingPos(target), 30)
doSendMagicEffect(getThingPos(cid), 49)
doSendMagicEffect(getThingPos(target), 28)
doSendDistanceShoot({x = getThingPos(target).x - 1, y = getThingPos(target).y - 1, z = getThingPos(target).z}, getThingPos(target), 24)
doSendDistanceShoot({x = getThingPos(target).x - 1, y = getThingPos(target).y + 1, z = getThingPos(target).z}, getThingPos(target), 24)
doSendDistanceShoot({x = getThingPos(target).x + 1, y = getThingPos(target).y + 1, z = getThingPos(target).z}, getThingPos(target), 24)
doSendDistanceShoot({x = getThingPos(target).x + 1, y = getThingPos(target).y - 1, z = getThingPos(target).z}, getThingPos(target), 24)
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
    if getPlayerStorageValue(cid, 21374) >= 10 then
	if getPlayerResets(cid) >= resets then
    	return doCombat(cid, combat, var)
    else
        doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
    end
	else
	doSendMagicEffect(getThingPos(cid), 2)
	doPlayerSendTextMessage(cid, 22, "Você precisa completar a quest de 40 RESET para usar esta magia.")
	return false
end
end