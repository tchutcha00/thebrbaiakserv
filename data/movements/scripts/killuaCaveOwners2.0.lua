local cfg = {
	
	[12300] = {722340, {x = 2299, y = 2364, z = 7}},
	[12301] = {722341, {x = 2286, y = 2372, z = 7}},
	[12302] = {722342, {x = 2273, y = 2372, z = 7}},
	[12303] = {722343, {x = 2260, y = 2372, z = 7}},
	[12304] = {722344, {x = 2247, y = 2372, z = 7}},
	[12305] = {722345, {x = 2234, y = 2364, z = 7}},
	[12306] = {722346, {x = 2247, y = 2355, z = 7}},
	[12307] = {722347, {x = 2260, y = 2355, z = 7}},
	[12308] = {722348, {x = 2273, y = 2355, z = 7}},
	[12309] = {722349, {x = 2286, y = 2355, z = 7}},
	[12310] = {722363, {x = 2299, y = 2364, z = 6}},
	[12311] = {722364, {x = 2286, y = 2372, z = 6}},
	[12312] = {722365, {x = 2273, y = 2372, z = 6}},
	[12313] = {722366, {x = 2260, y = 2372, z = 6}},
	[12314] = {722367, {x = 2247, y = 2372, z = 6}},
	[12315] = {722368, {x = 2234, y = 2364, z = 6}},
	[12316] = {722369, {x = 2247, y = 2355, z = 6}},
	[12317] = {722370, {x = 2260, y = 2355, z = 6}},
	[12318] = {722371, {x = 2273, y = 2355, z = 6}},
	[12319] = {722372, {x = 2286, y = 2355, z = 6}},

}


function onStepIn(cid, item, position, fromPosition)
	local aid = item.actionid
	if cfg[aid] then
		if getGlobalTableStorage(cfg[aid][1]).guid == getCreatureName(cid) then
			if getGlobalTableStorage(cfg[aid][1]).time >= os.time() then
				doTeleportThing(cid,cfg[aid][2])
				doPlayerSendTextMessage(cid,25,"Bem vindo à sua cave exclusiva!")
				doSendMagicEffect(cfg[aid][2],CONST_ME_TELEPORT)
			else
				doPlayerSendCancel(cid,"Essa cave já não é mais sua.")
				doTeleportThing(cid,fromPosition)
				doSendMagicEffect(fromPosition,CONST_ME_POFF)
			end
		else
			doPlayerSendCancel(cid,"Essa cave não é sua.")
			doTeleportThing(cid,fromPosition)
			doSendMagicEffect(fromPosition,CONST_ME_POFF)
		end
	end
	return true
end
