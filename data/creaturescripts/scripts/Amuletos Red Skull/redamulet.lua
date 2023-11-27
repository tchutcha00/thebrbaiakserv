local amuletos = {
	["donate"] = 7888, 
	["donate2"] = 8266, 
	["donate3"] = 11387,
	["red"] = 10133
}

local function checkSlot(id)
	for i, v in pairs(amuletos) do 
		if (v == id) then
			return true 
		end 
	end
	return false 
end 

function onDeath(cid, corpse, deathList)
	local amu = getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid
	if (amu) then 
		if ((checkSlot(amu)) and (getCreatureSkullType(cid) == SKULL_RED or getCreatureSkullType(cid) == SKULL_BLACK)) then
			doCreatureSetDropLoot(cid, false)
		end
	end 
	return true
end