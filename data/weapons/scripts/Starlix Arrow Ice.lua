local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHIVERARROW)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1.7, 0, 1.7, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHIVERARROW)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 1.8, 0, 1.8, 0)

function onUseWeapon(cid, var)
if getPlayerStorageValue(cid,32150) >= 1  then
doCombat(cid, combat2, var)
else
doCombat(cid, combat, var)
setPlayerStorageValue(cid, CRITICAL_STORAGE, 1)
end
end  