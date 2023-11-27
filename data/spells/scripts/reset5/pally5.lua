local resets = 5

-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_CAKE)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{1, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 1, 0, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 2, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 0, 1, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (200000)*-1,(205000)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")
local dfcombat0_Brush = {CONST_ANI_CAKE,1,1,2,2,3,3,0,1,-1,1,-2,2,-3,3,-1,0,-1,-1,0,-1,1,-1,1,0,2,-2,3,-3,-2,-2,-3,-3,-2,0,2,0,0,2,0,-2}local combat0_Brush_2 = createCombatObject()
setCombatParam(combat0_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat0_Brush_2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush_2,createCombatArea({{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 0, 1, 0, 1, 0, 1, 0},
{0, 1, 1, 0, 0, 0, 1, 1, 0},
{1, 1, 0, 0, 2, 0, 0, 1, 1},
{0, 1, 1, 0, 0, 0, 1, 1, 0},
{0, 1, 0, 1, 0, 1, 0, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (200000)*-1,(205000)*-1 
end
setCombatCallback(combat0_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")
local dfcombat0_Brush_2 = {CONST_ANI_SMALLHOLY,1,2,1,3,2,3,0,3,-1,3,-2,3,-1,2,-2,1,-3,1,-3,2,-3,0,-3,-1,-2,-1,-3,-2,-2,-3,-1,-3,-1,-2,0,-3,1,-3,1,-2,2,-3,3,-2,3,-1,3,0,3,1,3,2,2,1,2,-1,0,4,0,-4,-4,0,4,0}

-- Areas/Combat for 700ms
local combat7_Brush_3 = createCombatObject()
setCombatParam(combat7_Brush_3, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat7_Brush_3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat7_Brush_3,createCombatArea({{1, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 1, 0, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 2, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 0, 1, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 1}}))
function getDmg_Brush_3(cid, level, maglevel)
	return (200000)*-1,(205000)*-1 
end
setCombatCallback(combat7_Brush_3, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_3")

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
   local startPos = getCreaturePosition(cid)
	RunPart(combat0_Brush,cid,var,dfcombat0_Brush,startPos)
	RunPart(combat0_Brush_2,cid,var,dfcombat0_Brush_2,startPos)
	addEvent(RunPart,700,combat7_Brush_3,cid,var)
	return true 
else
doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
return false
end
end