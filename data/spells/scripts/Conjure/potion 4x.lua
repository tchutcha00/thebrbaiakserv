function onCastSpell(cid, var) 
	
local soul = 50
	
if getPlayerStorageValue(cid, 64858) >= 10 then
local potion = doPlayerAddItem(cid, 6544, 1)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Você conjurou uma 4x", TALKTYPE_ORANGE_1)
doPlayerAddSoul(cid, -soul)
else
doPlayerSendTextMessage(cid, 19, "Você não possui esse comando, pois nao fez a quest da Conjure 4x")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end