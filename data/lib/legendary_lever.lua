MAX_DROPSET_RATE = 1000
LEGEND_SCENARIO_TILES = 11

if not legendLever then
	legendLever = {}
end

function loadLegendaryChances()
	for aid, lever in pairs(protectedLevers) do
		lever.chances = {}

		for id, content in pairs(lever.items) do
			local rate = content.rate * MAX_DROPSET_RATE
			for i = 1, rate do
				if i < MAX_DROPSET_RATE then
					lever.chances[#lever.chances + 1] = id
				end
			end
		end

		if #lever.chances ~= MAX_DROPSET_RATE then
			print(('>> Warning:LegendaryLever %d is not precise drop, result: %f.'):format(aid, #lever.chances/MAX_DROPSET_RATE))
		end
	end
end

function legendLever:random(cid, obj, item)
	if not rawequal(type(obj), 'table') then
		return error('table of items not found.')
	end

	if obj.busy then
		doPlayerSendCancel(cid, 'Aguarde o resultado final do jogador ' .. obj.ownerName .. '.')
		return true
	end

	local itemId = 8978
	if obj.customKey then
		itemId = obj.customKey
	end

	if not doPlayerRemoveItem(cid, itemId, 1) then
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'Você não possui 1x ' .. getItemInfo(itemId).name .. ' para tentar a sorte.')
		return true
	end

	local position = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
	for i = 1, LEGEND_SCENARIO_TILES do
		local dummy = getTopCreature(position).uid
		if dummy ~= 0 then
			doSendMagicEffect(position, CONST_ME_POFF)
			doRemoveCreature(dummy)
		end
		position.x = position.x + 1
	end

	obj.wonLegend = false
	obj.busy = true
	obj.ownerName = getPlayerName(cid)
	doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)

	if not obj.discardLog then
		local log = 'Player: ' .. obj.ownerName
		doWriteLogFile('data/logs/legend_drops_rolled.log', log)
	end
	
	doSendMagicEffect(obj.winPosition, 56)
	addEvent(function()
		doSendMagicEffect(obj.winPosition, 56)
	end, 4000)
	
	local addEventSpeed = 15.625
	local rollSpeed = 7100
	local fixPosition = {x = obj.winPosition.x + (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}

	local function randomize()
		local choice = obj.chances[math.random(MAX_DROPSET_RATE)]

		local formula = 1.075 + (addEventSpeed / 5000)
		addEventSpeed = addEventSpeed * formula
		if addEventSpeed > 400 then addEventSpeed = addEventSpeed / 1.02 end
		rollSpeed = rollSpeed / formula

		local position = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
		for i = 1, LEGEND_SCENARIO_TILES do
			local dummy = getTopCreature(position).uid
			if dummy ~= 0 then
				if position.x == obj.winPosition.x - math.floor(LEGEND_SCENARIO_TILES/2) then
					doRemoveCreature(dummy)
				else
					setCreatureSpeed(dummy, rollSpeed)
					doMoveCreature(dummy, WEST)
				end
			end
			position.x = position.x + 1
		end

		local dummy = doCreateMonster('legenddummy', fixPosition, false, true)
		if dummy then
			setCreatureSpeed(dummy, rollSpeed)
			doSetCreatureOutfit(dummy, {lookTypeEx = choice})
		end

		if addEventSpeed < 1000 then
			addEvent(randomize, addEventSpeed)
		else
			addEvent(function()
				local pos1 = {x = obj.winPosition.x + (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
				local pos2 = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
				doSendDistanceShoot(pos1, obj.winPosition, 37)
				doSendDistanceShoot(pos2, obj.winPosition, 37)
				doSendMagicEffect(obj.winPosition, 6)
			end, 1000)

			addEvent(function()
				local owner = getCreatureByName(obj.ownerName)
				local rewardId
				local position = obj.winPosition
					local dummy = getTopCreature(position).uid
					if dummy ~= 0 then
						rewardId = getCreatureOutfit(dummy).lookTypeEx
						local addItem
						if owner then
							addItem = doPlayerAddItem(owner, rewardId, obj.items[rewardId].count or 1)
							if addItem and obj.items[rewardId].period then
								doItemSetPeriod(addItem, obj.items[rewardId].period)
							end
							local rewardStr = (obj.items[rewardId].count or 1) .. 'x ' .. getItemInfo(rewardId).name
							doPlayerSendTextMessage(owner, MESSAGE_INFO_DESCR, 'Parabéns, você encontrou ' .. rewardStr .. '.')
							if not obj.discardLog then
								local log = 'Player: ' .. getCreatureName(owner) .. ' | Reward: ' .. rewardStr
								doWriteLogFile('data/logs/legend_drops_completed.log', log)
							end
						end
						local foundRare = obj.items[rewardId].rare
						if foundRare then
							if addItem and owner then
								doItemSetAttribute(addItem, 'description', ('Hyper item of player %s.'):format(getCreatureName(owner)))
							end
							local pos = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
							for i = 1, LEGEND_SCENARIO_TILES do
								local dummy = getTopCreature(pos).uid
								if dummy ~= 0 then
									doSetCreatureOutfit(dummy, { lookTypeEx = rewardId })
									doSendMagicEffect(getThingPos(dummy), 37)
									doSendMagicEffect(getThingPos(dummy), 56)
								end
								pos.x = pos.x + 1
							end
							if owner then
								local itemName = getItemInfo(rewardId).name
								doBroadcastMessage('[Soulwar Lever]: O jogador ' .. getCreatureName(owner) .. ' encontrou um ' .. itemName .. ', que incrível.', MESSAGE_EVENT_ADVANCE)
							end
							obj.wonLegend = true
							self:drawEffects(obj)
						else
							doSendMagicEffect(position, 36)
						end
					end

				obj.busy = false
			end, 1500)
		end
	end

	randomize()
	return true
end

function legendLever:drawEffects(obj)
	local n = 0
	local function decrease()
		if not obj.wonLegend then
			return
		end
		local time = 20 - n
		if time > 0 then
			n = n + 1
			local position = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
			for i = 1, LEGEND_SCENARIO_TILES do
				doSendMagicEffect(position, math.random(28, 31))
				position.x = position.x + 1
			end
			addEvent(decrease, 850)
		end
	end

	decrease()
end

-- function legendLever:templeAnimation()
-- 	local items = {12327, 10719, 8851, 8931, 8293, 2444, 2444}
-- 	local centerPosition = Position(1010, 993, 7)
-- 	local fixPosition = Position(1013, 993, 7)
-- 	local count = 1
-- 	local function randomize()
-- 		local choiced = items[count]
-- 		if not choiced then
-- 			count = 1
-- 			choiced = items[count]
-- 		end

-- 		count = count + 1
-- 		if count >= #items then
-- 			count = 1
-- 		end

-- 		local addEventSpeed = 805
-- 		local rollSpeed = 125

-- 		local position = Position(centerPosition.x - (math.floor(#items/2)), centerPosition.y, centerPosition.z)
-- 		for i = 1, #items do
-- 			local tile = Tile(position)
-- 			if tile then
-- 				local dummy = tile:getTopCreature()
-- 				if dummy then
-- 					if position.x == centerPosition.x - math.floor(#items/2) then
-- 						dummy:remove()
-- 					else
-- 						dummy:setSpeed(rollSpeed)
-- 						dummy:move(DIRECTION_WEST)
-- 					end
-- 				end
-- 				position.x = position.x + 1
-- 			end
-- 		end

-- 		local dummy = Game.createMonster('Legend Dummy', fixPosition, false, true)
-- 		if dummy then
-- 			dummy:setSpeed(rollSpeed)
-- 			dummy:setOutfit {lookTypeEx = choiced}
-- 		end

-- 		addEvent(randomize, addEventSpeed)
-- 	end
-- 	randomize()
-- end