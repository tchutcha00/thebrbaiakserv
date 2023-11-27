--[[ script By gean Riot SUBWAT PARA XTIBIA!]]--  
local nme = "firewalker"

function onSay(cid, words, param) 
	if(not checkExhausted(cid, 7384, 3)) then
		return true
	end
	local config = { 
		price = 20000, 
		new_soft = 9933, -- id da nova bota que vai ser dada 
		worn_soft = 10022 -- id da bota velha que vai ser retirada 
	} 
	 
	if getPlayerItemCount(cid, config.worn_soft) >= 1 then 
		if doPlayerRemoveMoney(cid,config.price) == true then 
			doPlayerRemoveItem(cid,config.worn_soft,1) 
			doPlayerAddItem(cid,config.new_soft, 1)  
			doSendMagicEffect(getPlayerPosition(cid), math.random(28,30)) 
			doCreatureSay(cid, "Firewalker Boots Repaired", TALKTYPE_ORANGE_1) 
		else 
			doPlayerSendCancel(cid, gTm(cid,nme,1)..' ' .. config.price ..' '..gTm(cid,nme,2)) 
		end 
	else 
		doPlayerSendCancel(cid, gTm(cid,nme,3)..' ' .. getItemNameById(config.worn_soft) .. ' '..gTm(cid,nme,4)) 
	end 
	return true 
end
