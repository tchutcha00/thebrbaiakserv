-- Guild Level System by Dwarfer 

GuildSystem = {

    experienceTable = {
    
        mode = "level",
        
        level = {
            [1] = 100, 
            [2] = 200, 
            [3] = 300,
            [4] = 400,
            [5] = 500,
            [6] = 600,
            [7] = 700, 
            [8] = 800, 
            [9] = 900, 
            [10] = 1000, 
            [11] = 1100, 
            [12] = 1200, 
            [13] = 1300, 
            [14] = 1400, 
            [15] = 1500, 
            [16] = 1600, 
            [17] = 1700, 
            [18] = 1800, 
            [19] = 1900, 
            [20] = 2000, 

        },
        
        levelRange = {
            [{1, 2}] = 10,
            [{3, 6}] = 15,
            [{7, 10}] = 20,
            [{11, 19}] = 30,
            [{20, math.huge}] = 40
        }
    
    }, 
    
    config = {
        [{1, 1}] = {expPerKill = 10, expPerDeath = -5, bonusExpPercent = 0},
        [{2, 4}] = {expPerKill = 10, expPerDeath = -5, bonusExpPercent = 5},
        [{5, 9}] =  {expPerKill = 10, expPerDeath = -5, bonusExpPercent = 10},
        [{10, 14}] = {expPerKill = 10, expPerDeath = -5, bonusExpPercent = 15},
        [{15, 19}] = {expPerKill = 10, expPerDeath = -5, bonusExpPercent = 20},
        [{20, math.huge}] =  {expPerKill = 10, expPerDeath = -5, bonusExpPercent = 25}
    },
    
    messageOnLevelChange = true,
    checkMultiClient = true, 

}

function GuildSystem.getLevel(self, guild_id)
    local query = db.getResult(string.format("SELECT `level` FROM `guilds` WHERE `id` = %d", guild_id))
    if query:getID() == -1 then
        return 1
    end
    local guildLevel = query:getDataInt("level")
    query:free()
    return guildLevel
end

function GuildSystem.getExpConfig(self, guild_id, action)
    local tab, guildLevel = self.config, self:getLevel(guild_id)
    for levelRange, info in pairs(tab) do
        if guildLevel >= levelRange[1] and guildLevel <= levelRange[2] then
            return (action == "kill" and info.expPerKill or (action == "death" and info.expPerDeath or info.bonusExpPercent))
        end
    end
end

function GuildSystem.getExperience(self, guild_id)
    local query = db.getResult(string.format("SELECT `experience` FROM `guilds` WHERE `id` = %d", guild_id))
    if query:getID() == -1 then
        return 0
    end
    local experience = query:getDataInt("experience")
    query:free()
    return experience
end

function GuildSystem.doAddLevel(self, guild_id, amount)
    local currentLevel = self:getLevel(guild_id)
    local newLevel = (currentLevel + amount) 
    db.query(string.format("UPDATE `guilds` SET `level` = `level` + %d WHERE `id` = %d", amount, guild_id))
    if self.messageOnLevelChange then
        local message = string.format("[Guild System]: Your guild %s from level %d to level %d.", (amount > 0 and "advanced" or "downgraded"), currentLevel, newLevel)
        local players = getPlayersOnline()
        for _, pid in pairs(players) do
            if getPlayerGuildId(pid) == guild_id then
                doPlayerSendChannelMessage(pid, "", message, TALKTYPE_CHANNEL_MANAGEMENT, 0)
            end
        end
    end
end

function GuildSystem.doAddExperience(self, guild_id, amount)
    return db.query(string.format("UPDATE `guilds` SET `experience` = `experience` + %d WHERE `id` = %d", amount, guild_id))
end

function GuildSystem.getExpForAdvanceLevel(self, level)
    local tab = self.experienceTable
    local expMode = tab.mode
    if expMode == "level" then
        local maxLevel = #tab.level + 1
        local expForLevel = tab.level[level]
        if (level >= maxLevel) then
            return 0
        elseif (not expForLevel) then
            return (tab.level[1] * level)
        end
        return expForLevel
    elseif expMode == "levelrange" then
        local tabExp, baseExp, sumExp = tab.levelRange, 0, 0
        for range, expForLevel in pairs(tabExp) do
            if baseExp == 0 then
                baseExp = expForLevel
            end
            if level >= range[1] and level <= range[2] then
                return (sumExp + ((level - range[1] + 1) * expForLevel))
            else
                sumExp = sumExp + range[2] * expForLevel
            end
        end
        return baseExp
    end
end