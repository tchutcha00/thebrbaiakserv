local t = {
    gStorage = 25252, -- Só mexa se necessário.
    msgoff = "O evento de backpack não está aberto no momento.", -- Mensagem caso não esteja aberto.
    effect = CONST_ME_TELEPORT, -- Efeito ao teleportar.
    pos = {x = 284, y = 274, z = 7} -- Posição que o comando irá levar.
}

function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 3)) then
    return true
  end 
    
    if getGlobalStorageValue(t.gStorage) >= 1 then
        if getCreatureCondition(cid, CONDITION_INFIGHT) == false then
            if getTilePzInfo(getPlayerPosition(cid)) == true then
                doTeleportThing(cid, t.pos)
                doSendMagicEffect(getPlayerPosition(cid), t.effect)
             else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Vá até uma zona de proteção para usar o comando.")
            end
        else
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não pode usar o comando em batalha.")
        end
    else
       doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, t.msgoff)
    end
   return true
end