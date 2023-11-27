local resets = 5
-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{1, 1, 0, 0, 0, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 0, 0, 0, 1, 0},
{0, 1, 0, 2, 0, 1, 0},
{0, 1, 0, 0, 0, 1, 0},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 0, 0, 0, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (200000)*-1,(210000)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")
local dfcombat0_Brush = {CONST_ANI_ICE,2,2,1,2,0,2,-1,2,-2,2,-2,1,-2,0,-2,-1,-2,-2,-1,-2,0,-2,1,-2,2,-2,2,-1,2,0,2,1,-2,3,-3,3,-3,2,2,-3,-3,-2,-3,-3,-2,-3,3,-3,3,-2,3,2,3,3,2,3}local combat0_Brush_2 = createCombatObject()
setCombatParam(combat0_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_BUBBLES)
setCombatParam(combat0_Brush_2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush_2,createCombatArea({{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 1, 1, 1, 0, 1, 0},
{1, 1, 0, 1, 2, 1, 0, 1, 1},
{0, 1, 0, 1, 1, 1, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (200000)*-1,(210000)*-1 
end
setCombatCallback(combat0_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")
local dfcombat0_Brush_2 = {CONST_ANI_SMALLICE,0,1,-1,1,-1,0,-1,-1,0,-1,1,-1,1,1,1,3,0,3,-1,3,0,4,3,1,3,0,3,-1,4,0,1,-3,0,-3,-1,-3,0,-4,-3,-1,-3,0,-3,1,-4,0,1,0}

-- Areas/Combat for 200ms
local combat2_Brush_3 = createCombatObject()
setCombatParam(combat2_Brush_3, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat2_Brush_3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat2_Brush_3,createCombatArea({{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 1, 1, 1, 0, 1, 0},
{1, 1, 0, 1, 2, 1, 0, 1, 1},
{0, 1, 0, 1, 1, 1, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0}}))
function getDmg_Brush_3(cid, level, maglevel)
	return (200000)*-1,(205000)*-1 
end
setCombatCallback(combat2_Brush_3, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_3")

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos) -- Part
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then -- Emit distance effects
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
	RunPart(combat0_Brush,cid,var,dfcombat0_Brush,startPos)
	RunPart(combat0_Brush_2,cid,var,dfcombat0_Brush_2,startPos)
	addEvent(RunPart,200,combat2_Brush_3,cid,var)

return true 
else
doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
return false
end
end