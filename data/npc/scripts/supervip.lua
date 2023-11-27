local STORAGE = 13504 -- Storage necessária para viajar
local DESTINO = {x = 916, y = 2974, z = 8} -- POSIÇÃO DE DESTINO
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg:lower())   end
function onThink()                  npcHandler:onThink()                  end
local talkState = {}
 
function creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
      return false
   end
 
   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
   if msgcontains(msg, "viajar") then
      selfSay("Você deseja ser teletransportado para ilha super vip?", cid)
      talkState[talkUser] = 1
   elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
      if getPlayerStorageValue(cid, STORAGE) > 0 then
         selfSay("Aí está!", cid)
         doSendMagicEffect(getThingPos(cid), 10)
         npcHandler:releaseFocus(cid)
         doTeleportThing(cid, DESTINO)
         doSendMagicEffect(DESTINO, 10)
      else
         selfSay("Me desculpe, mas você não tem acesso a ilha super vip.", cid)
      end
      talkState[talkUser] = 0
   end
 
   return true
end
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())