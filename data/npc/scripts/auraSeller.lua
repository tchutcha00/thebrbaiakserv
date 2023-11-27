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
		selfSay('Eu posso te vender a aura mística por 100 {Aura Tokens}, essa aura é a prova de que você é um guerreiro experiente e corajoso que já desbravou toda a ilha de Tanoris. Você quer comprar?',cid)
		talkState[talkUser] = 10
	elseif msgcontains(msg,'aura token') or msgcontains(msg,'aura tokens') then
		selfSay('Aura Tokens são moedas especiais que dropam dos monstros da ilha de Tanoris, monstros que só podem ser caçados em grupo.',cid)
	elseif agreeNPC(msg) and talkState[talkUser] == 10 then
		if getPlayerStorageValue(cid,storage) == -1 then
			if doPlayerRemoveItem(cid,real_token,100) then
				doPlayerSetStorageValue(cid,storage,1)
				startAura(cid)
				selfSay('Parabéns, agora você possui a aura e pode provar ser um grande e experiente guerreiro.',cid)
			else
				selfSay('Você não tem Aura Tokens o suficiente.',cid)
			end
		else
			selfSay('Você já possui a aura, nobre guerreiro!',cid)
		end
	elseif disagreeNPC(msg) and talkState[talkUser] == 10 then
		selfSay('Tudo bem, esta é uma escolha sua.',cid)
	end
   
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())