-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_EFFECT, CONST_ME_YALAHARIGHOST)
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush,createCombatArea({{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 0, 0, 1, 0, 0, 1, 0},
{0, 1, 0, 0, 1, 0, 0, 1, 0},
{1, 1, 1, 1, 3, 1, 1, 1, 1},
{0, 1, 0, 0, 1, 0, 0, 1, 0},
{0, 1, 0, 0, 1, 0, 0, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0}}))

local resets = 35


function getDmg_Brush(cid, level, maglevel)
	return (2800000)*-1,(2800000)*-1 
end
setCombatCallback(combat0_Brush, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush")local combat0_Brush_2 = createCombatObject()
setCombatParam(combat0_Brush_2, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat0_Brush_2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatArea(combat0_Brush_2,createCombatArea({{1, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 2, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 1}}))
function getDmg_Brush_2(cid, level, maglevel)
	return (2800000)*-1,(2800000)*-1 
end
setCombatCallback(combat0_Brush_2, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Brush_2")

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
	RunPart(combat0_Brush,cid,var)
	RunPart(combat0_Brush_2,cid,var)
	else
	doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
		return false
	end
	return true
end