function onLogin(cid)
	ResetSystem:addBonuses(cid)
	registerCreatureEvent(cid, "RSGainExperience")
	registerCreatureEvent(cid, "RSAdvance")
	return true
end

function onGainExperience(cid, source, experience)
	local resetBonus = ResetSystem:getInfo(cid)
	if (resetBonus and resetBonus.exp_percent > 0) then
		experience = experience * (1.0 + (resetBonus.exp_percent / 100.0))
	end
	return experience
end