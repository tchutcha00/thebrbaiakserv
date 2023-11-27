local function getSpell(cid)
	local voc = getPlayerVocation(cid)
	if voc == 1 or voc == 5 then
		return "exevo mega mort (Rage of The Death)"
	elseif voc == 2 or voc == 6 then
		return "exevo mega frigo (Rage of The Ice)"
	elseif voc == 3 or voc == 7 then
		return "exevo mas song (Divine Song)"
	elseif voc == 4 or voc == 8 then
		return "exori mas gran (Massive Fierce Berserk)"
	end
	return ""
end

local nme = getCreatureName(getNpcCid())

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)        npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg)  NpcSystem.parseParameters(npcHandler,cid) npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()              npcHandler:onThink()            end
function onPlayerEndTrade(cid)        npcHandler:onPlayerEndTrade(cid)      end
function onPlayerCloseChannel(cid)      npcHandler:onPlayerCloseChannel(cid)    end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	local msg = string.lower(msg)
  
  	if msgcontains(msg,"task") then
  		if getPlayerStorageValue(cid,722357) == -1 then
  			selfSay('Para conseguir a spell, você precisa matar 50 players. Você aceita? PS: Matar players com o mesmo IP que você ou mais de 100 leveis abaixo do seu não conta.',cid)
  			talkState[talkUser] = 20
  		elseif getPlayerStorageValue(cid,722357) == 1 then
  			local kills = getPlayerStorageZero(cid,722358)
  			if kills >= 50 then
  				doSendMagicEffect(getThingPos(cid),30)
  				selfSay('Muito bem, você completou a task! A sua nova magia é'..": {"..getSpell(cid).."}.")
  				doPlayerSetStorageValue(cid,722357,2)
  				doPlayerSetStorageValue(cid,722510,1)
  			else
  				selfSay("Você matou "..kills.."/50 players. Continue com o bom trabalho",cid)
  			end
  		elseif getPlayerStorageValue(cid,722357) == 2 then
  			selfSay("Você já tem sua magia: "..getSpell(cid).."!",cid)
  		end
 	elseif agreeNPC(msg) and talkState[talkUser] == 20 then
 		doPlayerSetStorageValue(cid,722357,1)
 		selfSay('Certo, boa sorte! Volte aqui quando tiver matado todos.',cid)
 		talkState[talkUser] = cid
 	end
 	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
