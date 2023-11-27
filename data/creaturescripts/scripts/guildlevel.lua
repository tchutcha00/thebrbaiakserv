function onLogin(cid)
    registerCreatureEvent(cid, "GuildLevelKill")
    local playerGuildId = getPlayerGuildId(cid)
    if playerGuildId ~= 0 then
        local guildBonusRate = GuildSystem:getExpConfig(playerGuildId, "bonus")
        if guildBonusRate > 0 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, string.format("[Guild System]: You have %d%% more of experience.", guildBonusRate))
        end
    end
    return true
end

function onDeath(cid, corpse, deathList)
    if not isPlayer(cid) then
        return true
    end
    local killer = deathList[1]
    if not isCreature(killer) then
        return true
    end
    if isSummon(killer) then
        killer = getCreatureMaster(killer)
    end
    
    if not isPlayer(killer) then
        return true
    end

    local playerGuildId, targetGuildId = getPlayerGuildId(killer), getPlayerGuildId(cid)
    
    if (playerGuildId == 0) or (targetGuildId == 0) or (playerGuildId == targetGuildId) then
        return true
    end
    
    if GuildSystem.checkMultiClient then
        if getPlayerIp(killer) == getPlayerIp(cid) then
            return true
        end
    end
    
    if not playerGuildId or not targetGuildId then
        return true
    end
    
    local playerGuildLevel = GuildSystem:getLevel(playerGuildId)
    local expForLevel = GuildSystem:getExpForAdvanceLevel(playerGuildLevel)

    if expForLevel ~= 0 then
        local playerGuildExp = GuildSystem:getExperience(playerGuildId)
        local addedExp = GuildSystem:getExpConfig(playerGuildId, "kill")
        local newPlayerGuildExp = playerGuildExp + addedExp
        GuildSystem:doAddExperience(playerGuildId, addedExp)
        while ((newPlayerGuildExp >= expForLevel) and (expForLevel ~= 0)) do
            GuildSystem:doAddLevel(playerGuildId, 1)
            playerGuildLevel = playerGuildLevel + 1
            expForLevel = GuildSystem:getExpForAdvanceLevel(playerGuildLevel)
        end
    end
    
    local targetGuildExp = GuildSystem:getExperience(targetGuildId)
    local targetGuildLevel = GuildSystem:getLevel(targetGuildId)
    local removedExp = - math.min(targetGuildExp, math.abs(GuildSystem:getExpConfig(targetGuildId, "death")))
    local newTargetGuildExp = targetGuildExp + removedExp
    local targetExpForLevel = GuildSystem:getExpForAdvanceLevel(targetGuildLevel - 1)
    
    GuildSystem:doAddExperience(targetGuildId, removedExp)
    
    while (targetGuildLevel > 1 and (newTargetGuildExp < targetExpForLevel)) do
        GuildSystem:doAddLevel(targetGuildId, -1)
        targetGuildLevel = targetGuildLevel - 1
        targetExpForLevel = GuildSystem:getExpForAdvanceLevel(targetGuildLevel - 1)
    end
    
    return true
end
