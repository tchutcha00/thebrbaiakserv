local talkState = {}
local focus, old_focus = 0, 0 
local money_pos = {x=132,y=58,z=6}
local player_pos = {x=133,y=57,z=6}
local depot_pos = {x=131,y=58,z=6}
local nme = "Cassino"

function msgcontains(txt, str) 
	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)')) 
end 
 
function onCreatureSay(cid, type, msg) 
	local msg = string.lower(msg) 
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid 

	local function rollDice(cid,ammount,bet)
		doCleanTile(depot_pos)
		doSendMagicEffect(depot_pos,CONST_ME_CRAPS)
		local win = bet == "l" and {1,2,3} or {4,5,6}
		local lose = bet == "l" and {4,5,6} or {1,2,3}
		local roll = math.random(8)
		if isInArray(win,roll) then
			doCreatureSay(getNpcId(),"Cassino rolled a "..roll,TALKTYPE_MONSTER_SAY)
			doPlayerAddMoney(cid,math.abs(ammount * 2) * 1000000)
			selfSay(gm(cid,nme,1).." ".. math.abs(ammount * 2) .."kks, "..gm(cid,nme,2))
			addEvent(doSendMagicEffect,300,depot_pos,28)
		else
			local msg = roll > 6 and lose or {roll}
			local number = msg[math.random(#msg)]
			doCreatureSay(getNpcId(),"Cassino rolled a "..number,TALKTYPE_MONSTER_SAY)
			selfSay(gm(cid,nme,3))
			addEvent(doSendMagicEffect,300,depot_pos,3)
		end
	end
 
	if isInArray({"l","h"},msg) and focus == cid then
		local money = getTileItemById(money_pos,9971)
		if money and money.uid and money.uid > 0 then
			if money.type <= 50 then
				doCleanTile(money_pos)
				doCreateItem(9971,money.type,depot_pos)
				addEvent(rollDice,800,cid,money.type,msg)
			else
				selfSay(gm(cid,nme,4))
			end
		else
			selfSay(gm(cid,nme,5))
		end
	end 
end

function onThink()

	local player = getTopCreature(player_pos)
	if player and player.uid and player.uid > 0 and isPlayer(player.uid) then
		if old_focus ~= player.uid then
			if getPlayerStorageValue(player.uid,722518) < os.time() then
				selfSay(gm(player.uid,nme,6)..", "..getCreatureName(player.uid).."! "..gm(player.uid,nme,7))
				doPlayerSetStorageValue(player.uid,722518,os.time()+120)
			end
			doPlayerSetStorageValue(player.uid,722519,os.time()+120)
		end
		if getPlayerStorageValue(player.uid,722519) < os.time() then
			doTeleportThing(player.uid,getTownTemplePosition(1))
			doPlayerSendTextMessage(player.uid,MESSAGE_STATUS_CONSOLE_BLUE,gm(player.uid,nme,8))
			old_focus = 0
		end
 		focus = player.uid
	else
		old_focus = focus and focus or old_focus
		focus = nil
		if getGlobalStorageValue(722520) < os.time() then
			selfSay"Venha tentar a sua sorte! Diga L para apostar entre 1 e 3 ou H para apostar entre 4 e 6, se ganhar você recebe o DOBRO do que apostou!"
			setGlobalStorageValue(722520,os.time()+60)
		end
	end

end