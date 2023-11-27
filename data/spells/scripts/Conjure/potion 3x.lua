local resets = 10	
local soul = 50

function onCastSpell(cid, var) 
if getPlayerResets(cid) >= resets then
  else
	doPlayerPopupFYI(cid, "Você precisa ter ["..resets.."] resets e completar a quest da conjure 10x para conjurar.")
    return true
  end
if getPlayerStorageValue(cid, 64859) >= 10 then
local potion = doPlayerAddItem(cid, 6543, 1)
doSendMagicEffect(getCreaturePosition(cid),13)
doCreatureSay(cid, "Você conjurou uma 3x", TALKTYPE_ORANGE_1)
doPlayerAddSoul(cid, -soul)
else
doPlayerSendTextMessage(cid, 19, "Você não possui esse comando, pois nao fez a quest da Conjure 3x")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
end