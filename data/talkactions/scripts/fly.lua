local nme = "fly"

local config = {
	pz = true
}

function onSay(cid, words, param)

	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

	if isInArea(getThingPos(cid),{x = 188, y = 13104, z = 7},{x = 203, y = 13119, z = 7}) then
		doPlayerSendCancel(cid,"Você não pode usar fly em eventos.")
		return true
	end

	if isInArea(getThingPos(cid),{x = 675, y = 141, z = 7},{x = 690, y = 156, z = 7}) then
		doPlayerSendCancel(cid,"Você não pode usar fly em eventos.")
		return true
	end

	if isInArea(getThingPos(cid),{x = 2374, y = 1099, z = 7},{x = 2389, y = 1114, z = 7}) then
		doPlayerSendCancel(cid,"Você não pode usar fly em eventos.")
		return true
	end

	if isInArea(getThingPos(cid),{x = 1088, y = 1849, z = 7},{x = 1100, y = 1857, z = 7}) then
		doPlayerSendCancel(cid,"Você não pode usar fly em eventos.")
		return true
	end
	
  if isInArea(getThingPos(cid),{x = 967, y = 93, z = 14},{x = 979, y = 105, z = 14}) then
		doPlayerSendCancel(cid,"Você não pode usar fly em eventos.")
		return true
	end

	local lugar = {
		["depot"] = {
		pos = {x = 84, y = 77, z = 7},level = 8,price = 0},
		["templo"] = { 
		pos = getTownTemplePosition(getPlayerTown(cid)),level = 8, price = 0},
		["evento"] ={ 
		pos = {x = 128, y = 74, z = 7},level = 8,price = 0},
		["hunts"] ={
		pos = {x = 1846, y = 897, z = 15},level = 8,price = 0},
		["house"] = 0
	}

	if not getTilePzInfo(getThingPos(cid)) then
		return doPlayerSendCancel(cid,gTm(cid,nme,4))
	end

	local a = lugar[param]
	if not a then
		local str = ""
		str = str .. "!fly :\n\n"
		for name, pos in pairs(lugar) do
			str = str..name.."\n"
		end
		str = str .. ""
		doShowTextDialog(cid, 6579, str)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return true
	end

	if param == "house" then
		local hse = getHouseByPlayerGUID(getPlayerGUID(cid))
		if hse then
			local infos = getHouseInfo(hse)
			if infos and infos.entry then
				if infos.entry.x >= 8091 and infos.entry.x <= 8331 and infos.entry.y >= 3718 and infos.entry.y <= 3850 then
					if not isPremium(cid) then
						doPlayerSendCancel(cid,gTm(cid,nme,7))
						return true
					end
				end
				doTeleportThing(cid, infos.entry)
				doPlayerSendTextMessage(cid,25,gTm(cid,nme,8))
				doSendMagicEffect(infos.entry, CONST_ME_TELEPORT)
			end
		else
			doPlayerSendCancel(cid,gTm(cid,nme,9))
		end
	else
		doTeleportThing(cid, a.pos)
		doSendMagicEffect(a.pos, CONST_ME_TELEPORT)
	end

	return true
end