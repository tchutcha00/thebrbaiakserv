local combat = createCombatObject()

local meteor = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.4, 0.5, 4, 7)

local arr = {
{0, 0, 0, 0, 0},
{0, 1, 1, 1, 0},
{0, 1, 3, 1, 0},
{0, 1, 1, 1, 0},
{0, 0, 0, 0, 0}
}



local area = createCombatArea(arr)
setCombatArea(combat, area)

local function meteorCast(p)
    doCombat(p.cid, p.combat, positionToVariant(p.pos))
end
local function stunEffect(cid)
    doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
            local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
            doSendDistanceShoot(newpos, pos, CONST_ANI_FIRE)
            addEvent(meteorCast, 200, {cid = cid,pos = pos, combat = meteor})
end



setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
    if getPlayerStorageValue(cid, 64855) >= 10 then
    	return doCombat(cid, combat, var)
    else
	doSendMagicEffect(getThingPos(cid), 2)
        doPlayerSendTextMessage(cid, 22, "Você não possui essa magia pois nao fez a quest da promotion.")
    end
end