local w = {
	[1] = {ef = 36, sh = 3, dmg = COMBAT_FIREDAMAGE},
	[2] = {ef = 54, sh = 29, dmg = COMBAT_EARTHDAMAGE},
	[3] = {ef = 46, sh = 38, dmg = COMBAT_POISONDAMAGE},
	[4] = {ef = 17, sh = 31, dmg = COMBAT_DEATHDAMAGE},
	[5] = {ef = 47, sh = 35, dmg = COMBAT_ENERGYDAMAGE},
	[6] = {ef = 36, sh = 31, dmg = COMBAT_PHYSICALDAMAGE},
	[7] = {ef = 49, sh = 37, dmg = COMBAT_HOLYDAMAGE}
}
	
local combats = {}
for _, v in pairs(w) do
	local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
	setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 1)
	setCombatParam(combat, COMBAT_PARAM_TYPE, v.dmg)
	setCombatParam(combat, COMBAT_PARAM_EFFECT, v.ef)
	setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, v.sh)
	setCombatFormula(combat, COMBAT_FORMULA_SKILL, 15, 0, 15, 0)
	
	local area = createCombatArea({
		{1, 1, 1},
		{1, 3, 1},
		{1, 1, 1}
	})
	setCombatArea(combat, area)
	table.insert(combats, combat)
end

function onUseWeapon(cid, var)
	local effect = getPlayerStorageValue(cid, 4561)
	local target = getCreatureTarget(cid)
	
	if target ~= 0 then
		local cbt = combats[effect] or combats[math.random(#combats)]
		addEvent(function()
			if isPlayer(cid) then
				doCombat(cid, cbt, var)
			end
		end, 100)
	end
	
	return true
end
