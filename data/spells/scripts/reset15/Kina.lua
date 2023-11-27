local resets = 15

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_STONES)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -1500000, 0, -1600000)

local arr = {
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 2, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 0, 1, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
if getPlayerResets(cid) >= resets then
	return doCombat(cid, combat, var)
else
doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
return false
end
end
