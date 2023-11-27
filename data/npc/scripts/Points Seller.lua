local keywordHandler = KeywordHandler:new()
	local npcHandler = NpcHandler:new(keywordHandler)
	NpcSystem.parseParameters(npcHandler)
	local talkState = {}
    
	function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
	function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
	function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
	function onThink()					npcHandler:onThink()					end


function creatureSayCallback(cid, type, msg)
    local pid = getPlayerGUID(cid)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if msgcontains(msg, 'points') then
            selfSay('Posso trocar 7 boss points por 1 premium points. Você possui 7 boss points? Se sim, diga {yes}.', cid)     
            talkState[talkUser] = 1
    elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
	if doPlayerRemoveItem(cid, 9020,7) then
			local points = "UPDATE `accounts` SET `premium_points` = `premium_points` + 1 WHERE `id` = '"..getPlayerAccountId(cid).."'"
			npcHandler:say("Você recebeu 1 points na sua account.", cid)
			doSendMagicEffect(getThingPos(cid), 28)
            db.executeQuery(points)
        else
            selfSay("Você não possui 7 boss points.", cid)
    end

    talkState[talkUser] = 0
end 
end

npcHandler:setMessage(MESSAGE_GREET, "|PLAYERNAME|, Eu troco 7 boss points por 1 premium points diga {points}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Volte logo!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())