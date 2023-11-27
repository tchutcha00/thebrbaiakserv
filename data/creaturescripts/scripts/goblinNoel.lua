function onDeath(cid, corpse, killer)
	local santa = getCreatureByName"Papai Noel"
	if santa then
		local max = getCreatureMaxHealth(santa)
		local santaPos = getThingPos(santa)
		local pos = getThingPos(cid)
		doSendMagicEffect(pos, CONST_ME_FIREAREA)
		doSendAnimatedText(pos, "...", COLOR_RED)
		doCreatureAddHealth(santa, -(max*0.1))
		doSendAnimatedText(santaPos, max*0.1, COLOR_RED)
		doCreatureSay(santa, "Oh não, meu goblin!!", TALKTYPE_MONSTER_SAY)
		doSendMagicEffect(santaPos, CONST_ME_DEATH)
		doCreateMonster(getCreatureName(cid), getThingPos(cid))
	end
	return true
end
