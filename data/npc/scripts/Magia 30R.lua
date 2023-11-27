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

if(msgcontains(msg, 'Target Druid')) then
if getPlayerStorageValue(cid, 21466) < 1 then
setPlayerStorageValue(cid, 21466, 10)
selfSay('Parabéns, você aprendeu a magia {Exori Max Frigo}.', cid)
doSendMagicEffect(getPlayerPosition(cid), 6)
else
npcHandler:say("Você já ganhou a magia.", cid)
end

elseif(msgcontains(msg, 'Target Sorc')) then
if getPlayerStorageValue(cid, 21466) < 1 then
setPlayerStorageValue(cid, 21466, 10)
selfSay('Parabéns, você aprendeu a magia {Exori Max Flam}.', cid)
doSendMagicEffect(getPlayerPosition(cid), 53)
else
npcHandler:say("Você já ganhou a magia.", cid)
end

elseif(msgcontains(msg, 'Target Paladin')) then
if getPlayerStorageValue(cid, 21466) < 1 then
setPlayerStorageValue(cid, 21466, 10)
selfSay('Parabéns, você aprendeu a magia {Exori Max Con}.', cid)
doSendMagicEffect(getPlayerPosition(cid), 44)
else
npcHandler:say("Você já ganhou a magia.", cid)
end

elseif(msgcontains(msg, 'Target Knight')) then
if getPlayerStorageValue(cid, 21466) < 1 then
setPlayerStorageValue(cid, 21466, 10)
selfSay('Parabéns, você aprendeu a magia {Exori Max Hur}.', cid)
doSendMagicEffect(getPlayerPosition(cid), 53)
else
npcHandler:say("Você já ganhou a sua magia.", cid)
end
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())