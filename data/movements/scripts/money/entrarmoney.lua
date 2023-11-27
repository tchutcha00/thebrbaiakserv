local items = {
    {9971, 100}
}
    
function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    for i = 1, #items do
        if getPlayerItemCount(cid, items[i][1]) < items[i][2] then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Atenção]: Para entrar você precisa pagar 100 gold ingots, ainda faltam ".. items[i][2] - getPlayerItemCount(cid, items[i][1]).." "..getItemNameById(items[i][1]).." , consiga nas hunts free.")
            doTeleportThing(cid, fromPosition)
            return true
        end
    end
    for i = 1, #items do
        doPlayerRemoveItem(cid, items[i][1], items[i][2])
    end
    return true
end