local freeBlessMaxLevel = 1000
 
function onLogin(cid)
	
	if(getPlayerLevel(cid) <= freeBlessMaxLevel and not getPlayerBlessing(cid,1)) then
		for b=1, 5 do
			doPlayerAddBlessing(cid, b)
		end
		doCreatureSay(cid, 'Voce tem bless gratuita, porque seu level � menor que 1000', TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_HOLYDAMAGE)
		elseif(getPlayerBlessing(cid,1)) then
	doCreatureSay(cid, 'Voc� j� tem bless!', TALKTYPE_ORANGE_1)
	else
	doCreatureSay(cid, 'Voc� n�o tem bless. Digite !bless cuidado pode dar exausted', TALKTYPE_ORANGE_1)
	end
	return true
end