local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 10.3, 0, 10.3, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 13.4, 0, 13.4, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat3, COMBAT_FORMULA_SKILL, 13.4, 0, 13.4, 0)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat4, COMBAT_FORMULA_SKILL, 15.8, 0, 15.8, 0)

function onUseWeapon(cid, var)
if getPlayerStorageValue(cid,32150) >= 1 and getPlayerStorageValue(cid,32151) < 1  then
doCombat(cid, combat2, var)
elseif getPlayerStorageValue(cid,32151) >= 1 and getPlayerStorageValue(cid,27432) < 1 then
doCombat(cid, combat3, var)
elseif getPlayerStorageValue(cid,27432) == 1 then
doCombat(cid, combat4, var)
else
doCombat(cid, combat, var)
end
end 