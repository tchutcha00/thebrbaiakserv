local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 35)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -2000, 0, -3000)

local area = createCombatArea({
	{0, 1, 1, 1, 0,},
	{0, 1, 3, 1, 0,},
	{0, 1, 1, 1, 0,}
})

setCombatArea(combat, area)

function onUseWeapon(cid, var)
target = getCreatureTarget(cid)
doSendDistanceShoot(getThingPos(cid), {x = getThingPos(cid).x - 4, y = getThingPos(cid).y - 5, z = getThingPos(cid).z}, 30)
doSendDistanceShoot({x = getThingPos(target).x - 4, y = getThingPos(target).y - 5, z = getThingPos(target).z}, getThingPos(target), 4)
doSendDistanceShoot({x = getThingPos(target).x - 4, y = getThingPos(target).y - 5, z = getThingPos(target).z}, getThingPos(target), 30)
doSendMagicEffect(getThingPos(cid), 49)
doSendMagicEffect(getThingPos(target), 28)
doSendDistanceShoot({x = getThingPos(target).x - 1, y = getThingPos(target).y - 1, z = getThingPos(target).z}, getThingPos(target), 31)
doSendDistanceShoot({x = getThingPos(target).x - 1, y = getThingPos(target).y + 1, z = getThingPos(target).z}, getThingPos(target), 30)
doSendDistanceShoot({x = getThingPos(target).x + 1, y = getThingPos(target).y + 1, z = getThingPos(target).z}, getThingPos(target), 31)
doSendDistanceShoot({x = getThingPos(target).x + 1, y = getThingPos(target).y - 1, z = getThingPos(target).z}, getThingPos(target), 30)
if not isCreature(cid) then return true end
return doCombat(cid, combat, var)
end