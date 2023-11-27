local combat_types = {
	[3] = {cond = CONDITION_FREEZING, effect = CONST_ME_ICEATTACK, anim = CONST_ANI_ICE, damage = COMBAT_ICEDAMAGE},
	[4] = {cond = CONDITION_FIRE, effect = CONST_ME_FIREATTACK, anim = CONST_ANI_FIRE, damage = COMBAT_FIREDAMAGE},
	[5] = {cond = CONDITION_POISON, effect = CONST_ME_SMALLPLANTS, anim = CONST_ANI_EARTH, damage = COMBAT_EARTHDAMAGE},
	[6] = {cond = CONDITION_ENERGY, effect = CONST_ME_ENERGYHIT, anim = CONST_ANI_ENERGY, damage = COMBAT_ENERGYDAMAGE},
	[7] = {effect = CONST_ME_HOLYDAMAGE, anim = CONST_ANI_HOLY, damage = COMBAT_HOLYDAMAGE},
	[8] = {cond = CONDITION_CURSED, effect = CONST_ME_MORTAREA, anim = CONST_ANI_SUDDENDEATH, damage = COMBAT_DEATHDAMAGE},

	default = {damage = COMBAT_PHYSICALDAMAGE},
}

local config = {
	storage = 201011,
	block_armor = true,
	condition_rounds = 0,
	condition_value = 0,
	condition_time = 2000,
}

for key, combat in pairs(combat_types) do
	combat.object = createCombatObject()
	setCombatParam(combat.object, COMBAT_PARAM_TYPE, combat.damage or COMBAT_PHYSICALDAMAGE)
	setCombatParam(combat.object, COMBAT_PARAM_EFFECT, combat.effect or CONST_ME_NONE)
	setCombatParam(combat.object, COMBAT_PARAM_DISTANCEEFFECT, combat.anim or CONST_ANI_NONE)
	setCombatParam(combat.object, COMBAT_PARAM_BLOCKARMOR, config.block_armor and 1 or 0)
	setCombatFormula(combat.object, COMBAT_FORMULA_LEVELMAGIC, 0, -150000, 0, -155000)

	combat.object2 = createCombatObject()
	setCombatParam(combat.object2, COMBAT_PARAM_TYPE, combat.damage or COMBAT_PHYSICALDAMAGE)
	setCombatParam(combat.object2, COMBAT_PARAM_EFFECT, combat.effect or CONST_ME_NONE)
	setCombatParam(combat.object2, COMBAT_PARAM_DISTANCEEFFECT, combat.anim or CONST_ANI_NONE)
	setCombatParam(combat.object2, COMBAT_PARAM_BLOCKARMOR, config.block_armor and 1 or 0)
	setCombatFormula(combat.object2, COMBAT_FORMULA_LEVELMAGIC, 0, -215000, 0, -216000)
	
	combat.object3 = createCombatObject()
	setCombatParam(combat.object3, COMBAT_PARAM_TYPE, combat.damage or COMBAT_PHYSICALDAMAGE)
	setCombatParam(combat.object3, COMBAT_PARAM_EFFECT, combat.effect or CONST_ME_NONE)
	setCombatParam(combat.object3, COMBAT_PARAM_DISTANCEEFFECT, combat.anim or CONST_ANI_NONE)
	setCombatParam(combat.object3, COMBAT_PARAM_BLOCKARMOR, config.block_armor and 1 or 0)
	setCombatFormula(combat.object3, COMBAT_FORMULA_LEVELMAGIC, 0, -235000, 0, -236000)
	
	combat.object4 = createCombatObject()
	setCombatParam(combat.object4, COMBAT_PARAM_TYPE, combat.damage or COMBAT_PHYSICALDAMAGE)
	setCombatParam(combat.object4, COMBAT_PARAM_EFFECT, combat.effect or CONST_ME_NONE)
	setCombatParam(combat.object4, COMBAT_PARAM_DISTANCEEFFECT, combat.anim or CONST_ANI_NONE)
	setCombatParam(combat.object4, COMBAT_PARAM_BLOCKARMOR, config.block_armor and 1 or 0)
	setCombatFormula(combat.object4, COMBAT_FORMULA_LEVELMAGIC, 0, -310000, 0, -315000)

	if combat.cond then
		local condition = createConditionObject(combat.cond)
		setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
		addDamageCondition(condition, config.condition_rounds, config.condition_time, config.condition_value)
		setCombatCondition(combat.object, condition)
		setCombatCondition(combat.object2, condition)
		local condition2 = createConditionObject(combat.cond)
		setConditionParam(condition2, CONDITION_PARAM_DELAYED, 1)
		addDamageCondition(condition2, config.condition_rounds, config.condition_time, config.condition_value)
		setCombatCondition(combat.object2, condition2)
		local condition3 = createConditionObject(combat.cond)
		setConditionParam(condition3, CONDITION_PARAM_DELAYED, 1)
		addDamageCondition(condition3, config.condition_rounds, config.condition_time, config.condition_value)
		setCombatCondition(combat.object3, condition3)
		local condition4 = createConditionObject(combat.cond)
		setConditionParam(condition4, CONDITION_PARAM_DELAYED, 1)
		addDamageCondition(condition4, config.condition_rounds, config.condition_time, config.condition_value)
		setCombatCondition(combat.object4, condition4)
	end
end

local function find_combat(id)
	return combat_types[id] or false
end

function onUseWeapon(cid, var)
	local combat = find_combat(getCreatureStorage(cid, config.storage))

	if not combat then
		if getDistanceBetween(getThingPosition(cid), getThingPosition(var.number)) > 1 then
			return false
		end

		combat = combat_types.default
	end

	if getPlayerStorageValue(cid,32150) >= 1 and getPlayerStorageValue(cid,32151) <  1  then
			doCombat(cid, combat.object2, var)
	elseif getPlayerStorageValue(cid,32151) >= 1 and getPlayerStorageValue(cid,27432) < 1 then
            doCombat(cid, combat.object3, var)
	elseif getPlayerStorageValue(cid,27432) == 1 then
	        doCombat(cid, combat.object4, var)
		else
			doCombat(cid, combat.object, var)
		end
end

