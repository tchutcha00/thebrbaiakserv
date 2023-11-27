local config = {
storage = 19400, 
cor = "orange", 
tempo = 2, 
price = 200000, 
level = 5000 
}


function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return true
end


if getPlayerLevel(cid) >= config.level then
if getPlayerStorageValue(cid, config.storage) - os.time() <= 0 then
if doPlayerRemoveMoney(cid, config.price) then
setPlayerStorageValue(cid, config.storage, os.time() + (config.tempo*60)) 
local result = "[/all] --> "..getCreatureName(cid).." ["..getPlayerResets(cid).."] ["..getPlayerLevel(cid).."]: "..param..""
if getPlayerStorageValue(cid, STORAGEVALUE_HIMSELF) < os.time() then
	doBroadcastMessage(result, config.cor)
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, result)
end

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have successfully sent a broadcast, now you'll have to wait " ..config.tempo.. " minute(s) until you broadcast again.")
else
doPlayerSendCancel(cid, "You don't have " ..config.price.. " gp's for broadcasting.")
return true
end
else
doCreatureSay(cid, "You have to wait " ..(getPlayerStorageValue(cid, config.storage) - os.time()).. " seconds until you can broadcast again", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
return true
end
else
doPlayerSendCancel(cid, "You have to be level " ..config.level.. " or more in order to use broadcast.")
end
return true
end