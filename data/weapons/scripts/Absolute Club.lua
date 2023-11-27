local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatFormula(combat, COMBAT_FORMULA_SKILL, 10, 0, 10, 0)



function onUseWeapon(cid, var)

return doCombat(cid, combat, var)

end