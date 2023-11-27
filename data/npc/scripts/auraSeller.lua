local real_token = 12727
local storage = 722422

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 		  	end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)   	end
function onCreatureSay(cid, type, msg) 	NpcSystem.parseParameters(npcHandler,cid)	npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)

	if msgcontains(msg,'aura') then
		selfSay('Eu posso te vender a aura m�stica por 100 {Aura Tokens}, essa aura � a prova de que voc� � um guerreiro experiente e corajoso que j� desbravou toda a ilha de Tanoris. Voc� quer comprar?',cid)
		talkState[talkUser] = 10
	elseif msgcontains(msg,'aura token') or msgcontains(msg,'aura tokens') then
		selfSay('Aura Tokens s�o moedas especiais que dropam dos monstros da ilha de Tanoris, monstros que s� podem ser ca�ados em grupo.',cid)
	elseif agreeNPC(msg) and talkState[talkUser] == 10 then
		if getPlayerStorageValue(cid,storage) == -1 then
			if doPlayerRemoveItem(cid,real_token,100) then
				doPlayerSetStorageValue(cid,storage,1)
				startAura(cid)
				selfSay('Parab�ns, agora voc� possui a aura e pode provar ser um grande e experiente guerreiro.',cid)
			else
				selfSay('Voc� n�o tem Aura Tokens o suficiente.',cid)
			end
		else
			selfSay('Voc� j� possui a aura, nobre guerreiro!',cid)
		end
	elseif disagreeNPC(msg) and talkState[talkUser] == 10 then
		selfSay('Tudo bem, esta � uma escolha sua.',cid)
	end
   
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())