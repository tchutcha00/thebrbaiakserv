function onUse(cid, item, frompos, item2, topos) 

local arma1 = 2629
local arma2 = 2635

if (getPlayerStorageValue(cid, 11578) >= os.time()) then
doCreatureSay(cid, "[Elementalz Sword] Você só pode trocar de arma a cada 3 segundos.", TALKTYPE_ORANGE_1)
doSendMagicEffect(getCreaturePosition(cid),CONST_ME_POFF)
return true
end

    if item2.itemid == arma1 then
        doTransformItem(item2.uid, arma2)
    doCreatureSay(cid, "Voce trocou de arma.", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getCreaturePosition(cid),30)
	setPlayerStorageValue(cid,11578,os.time()+2)
    elseif item2.itemid == arma2 then
        doTransformItem(item2.uid, arma1)
    doCreatureSay(cid, "Voce trocou de arma.", TALKTYPE_ORANGE_1)
	 doSendMagicEffect(getCreaturePosition(cid),30)
	 setPlayerStorageValue(cid,11578,os.time()+2)
    end
    return true
end