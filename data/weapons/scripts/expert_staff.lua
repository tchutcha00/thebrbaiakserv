local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -110000, 0, -115000)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -155000, 0, -166000)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, 0, -195000, 0, -196000)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, 0, -250000, 0, -265000)

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