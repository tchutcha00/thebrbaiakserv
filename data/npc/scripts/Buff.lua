local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

if(msgcontains(msg, 'mage buff')) then
if getPlayerStorageValue(cid, 74516) < 1 then
setPlayerStorageValue(cid, 74516, 1)
selfSay('Parabéns, você aprendeu a magia {second mage buff}.', cid)
doSendMagicEffect(getPlayerPosition(cid), 6)
else
npcHandler:say("Você já ganhou a magia.", cid)
end

elseif(msgcontains(msg, 'pally buff')) then
if getPlayerStorageValue(cid, 74516) < 1 then
setPlayerStorageValue(cid, 74516, 1)
selfSay('Parabéns, você aprendeu a magia {second pally buff}.', cid)
doSendMagicEffect(getPlayerPosition(cid), 53)
else
npcHandler:say("Você já ganhou a magia.", cid)
end

elseif(msgcontains(msg, 'kina buff')) then
if getPlayerStorageValue(cid, 74516) < 1 then
setPlayerStorageValue(cid, 74516, 1)
selfSay('Parabéns, você aprendeu a magia {second kina buff}.', cid)
doSendMagicEffect(getPlayerPosition(cid), 44)
else
npcHandler:say("Você já ganhou a magia.", cid)
end
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())