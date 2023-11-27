local keywordHandler = KeywordHandler:new()
	local npcHandler = NpcHandler:new(keywordHandler)
	NpcSystem.parseParameters(npcHandler)
	local talkState = {}

	function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
	function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
	function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
	function onThink()					npcHandler:onThink()					end


function creatureSayCallback(cid, type, msg)

		if(not npcHandler:isFocused(cid)) then
			return false
		end

		local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

		local Configs = {
		item1_id = 5901,
		level_min = 1000,
	}
	local tp = {x=2546, y=2533, z=7}


	if msgcontains(msg, 'woods') then

		if getPlayerItemCount(cid, Configs.item1_id) >=100 then
			if getPlayerLevel(cid) >= Configs.level_min then
				selfSay('Boa Sorte Guerreiro!', cid)
				doPlayerRemoveItem(cid, 5901, 100)
				doTeleportThing (cid, tp, TRUE)
			else
				selfSay('Voce nao tem o level suficiente (1000)!', cid)
			end
		else
			selfSay('Meu navio esta quebrado para podermos viajar preciso de 100 madeiras.', cid)
		end

	end

end
		npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
		npcHandler:addModule(FocusModule:new())