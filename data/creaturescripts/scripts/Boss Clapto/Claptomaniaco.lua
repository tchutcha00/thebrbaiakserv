local bosses = {"Claptomaniaco", "Claptomaniaco", ...}                 --Configure esta tabela com o nome dos monstros que terão o loot espalhado.

local function doSpreadLoot(fromPosition, toPosition, container)
    for slot = (getContainerSize(container.uid) - 1), 0, -1 do
        local item = getContainerItem(container.uid, slot)
        if not isContainer(item.uid) then
            local position = {
                x = math.random(fromPosition.x, toPosition.x),
                y = math.random(fromPosition.y, toPosition.y),
                z = fromPosition.z,
            }
            local itemEx = doCreateItemEx(item.itemid, item.type)
            if doTileAddItemEx(position, itemEx) then
                doRemoveItem(item.uid)
            end
        else
            doSpreadLoot(fromPosition, toPosition, item)
            doRemoveItem(item.uid)
        end
    end    
    return true
end

function onKill(cid, target)
    if isMonster(target) and isInArray(bosses, getCreatureName(target)) then
        local position = getCreaturePosition(target)
        local name = getCreatureName(target)
        
        local fromPosition = {x = position.x - 1, y = position.y - 1, z = position.z}
        local toPosition = {x = position.x + 1, y = position.y + 1, z = position.z}
        
        addEvent(function()
            local container = getTileItemById(position, getMonsterInfo(name).lookCorpse)
            if container.uid > 0 then
                doSpreadLoot(fromPosition, toPosition, container)
            end
        end, 100)
    end
    return true
end