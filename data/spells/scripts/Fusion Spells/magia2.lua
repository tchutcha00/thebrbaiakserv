-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 1, 1, 1, 0, 1},
{1, 0, 1, 2, 1, 0, 1},
{1, 0, 1, 1, 1, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (100000)*-1,(105000)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")
local dfcombat0_Brush = {CONST_ANI_ICE,1,1,0,1,-1,1,-1,0,-1,-1,0,-1,1,-1,1,0,3,3,3,2,3,1,3,0,3,-1,3,-2,3,-3,2,-3,1,-3,0,-3,-1,-3,-2,-3,-3,-3,-3,-2,-3,-1,-3,0,-3,1,-3,2,-3,3,-2,3,-1,3,0,3,1,3,2,3}

-- Areas/Combat for 200ms
local combat2_Brush = createCombatObject()
setCombatParam(combat2_Brush, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat2_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat2_Brush,createCombatArea({{1, 1, 1, 1, 1},
{1, 0, 0, 0, 1},
{1, 0, 2, 0, 1},
{1, 0, 0, 0, 1},
{1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
return (100000)*-1,(105000)*-1 
end
setCombatCallback(combat2_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")
local dfcombat2_Brush = {CONST_ANI_ICE,2,2,1,2,0,2,-1,2,-2,2,-2,1,-2,0,-2,-1,-2,-2,-1,-2,0,-2,1,-2,2,-2,2,-1,2,0,2,1}

-- Areas/Combat for 400ms
local combat4_Brush = createCombatObject()
setCombatParam(combat4_Brush, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat4_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat4_Brush,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (100000)*-1,(105000)*-1 
end
setCombatCallback(combat4_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")
local dfcombat4_Brush = {CONST_ANI_ICE,1,1,1,0,1,-1,0,-1,0,-2,1,-2,-1,-2,-2,-2,-2,-1,-1,-1,-1,0,-1,1,0,1,0,2,1,2,2,2,2,1,2,0,2,-1,2,-2,-2,0,-2,1,-2,2,-1,2,3,2,3,1,3,0,3,-1,3,-2,3,-3,2,-3,1,-3,0,-3,-1,-3,-2,-3,-3,-3,-3,-2,-3,-1,-3,0,-3,1,-3,2,-3,3,-2,3,-1,3,0,3,1,3,2,3,3,3,0,0}

-- Areas/Combat for 600ms
local combat6_Brush = createCombatObject()
setCombatParam(combat6_Brush, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat6_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat6_Brush,createCombatArea({{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 2, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}}))
function getDmg_Brush(cid, level, maglevel)
	return (100000)*-1,(105000)*-1 
end
setCombatCallback(combat6_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")
local dfcombat6_Brush = {CONST_ANI_ICE,3,3,2,3,1,3,0,3,-1,3,-2,3,-3,3,-3,2,-3,1,-3,0,-3,-1,-3,-2,-3,-3,-2,-3,-1,-3,0,-3,1,-3,2,-3,3,-3,3,-2,3,-1,3,0,3,1,3,2,2,2,2,1,2,0,2,-1,2,-2,1,-2,0,-2,-1,-2,-2,-2,-2,-1,-2,0,-2,1,-2,2,-1,2,0,2,1,2,1,-1,0,-1,-1,-1,-1,0,-1,1,0,1,1,1,1,0}

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
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_Brush,cid,var,dfcombat0_Brush,startPos)
	addEvent(RunPart,200,combat2_Brush,cid,var,dfcombat2_Brush,startPos)
	addEvent(RunPart,400,combat4_Brush,cid,var,dfcombat4_Brush,startPos)
	addEvent(RunPart,600,combat6_Brush,cid,var,dfcombat6_Brush,startPos)
	return true
end