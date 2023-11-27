local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNOWBALL)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0.7, 0, 0.7, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNOWBALL)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 1.3, 0, 1.3, 0)

function onUseWeapon(cid, var)
if getPlayerStorageValue(cid,32150) >= 1  then
doCombat(cid, combat2, var)
else
doCombat(cid, combat, var)
end
end