function doPlayerAddDepotItems(pid, item, count) --By magus and edited by vodkart
local item,count = {item},{(count or 1)}
    for k,v in ipairs(item) do
    local ls = db.getResult("SELECT `sid` FROM `player_depotitems` WHERE `player_id` = "..pid.." ORDER BY `sid` DESC LIMIT 1")
    return db.executeQuery("INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES ("..pid..", "..(ls:getDataInt("sid")+1)..", 101, "..v..", "..count[k]..", '')") or false
    end
end
function onSay(cid, words, param)
local t = string.explode(param:lower(),",")
if not t[1] then doPlayerSendCancel(cid, "digite Nome, Item ID, quantidade.") return true
elseif not getPlayerByNameWildcard(t[1]) and not getPlayerGUIDByName(t[1]) then doPlayerSendCancel(cid, "Você deve digitar um Nome Válido.") return true 
elseif not tonumber(t[2]) or not tonumber(t[3]) or tonumber(t[3]) < 1 or tonumber(t[3]) > 999 or not isItemStackable(t[2]) and tonumber(t[3]) > 10 then doPlayerSendCancel(cid, "você deve digitar NOME,ID,QUANTIDADE(maior que 0"..(not isItemStackable(t[2]) and " até 10 se não for empilhavel." or " até 1000 se for empilhavel.")..").") return true
elseif not isItemMovable(t[2]) or not getItemNameById(tonumber(t[2])) then  doPlayerSendCancel(cid, "Este item não existe ou não pode ser adicionado ao jogador.") return true
end
local player = getPlayerByNameWildcard(t[1])
if player then
local parcel = doCreateItemEx(ITEM_PARCEL)
if isItemStackable(t[2]) or tonumber(t[3]) == 1 then
doAddContainerItem(parcel, t[2], t[3])
else
for i = 1, t[3] do
doAddContainerItem(parcel, t[2], 1)
end
end
doPlayerSendMailByName(getPlayerNameByGUID(getPlayerGUIDByName(t[1])), parcel, 1)
doPlayerSendTextMessage(player, MESSAGE_EVENT_ADVANCE, "O admin adicionou "..t[3].." "..getItemNameById(t[2]).." no seu depot.")
doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "O admin adicionou "..t[3].." "..getItemNameById(t[2]).." no seu depot.")
else
local getPlayer = getPlayerGUIDByName(t[1])
if isItemStackable(t[2]) or tonumber(t[3]) == 1 then
doPlayerAddDepotItems(getPlayer, t[2], t[3])
else
for i = 1, t[3] do
doPlayerAddDepotItems(getPlayer, t[2], 1)
end
end
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Você adicionou "..t[3].." "..getItemNameById(t[2]).." ao depot do jogador "..t[1])
return true
end