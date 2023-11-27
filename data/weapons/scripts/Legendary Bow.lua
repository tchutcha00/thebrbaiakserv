local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SPEAR)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1.2, 0, 1.2, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SPEAR)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 1.5, 0, 1.5, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SPEAR)
setCombatFormula(combat3, COMBAT_FORMULA_SKILL, 1.7, 0, 1.7, 0)

function onUseWeapon(cid, var)
if getPlayerStorageValue(cid,32150) >= 1 and getPlayerStorageValue(cid,32151) <  1  then
doCombat(cid, combat2, var)
elseif getPlayerStorageValue(cid,32151) == 1  then
doCombat(cid, combat3, var)
else
doCombat(cid, combat, var)
end
end  