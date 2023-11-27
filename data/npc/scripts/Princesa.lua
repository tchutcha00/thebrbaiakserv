local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser,msg = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid,msg:lower()
local storage_need,storage_give = 874570,27384
if (msgcontains(msg, 'lenor eu te amo') or msgcontains(msg, 'lenor te amo')) then
if getPlayerStorageValue(cid, storage_give) > 0  then
selfSay('Você ja ganhou sua recompensa, suma!', cid) return true
end
if getPlayerStorageValue(cid, storage_need) <= 0  then
doCreatureAddHealth(cid, -getCreatureHealth(cid)) 
else
selfSay('parabens, voce tem minha permissao para passar na porta', cid)
setPlayerStorageValue(cid, storage_give, 1)
end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
