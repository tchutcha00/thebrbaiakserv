function onGainExperience(cid, exp)
	if isPremium(cid) then
		exp = exp * 1.1
	end

	-- castles experience bonus
	local guildId = getPlayerGuildId(cid)
	if guildId ~= 0 then
		if guildId == Castle48h.dominant then
			exp = exp * 1.2
		end

		if guildId == getGlobalStorageValue(10293) then
			exp = exp * 1.1
		end
	end
	
	exp = exp * expPotions:getCombo(cid)
	return exp
end