local function getBlessWarningTime(cid)
    return BlessWarnings[cid] and BlessWarnings[cid] or 1
end

function onThink(cid, interval)
    local thingPos = getCreaturePosition(cid)
    local storage = getCreatureStorage(cid, 23333)
    if getTilePzInfo(thingPos) == false then
        if storage == 1 then
            if getBlessWarningTime(cid) < os.time() then
                BlessWarnings[cid] = os.time() + 10
                if not getPlayerBlessing(cid, 1) then
                    doPlayerPopupFYI(cid, "Você não está com todas as bless, tome cuidado!")
                end
            end
            doCreatureSetStorage(cid, 23333, EMPTY_STORAGE)
        end
    elseif getTilePzInfo(thingPos) == true and storage ~= 1 then
        doCreatureSetStorage(cid, 23333, 1)
    end
    return true
end
