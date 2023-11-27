local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 3, 0, 3, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 4, 0, 4, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_SKILL, 5, 0, 5, 0)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat4, COMBAT_FORMULA_SKILL, 6, 0, 6, 0)

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