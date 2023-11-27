function onAdvance(cid, skill, oldLevel, newLevel)

  local config = {
    [2000] = {item = 6542, count = 3},
    [3000] = {item = 6543, count = 2},
    [4000] = {item = 6544, count = 2},
    [10000] = {item = 6545, count = 1},
    [15000] = {item = 2328, count = 1},
    [20000] = {item = 6541, count = 1},
	[30000] = {item = 12599, count = 1},
	[60000] = {item = 8300, count = 1},
  }

  if skill == 8 then
    for level, info in pairs(config) do
      if newLevel >= level and (getPlayerStorageValue(cid, 30700) == -1 or not (string.find(getPlayerStorageValue(cid, 30700), "'" .. level .. "'"))) then
        doPlayerAddItem(cid, info.item, info.count)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_LIGHT_BLUE, "Parabéns, você atingiu o level {"..newLevel.."} e ganhou {"..info.count.." "..getItemNameById(info.item).."}.")
        doSendMagicEffect(getThingPos(cid), 29)
        local sat = getPlayerStorageValue(cid, 30700) == -1 and "Values: '" .. level .. "'" or getPlayerStorageValue(cid, 30700) .. ",'" .. level .. "'"
        setPlayerStorageValue(cid, 30700, sat)
      end
    end
  end
  return true
end