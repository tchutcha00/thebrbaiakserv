local keywordHandler = KeywordHandler:new()
	local npcHandler = NpcHandler:new(keywordHandler)
	NpcSystem.parseParameters(npcHandler)
	local talkState = {}
    
	function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
	function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
	function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
	function onThink()					npcHandler:onThink()					end


function creatureSayCallback(cid, type, msg)
    local tp = {x = 2572, y = 2348, z = 6}

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    if msgcontains(msg, 'sim') then
    selfSay('OK, outra coisa... Se você conseguir começar uma Hunt, você só poderá começar outra após 2 horas depois que acabar seu tempo. Você entendeu e quer prosseguir diga: {ok}', cid)
    talkState[talkUser] = 1
    elseif(msgcontains(msg, 'ok') and talkState[talkUser] == 1) then
	if getPlayerStorageValue(cid,85742) == -1 then
	doPlayerSetStorageValue(cid,85742,1)
	selfSay('Certo, você pode tentar a sorte. Lembre-se a chance de funcionar é de 35%!', cid)
    doTeleportThing (cid, tp, true)
	else
	selfSay("Você já fez o acesso!", cid)
	    end 
    end
end 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())