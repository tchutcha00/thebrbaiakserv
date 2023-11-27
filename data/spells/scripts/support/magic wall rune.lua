local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, ITEM_MAGIC_WALL)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function onCastSpell(cid,var)
 local pos = variantToPosition(var)
 if isInRange(pos, {x = 100, y = 13073, z = 7}, {x = 170, y = 13142, z = 7}) then
  doPlayerSendCancel(cid,"Não pode usar mwall aqui.")
 else
  return doCombat(cid, combat, var)
 end
end
