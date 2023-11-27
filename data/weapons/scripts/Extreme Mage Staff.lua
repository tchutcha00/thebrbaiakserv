local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 49)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -30000, 0, -31500)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 49)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -35000, 0, -35500)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 49)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, 0, -50000, 0, -50500)

function onUseWeapon(cid, var)
if getPlayerStorageValue(cid,32150) >= 1 and getPlayerStorageValue(cid,32151) <  1  then
doCombat(cid, combat2, var)
elseif getPlayerStorageValue(cid,32151) == 1  then
doCombat(cid, combat3, var)
else
doCombat(cid, combat, var)
end
end  
