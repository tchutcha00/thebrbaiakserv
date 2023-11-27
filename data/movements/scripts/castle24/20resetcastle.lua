function onStepIn(cid, item, position, fromPosition)

local reset = 20 ---Quantidade de reset necessaria--------



function getPlayerReset(cid)

local qr = db.getResult("SELECT `reset` FROM `players` WHERE `id`= "..getPlayerGUID(cid)..";")

rss = qr:getDataInt("reset", getPlayerGUID(cid))

if rss <= 0 then

rss = 0

end

return tonumber(rss)

end



if getPlayerReset(cid) < reset then

doTeleportThing(cid, fromPosition, true)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa ter " .. reset .. " reset para passar.")

doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)

return TRUE

end


return TRUE

end