function onKill(cid, target, lastHit)
    if(isMonster(target) and isPlayer(cid)) then -- check seguranca do player 
        local m_name = getCreatureName(target)
        local v = tasktabble.tasks[string.lower(m_name)]
        if (v) then 
            if (getPlayerStorageValue(cid, v.storage_start) >= 1) then
                local contagem = tonumber(getPlayerStorageValue(cid, v.storage))
                if not contagem then return true end
                if contagem > v.count then return true end
                setPlayerStorageValue(cid, v.storage, contagem + 1)
                -- Mais facil do usuario configurar e melhor
                if (contagem == v.count) then 
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, string.format("Parabéns! Você finalizou a Task do %s. Vá até o NPC pegar a sua recompensa!", m_name))
                else 
                    if getPlayerStorageValue(cid, STORAGEVALUE_TASKMESSAGE) == -1 then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, string.format("[TASKS] -> %d %s mortos. Total [%d/%d]", contagem, m_name, contagem, v.count))
                    end
                end 
            end
        end
    end 
    return true 
end