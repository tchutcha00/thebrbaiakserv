function onThink(cid)
    if cid ~= 0 and getPlayerIp(cid) ~= 0 then
        OnlineBonus(cid):checkStatus()
    end
    return true
end

function onLogin(cid)
    if onlineBonusCache.status ~= OB_STATUS_OFFLINE then
        OnlineBonus(cid):start()
    end
    return true
end