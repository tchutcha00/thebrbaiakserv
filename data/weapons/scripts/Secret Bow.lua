local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_THROWINGKNIFE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1.0, 0, 1.0, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_THROWINGKNIFE)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 1.4, 0, 1.4, 0)

function onUseWeapon(cid, var)
if getPlayerStorageValue(cid,32150) >= 1  then
doCombat(cid, combat2, var)
else
doCombat(cid, combat, var)
end
end