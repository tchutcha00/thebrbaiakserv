local resets = 10

local water = {490, 491, 492, 493}


local combat = createCombatObject()


local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 9)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -70.3, -80.5, -70.4, 1)


local stun = createConditionObject(CONDITION_PARALYZE)
setConditionParam(stun, CONDITION_PARAM_TICKS, 5000)
setConditionFormula(stun, -0.8, 0, -0.9, 0)
setCombatCondition(meteor, stun)




local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(meteor_water, COMBAT_PARAM_EFFECT, CONST_ME_LOSEENERGY)
setCombatFormula(meteor, COMBAT_FORMULA_LEVELMAGIC, -70.3, -80.5, -70.4, 1)


combat_arr = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}


local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)


local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end


local function stunEffect(cid)
doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end


function onTargetTile(cid, pos)
if (math.random(0, 0) == 0) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
if (isInArray(water, ground.itemid) == TRUE) then
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, 24)
addEvent(meteorCast, 200, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, 24)
addEvent(meteorCast, 200, {cid = cid,pos = pos, combat = meteor})
end
end
end


setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")


function onCastSpell(cid, var)
if getPlayerResets(cid) >= resets then
return doCombat(cid, combat, var)
else
doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
return false
end
end