local config = {
	rateExperience = getConfigInfo('rateExperience'),
	rateSkill = getConfigInfo('rateSkill'),
	rateLoot = getConfigInfo('rateLoot'),
	rateMagic = getConfigInfo('rateMagic'),
	rateSpawnMin = getConfigInfo('rateSpawnMin'),
	rateSpawnMax = getConfigInfo('rateSpawnMax'),
	protectionLevel = getConfigInfo('protectionLevel'),
	stages = getBooleanFromString(getConfigInfo('experienceStages'))
}

function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 10)) then
		return true
	end

	local exp = config.rateExperience
	if(config.stages) then
		exp = getExperienceStage(getPlayerLevel(cid), getVocationInfo(getPlayerVocation(cid)).experienceMultiplier)
	end

	doPlayerPopupFYI(cid, "Server Info\n\nExperience rate: x" .. exp .. " [STAGES]\nLoss House: 6 days offline\nKills/day to red skull: 50\nKills/week to red skull: 250\nKills/month to red skull: 650\nKills/day to black skull: 150\nKills/week to black skull: 350\nKills/month to black skull: 750\nMax Connections Per IP: 4\nLevel to buy house: 5000\nServer Save: 00:00 [BR TIME]\n\nRate Status:\nSkills rate: x" .. config.rateSkill .. "\nLoot rate: x" .. config.rateLoot .. "\nMagic rate: x" .. config.rateMagic .. "\nSpawns rate: x" .. config.rateSpawnMin .. " - x" .. config.rateSpawnMax .. "\nProtection level: " .. config.protectionLevel)
	return true
end
