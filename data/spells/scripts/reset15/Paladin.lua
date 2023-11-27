local resets = 15
local repeatAmount = 2
 
local deathFlamesArea = {
	createCombatArea({
		{0, 1, 0},
		{1, 2, 1},
		{0, 1, 0}
	}),
	createCombatArea({
		{0, 1, 1, 1, 0},
		{1, 1, 0, 1, 1},
		{1, 0, 2, 0, 1},
		{1, 1, 0, 1, 1},
		{0, 1, 1, 1, 0}
	}),
	createCombatArea({
		{0, 0, 1, 1, 1, 0, 0},
		{0, 1, 0, 0, 0, 1, 0},
		{1, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 2, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 1},
		{0, 1, 0, 0, 0, 1, 0},
		{0, 0, 1, 1, 1, 0, 0}
	})
 
}
 
local bigFlamesArea = createCombatArea({
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 0, 0, 0, 1, 1, 0},
	{1, 1, 0, 0, 0, 0, 0, 1, 1},
	{1, 0, 0, 0, 0, 0, 0, 0, 1},
	{1, 0, 0, 0, 2, 0, 0, 0, 1},
	{1, 0, 0, 0, 0, 0, 0, 0, 1},
	{1, 1, 0, 0, 0, 0, 0, 1, 1},
	{0, 1, 1, 0, 0, 0, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0}
})
 
local deathFlames = {}
for k, area in ipairs(deathFlamesArea) do
	deathFlames[k] = createCombatObject()
	setCombatParam(deathFlames[k], COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(deathFlames[k], COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
	setCombatFormula(deathFlames[k], COMBAT_FORMULA_LEVELMAGIC, 0, -750000, 0, -760000)
 
	setCombatArea(deathFlames[k], area)
end
 
local bigFlames = createCombatObject()
setCombatParam(bigFlames, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(bigFlames, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatFormula(bigFlames, COMBAT_FORMULA_LEVELMAGIC, 0, -750000, 0, -760000)
 
setCombatArea(bigFlames, bigFlamesArea)
 
function onTargetTile(cid, pos)
	doSendDistanceShoot(getCreaturePosition(cid), pos, CONST_ANI_ETHEREALSPEAR)
end
setCombatCallback(bigFlames, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
 
local function castSpellDelay(p)
	if(isCreature(p[1]) == TRUE) then
		doCombat(unpack(p))
	end
end
 
function onCastSpell(cid, var)
if getPlayerResets(cid) >= resets then
	for i = 0, repeatAmount - 1 do
		for k, combat in ipairs(deathFlames) do
			addEvent(castSpellDelay, (150 * k) + #deathFlames * 150 * i + 700 * i, {cid, combat, var})
		end
		addEvent(castSpellDelay, (150 * #deathFlames) + #deathFlames * 150 * i + 700 * i, {cid, bigFlames, var})
	end
 
	return LUA_NO_ERROR
	else
doPlayerSendCancel(cid, "You need to have at least " .. resets .. " resets to cast this spell.")
return false
end
end