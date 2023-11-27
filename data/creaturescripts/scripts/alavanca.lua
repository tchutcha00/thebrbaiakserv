local itemids = {1945, 1946, 9825, 9826} -- ids das alavancas 

local function checkItemTarget(pos)
    for _, v in ipairs(itemids) do 
        local item = getTileItemById(pos, v)
        if (item.uid > 0) then 
            return true
        end 
    end 
    return false
end 


function onThrow(cid, item, fromPosition, toPosition)
    if (checkItemTarget(toPosition)) then
       doPlayerSendCancel(cid, "You cannot move items to lever positions.")
       doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
       return false
    end
    return true
end