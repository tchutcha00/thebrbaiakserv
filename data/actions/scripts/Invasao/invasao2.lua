local t = {
    players = { 
        [1] = Position(1,1,1),
        [2] = Position(1,1,1),
        [3] = Position(1,1,1),
        [4] = Position(1,1,1),
        [5] = Position(1,1,1)
    },
    
    boss = {name = "King Monster", create_pos = Position(118,89,7)},
  
    destination = Position(113,89,7), 
    
    cooldown = {20, "hour"}, 
    
    storage = 56482 
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local players, tab = {}, t.players
    for i = 1, #tab do
        local tile = Tile(tab[i])
        if tile then
            local p = Player(tile:getTopCreature())
            if p then
                if p:getStorageValue(t.storage) <= os.time() then
                    players[#players + 1] = p:getId()
                end
            end
        end
    end
    if #players == 0 then
        player:sendCancelMessage("None of the players did not wait " .. getStrTime(t.cooldown) .. " to go again.")
        return true
    end
    for i = 1, #tab do
        local playerTile = Tile(tab[i])
        local playerToGo = Player(playerTile:getTopCreature())
        if playerToGo then
            if isInArray(players, playerToGo:getId()) then
                playerToGo:setStorageValue(t.storage, mathtime(t.cooldown) + os.time())
                playerTile:relocateTo(t.destination)
                tab[i]:sendMagicEffect(CONST_ME_POFF)
            end
        end
    end
    t.destination:sendMagicEffect(CONST_ME_TELEPORT)
    Game.createMonster(t.boss.name, t.boss.create_pos)
    item:transform(item.itemid == 9825 and 9826 or 9825)
    return true
end

function mathtime(table) -- by dwarfer
local unit = {"sec", "min", "hour", "day"}
for i, v in pairs(unit) do
if v == table[2] then
return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
end
end
return error("Bad declaration in mathtime function.")
end

function getStrTime(table) -- by dwarfer
local unit = {["sec"] = "second",["min"] = "minute",["hour"] = "hour",["day"] = "day"}
return tostring(table[1].." "..unit[table[2]]..(table[1] > 1 and "s" or ""))
end