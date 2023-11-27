local resets = 15

local combat0_Brush_2 = createCombatObject()
setCombatParam(combat0_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_SOUND_PURPLE)
setCombatParam(combat0_Brush_2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush_2,createCombatArea({{0, 0, 1, 0, 0},
{0, 0, 1, 0, 0},
{1, 1, 2, 1, 1},
{0, 0, 1, 0, 0},
{0, 0, 1, 0, 0}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (1500000)*-1,(1600000)*-1 
end
setCombatCallback(combat0_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")
local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_PURPLEENERGY)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{0, 1, 0, 1, 0},
{1, 1, 0, 1, 1},
{0, 0, 2, 0, 0},
{1, 1, 0, 1, 1},
{0, 1, 0, 1, 0}}))
function getDmg_Brush(cid, level, maglevel)
	return (1500000)*-1,(1600000)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")

local function RunPart(c,cid,var,dirList,dirEmitPos)
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then
			local i = 2;
			while (i < #dirList) do
				doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i],y=dirEmitPos.y-dirList[i+1],z=dirEmitPos.z},dirList[1])
				i = i + 2
			end		
		end
	end
end

function onCastSpell(cid, var)
if getPlayerResets(cid) >= resets then
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_Brush_2,cid,var)
	RunPart(combat0_Brush,cid,var)
	return true
else
doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
return false
end
end