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
	setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -110000, 0, -115000)
	table.insert(combats, combat)
end

local combats2 = {}
for _, v in pairs(w) do
	local combat2 = createCombatObject()
	setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, 1)
	setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, 1)
	setCombatParam(combat2, COMBAT_PARAM_TYPE, v.dmg)
	setCombatParam(combat2, COMBAT_PARAM_EFFECT, v.ef)
	setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, v.sh)
	setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 0, -150000, 0, -165000)
	table.insert(combats2, combat2)
end

local combats3 = {}
for _, v in pairs(w) do
	local combat3 = createCombatObject()
	setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, 1)
	setCombatParam(combat3, COMBAT_PARAM_BLOCKSHIELD, 1)
	setCombatParam(combat3, COMBAT_PARAM_TYPE, v.dmg)
	setCombatParam(combat3, COMBAT_PARAM_EFFECT, v.ef)
	setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, v.sh)
	setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, 0, -195000, 0, -196000)
	table.insert(combats3, combat3)
end

local combats4 = {}
for _, v in pairs(w) do
	local combat4 = createCombatObject()
	setCombatParam(combat4, COMBAT_PARAM_BLOCKARMOR, 1)
	setCombatParam(combat4, COMBAT_PARAM_BLOCKSHIELD, 1)
	setCombatParam(combat4, COMBAT_PARAM_TYPE, v.dmg)
	setCombatParam(combat4, COMBAT_PARAM_EFFECT, v.ef)
	setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, v.sh)
	setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, 0, -250000, 0, -265000)
	table.insert(combats4, combat4)
end

function onUseWeapon(cid, var)
	local effect = getPlayerStorageValue(cid, 4561)
	local target = getCreatureTarget(cid)
	
	if getPlayerStorageValue(cid,32150) >= 1 and getPlayerStorageValue(cid,32151) <  1  then
	if target ~= 0 then
		local cbt = combats2[effect] or combats2[math.random(#combats2)]
		addEvent(function()
			if isPlayer(cid) then
				doCombat(cid, cbt, var)
			end
		end, 100)
	end
	elseif getPlayerStorageValue(cid,32151) >= 1 and getPlayerStorageValue(cid,27432) < 1 then
	if target ~= 0 then
		local cbt = combats3[effect] or combats3[math.random(#combats3)]
		addEvent(function()
			if isPlayer(cid) then
				doCombat(cid, cbt, var)
			end
		end, 100)
	end
	elseif getPlayerStorageValue(cid,27432) == 1 then
	if target ~= 0 then
		local cbt = combats4[effect] or combats4[math.random(#combats4)]
		addEvent(function()
			if isPlayer(cid) then
				doCombat(cid, cbt, var)
			end
		end, 100)
	end
	else
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
end