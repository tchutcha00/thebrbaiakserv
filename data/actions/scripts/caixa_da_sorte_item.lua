local items = {
    premium = {10569, 8866, 7730, 8983, 7892, 7889, 3972, 2505, 8923, 3982, 8909, 11387, 2501, 2503, 2504, 2538, 2646, 10719, 10309},
    free = {12599, 12739, 8300, 7489, 9693, 12769}
}

if not luckyBoxCache then
    luckyBoxCache = {}
end

function onUse(cid, item)
    local playerId = getPlayerGUID(cid)
    if not luckyBoxCache[playerId] then
        luckyBoxCache[playerId] = 0
    end

    local now = os.time()
    if luckyBoxCache[playerId] > now then
        doPlayerSendCancel(cid, 'Aguarde ' .. (luckyBoxCache[playerId] - now) .. ' segundos.')
        return true
    end

    local itemsVec = items.free 
    if math.random() <= 0.20 then
        itemsVec = items.premium
    end

    local mainBackpack = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK).uid
    if mainBackpack == 0 then
        doPlayerSendCancel(cid, 'Você precisa ter uma backpack main para receber o item.')
        return true
    end

    local playerName = getPlayerName(cid)
    local id = itemsVec[math.random(#itemsVec)]
    local reward = doCreateItemEx(id, 1)

    if doAddContainerItemEx(mainBackpack, reward) ~= RETURNVALUE_NOERROR then
        doPlayerSendCancel(cid, 'Libere espaço em sua mochila.')
        return true
    end

    local file = 'data/logs/lucky_box_fails.log'
    if itemsVec == items.premium then
        local period = 3 * 24 * 60 * 60
        doItemSetPeriod(reward, period)
        doSendMagicEffect(getThingPos(cid), 6)
        file = 'data/logs/lucky_box_wins.log'
        doBroadcastMessage(('[Caixa da Sorte]: O jogador %s acaba de encontrar %dx %s com duração de 3 dias, parabéns.'):format(playerName, 1, getItemInfo(id).name), MESSAGE_EVENT_ADVANCE)
    end

    doWriteLogFile(file, ('Player: %s | Reward: %s'):format(playerName, getItemInfo(id).name))
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, ('Parabéns, você recebeu %dx %s.'):format(1, getItemInfo(id).name))
    doSendMagicEffect(getThingPos(cid), 27)
    doRemoveItem(item.uid)
    return true
end
