function onKill(cid)
    if isPlayer(cid) then
        setPlayerStorageValue(cid, 167912, math.max(0, getPlayerStorageValue(cid, 167912)) + 1)
    end
    return true
end

function onDeath(cid, corpse, deathList)
    local target = deathList[1]
    if target and isPlayer(target) then
        setPlayerStorageValue(cid, 167913, math.max(0, getPlayerStorageValue(cid, 167913)) + 1)
    end
    return true
end