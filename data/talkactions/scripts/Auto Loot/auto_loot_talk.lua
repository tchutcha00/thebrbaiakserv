local nme = "autoloot"

function ExistItemByName(name) -- by vodka
	local items = io.open("data/items/items.xml", "r"):read("*all")
	local get = items:match('name="' .. name ..'"')
	if get == nil or get == "" then
		return false
	end
	return true
end

local function getPlayerList(cid)
	local tab = {}
	if getPlayerStorageValue(cid, 04420021) ~= -1 then
		table.insert(tab, getPlayerStorageValue(cid, 04420021))
	end
	if getPlayerStorageValue(cid, 04420031) ~= -1 then
		table.insert(tab, getPlayerStorageValue(cid, 04420031))
	end
	if getPlayerStorageValue(cid, 04420041) ~= -1 then
		table.insert(tab, getPlayerStorageValue(cid, 04420041))
	end
	if getPlayerStorageValue(cid, 04420051) ~= -1 then
		table.insert(tab, getPlayerStorageValue(cid, 04420051))
	end
	if #tab > 0 then
		return tab
	end
	return false
end

local function addToList(cid, name)
	local itemid = getItemIdByName(name)
	if getPlayerList(cid) and isInArray(getPlayerList(cid), itemid) then
		return false
	end
	if getPlayerStorageValue(cid, 04420021) == -1 then
		return doPlayerSetStorageValue(cid, 04420021, itemid)
	elseif getPlayerStorageValue(cid, 04420031) == -1 then
		return doPlayerSetStorageValue(cid, 04420031, itemid)
	elseif getPlayerStorageValue(cid, 04420041) == -1 then	
		return doPlayerSetStorageValue(cid, 04420041, itemid)
	elseif getPlayerStorageValue(cid, 04420051) == -1 then
		return doPlayerSetStorageValue(cid, 04420051, itemid)
	end
end

local function removeFromList(cid, name)
	local itemid = getItemIdByName(name)
	if getPlayerStorageValue(cid, 04420021) == itemid then
		return doPlayerSetStorageValue(cid, 04420021, -1)
	elseif getPlayerStorageValue(cid, 04420031) == itemid then
		return doPlayerSetStorageValue(cid, 04420031, -1)
	elseif getPlayerStorageValue(cid, 04420041) == itemid then
		return doPlayerSetStorageValue(cid, 04420041, -1)
	elseif getPlayerStorageValue(cid, 04420051) == itemid then
		return doPlayerSetStorageValue(cid, 04420051, -1)
	end
	return false
end

function onSay(cid, words, param)
	if param == "" then
		local fi = getPlayerStorageValue(cid, 04420021) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 04420021)) or ""
		local se = getPlayerStorageValue(cid, 04420031) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 04420031)) or ""
		local th = getPlayerStorageValue(cid, 04420041) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 04420041)) or ""
		local fo = getPlayerStorageValue(cid, 04420051) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 04420051)) or ""
		local stt = getPlayerStorageValue(cid, 04421011) == 1 and gTm(cid,nme,2) or gTm(cid,nme,3)
		local str = getPlayerStorageValue(cid, 04421001) == 1 and gTm(cid,nme,2) or gTm(cid,nme,3)
		doPlayerPopupFYI(cid, gTm(cid,nme,4)..""..stt..gTm(cid,nme,5)..str..gTm(cid,nme,6)..fi.."\n{Auto-Loot} ---Slot 2: "..se.."\n{Auto-Loot} ---Slot 3: "..th.."\n{Auto-Loot} ---Slot 4: "..fo..gTm(cid,nme,7))
		return true
	end
	
	local t = string.explode(param, ",")
	
	if t[1] == "power" then
		local check = getPlayerStorageValue(cid, 04421001) == -1 and gTm(cid,nme,8) or gTm(cid,nme,9)
		doPlayerSetStorageValue(cid, 04421001, getPlayerStorageValue(cid, 04421001) == -1 and 1 or -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, gTm(cid,nme,10).." "..check.." "..gTm(cid,nme,11))
	elseif t[1] == "gold" then
		local check = getPlayerStorageValue(cid, 04421011) == -1 and gTm(cid,nme,8) or gTm(cid,nme,9)
		doPlayerSetStorageValue(cid, 04421011, getPlayerStorageValue(cid, 04421011) == -1 and 1 or -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, gTm(cid,nme,10).." "..check.." "..gTm(cid,nme,12))
		doPlayerSetStorageValue(cid, 04421021, 0)
	elseif t[1] == "goldinfo" then
		local str = getPlayerStorageValue(cid, 04421011) == -1 and gTm(cid,nme,13) or gTm(cid,nme,14).." "..getPlayerStorageZero(cid, 04421021).." gold coins"
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, str)
	elseif t[1] == "add" then
		if ExistItemByName(t[2]) then
			local item = getItemIdByName(t[2])
			if isInArray({2160, 2148, 2152}, item) then
				return doPlayerSendCancel(cid, gTm(cid,nme,15))
			end
				if getPlayerStorageValue(cid, 04420011) < 3 then
					if addToList(cid, t[2]) then
						doPlayerSetStorageValue(cid, 04420011, getPlayerStorageValue(cid, 04420011) + 1)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." "..gTm(cid,nme,16))
					else
						doPlayerSendCancel(cid, t[2].." "..gTm(cid,nme,17))
					end
				else
					doPlayerSendCancel(cid, gTm(cid,nme,18))
				end    
			else
				if getPlayerStorageValue(cid, 04420011) == -1 then
					if addToList(cid, t[2]) then
						doPlayerSetStorageValue(cid, 04420011, getPlayerStorageValue(cid, 04420011) + 1)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." "..gTm(cid,nme,19))
					else
						doPlayerSendCancel(cid, t[2].." "..gTm(cid,nme,20))
					end
				else
					doPlayerSendCancel(cid, gTm(cid,nme,21))
				end
			doPlayerSendCancel(cid, gTm(cid,nme,22))
		end    
	elseif t[1] == "remove" then
		if ExistItemByName(t[2]) then
			if removeFromList(cid, t[2]) then
				doPlayerSetStorageValue(cid, 04420011, getPlayerStorageValue(cid, 04420011) - 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." "..gTm(cid,nme,23))
			else
				doPlayerSendCancel(cid, gTm(cid,nme,24))
			end
		else
			doPlayerSendCancel(cid, gTm(cid,nme,22))
		end 
	elseif t[1] == "clear" then
		if getPlayerStorageValue(cid, 04420011) > -1 then
			doPlayerSetStorageValue(cid, 04420011, -1)
			doPlayerSetStorageValue(cid, 04420021, -1)
			doPlayerSetStorageValue(cid, 04420031, -1)
			doPlayerSetStorageValue(cid, 04420041, -1)
			doPlayerSetStorageValue(cid, 04420051, -1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, gTm(cid,nme,25))
		else
			doPlayerSendCancel(cid, gTm(cid,nme,26))
		end
	elseif t[1] == "desbug" or t[1] == "desbugar" then
		doPlayerSetStorageValue(cid, 04420011, -1)
		doPlayerSetStorageValue(cid, 04420021, -1)
		doPlayerSetStorageValue(cid, 04420031, -1)
		doPlayerSetStorageValue(cid, 04420041, -1)
		doPlayerSetStorageValue(cid, 04420051, -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, gTm(cid,nme,27))
	elseif t[1] == "list" then
		local fi = getPlayerStorageValue(cid, 04420021) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 04420021)).."\n" or ""
		local se = getPlayerStorageValue(cid, 04420031) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 04420031)).."\n" or ""
		local th = getPlayerStorageValue(cid, 04420041) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 04420041)).."\n" or ""
		local fo = getPlayerStorageValue(cid, 04420051) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 04420051)).."\n" or ""
		doPlayerPopupFYI(cid, gTm(cid,nme,28)..":\n "..fi..""..se..""..th..""..fo)
	end
	return true
end