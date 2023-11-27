local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -16, -45, -20, -45, 3, 3, 2, 1)

function onCastSpell(cid, var)

    if (getPlayerVocation(cid) ~= 3 or getPlayerVocation(cid) ~= 8) then

        return doCombat(cid, combat, var)

    else

        return doPlayerSendDefaultCancel(cid, RETURNVALUE_YOURVOCATIONCANNOTUSETHISSPELL)

    end

end
