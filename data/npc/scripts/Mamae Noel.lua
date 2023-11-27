local premios = {9942,7440,9941,2328,10142}

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
  local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
  local msg = string.lower(msg)
  if msgcontains(msg,"christmas surprise bag") then
    if getPlayerItemCount(cid,6507) >= 1 then
      selfSay("Você quer trocar uma christmas surprise bag por um presente aleatório? Psiu, vale a pena Ho ho ho!",cid)
      talkState[talkUser] = 20
    else
      selfSay("Você não tem nenhuma christmas surprise bag com você... Que pena, eu estava com o seu presente bem aqui!",cid)
    end
  elseif msgcontains(msg,"yes") and talkState[talkUser] == 20 then
    if doPlayerRemoveItem(cid,6507,1) then
      local premio = premios[math.random(1,#premios)]
      doPlayerAddItem(cid,premio,1)
      selfSay("Ho ho ho você ganhou 1 "..getItemNameById(premio).." de presente! Feliz natal!",cid)
    else
      selfSay("Você não está com nenhuma christmas surprise bag!",cid)
    end
    elseif msgcontains(msg,"no") and talkState[talkUser] == 20 then
      selfSay("Mas por que não?! Eu ia te dar um presente muito legal...",cid)
    end

  return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
