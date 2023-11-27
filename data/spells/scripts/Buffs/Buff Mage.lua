local tempo = 60 -- tempo em segundos.
local effect = {30} -- effect no player

local ml = 30 -- quantos ira aumentar o skill de ML
local health = 10000 -- A cada 1 segundo quantos aumentar de vida
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, ml)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 250)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)

function magicEffect(tempo2,tempo3,cid)
if (isCreature(cid)) then
if getPlayerStorageValue(cid, 102053) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
for i=1, #effect do
local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect[i])
end
end
end
end

function onCastSpell(cid, var)
    if getPlayerStorageValue(cid, 74516) >= 1 then
    else
	doSendMagicEffect(getThingPos(cid), 2)
        doPlayerSendTextMessage(cid, 22, "Você não possui este BUFF, pois não completou a quest.")
		return false
    end
if getPlayerStorageValue(cid, 102053) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
doCombat(cid, combat, var)
tempo2 = 0
while (tempo2 ~= (tempo*1000)) do
addEvent(magicEffect, tempo2, tempo2, tempo*1000, cid)
tempo2 = tempo2 + 2000
end
setPlayerStorageValue(cid, 102053,1) 
else
doPlayerSendCancel(cid, "Voce ja esta com Buff.")
end
end