function onLogin(cid)
local storage = (getPlayerAccountId(cid)+550)
if getGlobalStorageValue(storage) <= 0 then
setGlobalStorageValue(storage, 1)
doPlayerAddPremiumDays(cid, 2)
doPlayerPopupFYI(cid, "Você recebeu 2 dias de VIP, bom jogo!")
end
return true
end