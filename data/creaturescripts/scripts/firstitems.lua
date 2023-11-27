local commonItems = {
	-- ITEMS ALL VOCS RECEIVE
	{itemid=2160, count=100}, 
	{itemid=2675, count=100}, 
	{itemid=9693, count=1}, 
	{itemid=7489, count=1}, 
}

local firstItems = {
	{ -- SORC ITEMS
		{itemid=2173, count=1}, 
		{itemid=2542, count=1}, 
		{itemid=2182, count=1}, 
		{itemid=12655, count=1}, 
		{itemid=7901, count=1}, 
		{itemid=7898, count=1}, 
		{itemid=7895, count=1}, 
		{itemid=7893, count=1}, 
		{itemid=2276, count=1},

	},
	{ -- DRUID ITEMS
		{itemid=2173, count=1}, 
		{itemid=2542, count=1}, 
		{itemid=12655, count=1}, 
		{itemid=2124, count=1}, 
		{itemid=7901, count=1},
		{itemid=7898, count=1}, 
		{itemid=7895, count=1}, 
		{itemid=7893, count=1}, 
		{itemid=2276, count=1},

	},
	{ -- PALADIN ITEMS
		{itemid=2173, count=1}, 
		{itemid=2522, count=1}, 
		{itemid=12621, count=1},
		{itemid=2124, count=1}, 
		{itemid=2506, count=1},
		{itemid=2492, count=1}, 	
		{itemid=2469, count=1}, 
		{itemid=2645, count=1}, 
		{itemid=2276, count=1},

	},
	{ -- KNIGHT ITEMS
		{itemid=2173, count=1}, 
		{itemid=2522, count=1},
		{itemid=12663, count=1}, 
		{itemid=2124, count=1},
		{itemid=2506, count=1},
		{itemid=2492, count=1}, 
		{itemid=2469, count=1}, 
		{itemid=2645, count=1}, 
		{itemid=7620, count=1},
		
	}
}

for _, items in ipairs(firstItems) do
	for _, item in ipairs(commonItems) do
		table.insert(items, item)
	end
end

function onLogin(cid)
	if getPlayerGroupId(cid) < 2 then
		local hasReceivedFirstItems = getPlayerStorageValue(cid, 67708)

		if hasReceivedFirstItems == -1 then
			doPlayerAddItem(cid, 10521, 1)

			local giveItems = firstItems[getPlayerVocation(cid)] or firstItems[getPlayerVocation(cid) - 4]

			if giveItems ~= nil then
				for _, v in ipairs(giveItems) do
					doPlayerAddItem(cid, v.itemid, v.count or 1)
				end

				doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Bem-vindo ao KING-BAIAK! Você acaba de receber seus primeiros equipamentos!")
				setPlayerStorageValue(cid, 67708, 1)  
				setPlayerStorageValue(cid, 101011, 7)
				setPlayerStorageValue(cid, STORAGEVALUE_WARSQUARE_STATUS, 1)
			end
		end
	end
	return true
end
