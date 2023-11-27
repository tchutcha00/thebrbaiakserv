ResetSystem = {
	back_to_level = 500,
	Reset = {
		[1] = {needed_level = 15000, damage_percent = 2},
		[2] = {needed_level = 16000, damage_percent = 4},
		[3] = {needed_level = 16500, damage_percent = 6},
		[4] = {needed_level = 16700, damage_percent = 8},
		[5] = {needed_level = 20000, damage_percent = 10},
		[6] = {needed_level = 20000, damage_percent = 12},
		[7] = {needed_level = 20000, damage_percent = 14},
		[8] = {needed_level = 20000, damage_percent = 16},
		[9] = {needed_level = 20000, damage_percent = 18},
		[10] = {needed_level = 21000, damage_percent = 20},
		[11] = {needed_level = 21000, damage_percent = 22},
		[12] = {needed_level = 21000, damage_percent = 24},
		[13] = {needed_level = 21000, damage_percent = 26},
		[14] = {needed_level = 21000, damage_percent = 28},
		[15] = {needed_level = 22500, damage_percent = 30},
		[16] = {needed_level = 24000, damage_percent = 32},
		[17] = {needed_level = 25500, damage_percent = 34},
		[18] = {needed_level = 27000, damage_percent = 36},
		[19] = {needed_level = 28500, damage_percent = 38},
		[20] = {needed_level = 30000, damage_percent = 40},
		[21] = {needed_level = 31500, damage_percent = 42},
		[22] = {needed_level = 33000, damage_percent = 44},
		[23] = {needed_level = 34500, damage_percent = 46},
		[24] = {needed_level = 36000, damage_percent = 48},
		[25] = {needed_level = 37500, damage_percent = 50},
		[26] = {needed_level = 39000, damage_percent = 52},
		[27] = {needed_level = 40500, damage_percent = 54},
		[28] = {needed_level = 42000, damage_percent = 56},
		[29] = {needed_level = 43500, damage_percent = 58},
		[30] = {needed_level = 45000, damage_percent = 60},
		[31] = {needed_level = 46500, damage_percent = 62},
		[32] = {needed_level = 48000, damage_percent = 64},
		[33] = {needed_level = 49500, damage_percent = 66},
		[34] = {needed_level = 51000, damage_percent = 68},
		[35] = {needed_level = 52500, damage_percent = 70},
		[36] = {needed_level = 54000, damage_percent = 72},
		[37] = {needed_level = 55500, damage_percent = 74},
		[38] = {needed_level = 57000, damage_percent = 76},
		[39] = {needed_level = 58500, damage_percent = 78},
		[40] = {needed_level = 60000, damage_percent = 80},
		[41] = {needed_level = 61500, damage_percent = 82},
		[42] = {needed_level = 63000, damage_percent = 84},
		[43] = {needed_level = 64500, damage_percent = 86},
		[44] = {needed_level = 66000, damage_percent = 88},
		[45] = {needed_level = 67500, damage_percent = 90},
		[46] = {needed_level = 69000, damage_percent = 92},
		[47] = {needed_level = 70500, damage_percent = 94},
		[48] = {needed_level = 72000, damage_percent = 96},
		[49] = {needed_level = 73500, damage_percent = 98},
		[50] = {needed_level = 75000, damage_percent = 100},
		[51] = {needed_level = 80000, damage_percent = 102},
		[52] = {needed_level = 85000, damage_percent = 104},
		[53] = {needed_level = 90000, damage_percent = 106},
		[54] = {needed_level = 100000, damage_percent = 108},
		[55] = {needed_level = 110000, damage_percent = 110},
		[56] = {needed_level = 130000, damage_percent = 112},
		[57] = {needed_level = 150000, damage_percent = 114},
		[58] = {needed_level = 170000, damage_percent = 116},
		[59] = {needed_level = 180000, damage_percent = 118},
		[60] = {needed_level = 200000, damage_percent = 120},
	}
}

function ResetSystem:getCount(pid)
	return getPlayerResets(pid)
end

function ResetSystem:setCount(pid, value)
	setPlayerResets(pid, value)
end

function ResetSystem:addCount(pid)
	self:setCount(pid, self:getCount(pid) + 1)
end

function ResetSystem:getInfo(pid)
	return self.Reset[math.min(self:getCount(pid), #self.Reset)]
end

function ResetSystem:addBonuses(pid)
	local bonus = self:getInfo(pid)
	if (bonus and bonus.damage_percent) then
		setPlayerDamageMultiplier(pid, getPlayerDamageMultiplier(pid) + (bonus.damage_percent / 100.0))
	end
end

function ResetSystem:removeBonuses(pid)
	local bonus = self:getInfo(pid)
	if (bonus and bonus.damage_percent) then
		setPlayerDamageMultiplier(pid, getPlayerDamageMultiplier(pid) - (bonus.damage_percent / 100.0))
	end
end

function ResetSystem:execute(pid)
	self:removeBonuses(pid)
	local oldMaxHealth = getCreatureMaxHealth(pid)
	local oldMaxMana = getCreatureMaxMana(pid)
	local playerLevel = getPlayerLevel(pid)
	if (playerLevel > self.back_to_level) then
		doPlayerAddExperience(pid, getExperienceForLevel(self.back_to_level) - getPlayerExperience(pid))
		playerLevel = self.back_to_level
	end
		
	self:addCount(pid)
	self:addBonuses(pid)

	setCreatureMaxHealth(pid, oldMaxHealth)
	setCreatureMaxMana(pid, oldMaxMana)
	doCreatureAddHealth(pid, oldMaxHealth)
	doCreatureAddMana(pid, oldMaxMana)

	local bonus = self:getInfo(pid)
	if (bonus) then
		local message = "[RESET-SYSTEM]\nVocê efetuou seu " .. self:getCount(pid) .. "° RESET."
		if (bonus.damage_percent) then
			message = message .. "\nAgora você tem +" .. bonus.damage_percent .. "% de dano."
		end
		doPlayerSendTextMessage(pid, MESSAGE_EVENT_ADVANCE, message)
        doRemoveCreature(pid)
	end
end