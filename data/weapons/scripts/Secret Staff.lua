local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 43)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 28)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -35000, 0, -36500)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 43)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 28)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -45000, 0, -45500)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 43)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 28)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, 0, -55000, 0, -55500)
 
function onUseWeapon(cid, var)
if getPlayerStorageValue(cid,32150) >= 1 and getPlayerStorageValue(cid,32151) <  1  then
doCombat(cid, combat2, var)
elseif getPlayerStorageValue(cid,32151) == 1 then
doCombat(cid, combat3, var)
else
doCombat(cid, combat, var)
end
end  