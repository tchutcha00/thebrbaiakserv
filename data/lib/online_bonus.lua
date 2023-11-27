OB_STATUS_OFFLINE = 0
OB_STATUS_RUNNING = 1
OB_STATUS_WAITING = 2
OB_STATUS_FINISHED = 3

local config = {
	days = {
		[0] = {start = '00:00', ends = '23:59'},
		[1] = {start = '00:00', ends = '23:59'},
		[2] = {start = '00:00', ends = '23:59'},
		[3] = {start = '00:00', ends = '23:59'},
		[4] = {start = '00:00', ends = '23:59'},
		[5] = {start = '00:00', ends = '23:59'},
		[6] = {start = '00:00', ends = '23:59'}
	},
	
	tokenId = 10558,
	tokenCount = 1,
	tokenDayLimit = 24,
	needSeconds = 3600
}

config.tokenName = ('%dx %s'):format(config.tokenCount, getItemInfo(config.tokenId).name)

if not onlineBonusCache then
	onlineBonusCache = 
	{	
		status = OB_STATUS_OFFLINE,
		initalizing = true,
		playerData = {}
	}
end

local onlineBonus = {}; onlineBonus.__index = onlineBonus
function OnlineBonus(cid)
	local name = getPlayerName(cid)
	local data = onlineBonusCache.playerData[name]
	if data then
		return data
	end

	local obj = {seconds = 0, tokens = 0, running = false, name = name}
	setmetatable(obj, onlineBonus)
	onlineBonusCache.playerData[name] = obj
	return obj
end

function onlineBonus:checkStatus()
	if not self.running or onlineBonusCache.status ~= OB_STATUS_RUNNING then
		return
	end
	
	self.seconds = self.seconds + 1
	if self.seconds >= config.needSeconds then
		self:sendToken()
	end
end

function onlineBonus:sendToken()
	local cid = getCreatureByName(self.name)
	if not cid then
		self:stop()
		return
	end
	
	doPlayerAddItem(cid, config.tokenId, config.tokenCount)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, ('Você recebeu %s por permanecer online.'):format(config.tokenName))
	doSendMagicEffect(getThingPos(cid), CONST_ME_GIFT_WRAPS)

	self.seconds = 0
	self.tokens = self.tokens + config.tokenCount
	if self.tokens >= config.tokenDayLimit then
		self:stop()
	end
end

function onlineBonus:start()
	if self.tokens >= config.tokenDayLimit then
		self:stop()
		return
	end

	local cid = getCreatureByName(self.name)
	if cid then
		self.running = true
		registerCreatureEvent(cid, 'OnlineBonus')
	end
end

function onlineBonus:stop()
	self.running = false
	local cid = getCreatureByName(self.name)
	if cid then
		unregisterCreatureEvent(cid, 'OnlineBonus')
	end
end

function onlineBonus:showInfo()
	local day = config.days[tonumber(os.date('%w'))]
	local cid = getCreatureByName(self.name)
	if not day or not cid then
		return false
	end

	local str = 'Online Bonus Informações:\n'
	str = str .. '\nTokens ganhos hoje: [' .. self.tokens .. '/' .. config.tokenDayLimit .. ']'
	
	local status = onlineBonusCache.status
	if self.running and status == OB_STATUS_RUNNING then
		str = str .. '\nPróximo recebimento em: ' .. string.diff(config.needSeconds - self.seconds, true)
	end
	
	str = str .. '\nSituação: '
	if status == OB_STATUS_WAITING then
		str = str .. 'Começará a receber às ' .. day.start
	elseif status == OB_STATUS_RUNNING and self.running then
		str = str .. 'Recebendo até ' .. day.ends
	elseif status == OB_STATUS_FINISHED or not self.running then
		str = str .. 'Você não está mais recebendo por hoje'
	end

	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str)
end

function onlineBonusCache.run(self)
	if config.days[tonumber(os.date('%w'))] then
		self.status = OB_STATUS_WAITING
	end
end

function onlineBonusCache.updateStatus(self)
	local day = config.days[tonumber(os.date('%w'))]
	if day then
		local now = hourToNumber(os.date('%X'):sub(1, 5))
		if now < hourToNumber(day.start) then
			self.status = OB_STATUS_WAITING
		elseif now >= hourToNumber(day.ends) then
			if self.status ~= OB_STATUS_FINISHED then
				for name, data in pairs(self.playerData) do
					data:stop()
				end
			end
			self.status = OB_STATUS_FINISHED
		else
			if self.status ~= OB_STATUS_RUNNING then
				for name, data in pairs(self.playerData) do
					local cid = getCreatureByName(self.name)
					if cid then
						doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Bonificação de fidelidade iniciado, você receberá ' .. config.tokenName .. ' a cada ' .. string.diff(config.needSeconds, true) .. ' logado. Para mais informações, utilize !onlinebonus.')
					end
				end
				self.status = OB_STATUS_RUNNING
			end
		end
	end
	self.initalizing = false
end

function hourToNumber(string)
    local hour = (tonumber(string:sub(1,2))*3600) + (tonumber(string:sub(4,5)) * 60)
    if #string > 5 then
        hour = hour + tonumber(string:sub(7,8))
    end
    return hour
end