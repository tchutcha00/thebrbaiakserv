function onUse(cid, item, fromPosition, itemEx, toPosition)

local config={
removeOnUse = "yes" -- remover quando usar ("yes" or "no")
}

local days = 15 -- coloque os dias que serão a VIP!
local daysvalue = days * 24 * 60 * 60
local storageplayer = getPlayerStorageValue(cid, 13504)
local timenow = os.time()

if getPlayerStorageValue(cid, 13504) - os.time() <= 0 then
time = timenow + daysvalue
else
time = storageplayer + daysvalue
end

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Foi adicionado ".. days .." de SUPER VIP no seu character.")
setPlayerStorageValue(cid, 13504, time)
local quantity = math.floor((getPlayerStorageValue(cid, 13504) - timenow)/(24 * 60 * 60))
doSendMagicEffect(getPlayerPosition(cid), math.random(28,30)) 
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você tem ".. quantity .." dias de SUPER VIP restantes.")
if (config.removeOnUse == "yes") then
doRemoveItem(item.uid, 1)
end

return true
end