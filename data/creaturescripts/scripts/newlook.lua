function getPlayerFrags(cid)
	local time = os.time()
	local times = {today = (time - 86400), week = (time - (7 * 86400))}
	local contents, result = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. getPlayerGUID(cid) .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (time - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
	if(result:getID() ~= -1) then
		repeat
			local content = {date = result:getDataInt("date")}
			if(content.date > times.today) then
				table.insert(contents.day, content)
			elseif(content.date > times.week) then
				table.insert(contents.week, content)
			else
				table.insert(contents.month, content)
			end
		until not result:next()
		result:free()
	end
	local size = {
		day = table.maxn(contents.day),
		week = table.maxn(contents.week),
		month = table.maxn(contents.month)
	}
	return size.day + size.week + size.month
end

function getDeathsAndKills(cid, type) -- by vodka
	local query,d = db.getResult("SELECT `player_id` FROM "..(tostring(type) == "kill" and "`player_killers`" or "`player_deaths`").." WHERE `player_id` = "..getPlayerGUID(cid)),0
	if (query:getID() ~= -1) then
		repeat
			d = d+1
		until not query:next()
		query:free()
	end
	return 
end

function GetPatenteLook(cid)
	local ranks, kills = {
		[{0, 9}] = "Iniciante", 
		[{10, 49}] = "Ganguests",
		[{50, 99}] = "Assassino",
		[{100, 149}] = "Dead",
		[{150, 199}] = "Sanguinario",		
		[{200, math.huge}] = "Killer"
	},getDeathsAndKills(cid, "kill")
	for v , r in pairs(ranks) do
		if kills >= v[1] and kills <= v[2] then
			return r
		end
	end
end

local dodge, critic = 92798645,42904

function onLogin(cid)
	registerCreatureEvent(cid, "newlook")
	return true
end

function onLook(cid, thing, position, lookDistance)
	if isPlayer(thing.uid) and thing.uid ~= cid then
		doPlayerSetSpecialDescription(thing.uid,"\n[Reset: "..getPlayerResets(thing.uid).."] [Critical: "..getPlayerStorageValue(thing.uid, critic).."] [Dodge: "..getPlayerStorageValue(thing.uid, dodge).."]\n"..(getPlayerSex(thing.uid) == 0 and "Ela" or "Ele").." Matou ["..getDeathsAndKills(thing.uid, "kill").."]Players.\n"..(getPlayerSex(thing.uid) == 0 and "Ela" or "Ele").." Morreu ["..getDeathsAndKills(thing.uid, "death").."] Vezes...\nSua Patente é "..GetPatenteLook(thing.uid)..".")
		return true
	elseif thing.uid == cid then
		doPlayerSetSpecialDescription(cid,"\n[Reset: "..getPlayerResets(cid).."] [Critical: "..getPlayerStorageValue(cid, critic).."] [Dodge: "..getPlayerStorageValue(cid, dodge).."]\nVoce Matou ["..getDeathsAndKills(cid, "kill").."]Players.\nVoce Morreu ["..getDeathsAndKills(cid, "death").."] Vezes...\nSua Patente é "..GetPatenteLook(cid)..".")
		local string = 'You see yourself.'
		if getPlayerFlagValue(cid, PLAYERFLAG_SHOWGROUPINSTEADOFVOCATION) then
			string = string..' You are '.. getPlayerGroupName(cid) ..'.'
		elseif getPlayerVocation(cid) ~= 0 then
			string = string..' You are '.. getPlayerVocationName(cid) ..'.'
		else
			string = string..' You have no vocation.'
		end
		string = string..getPlayerSpecialDescription(cid)..'\n'
		
		if getPlayerGuildId(cid) > 0 then
			string = string..' You are ' .. (getPlayerGuildRank(cid) == '' and 'a member' or getPlayerGuildRank(cid)) ..' of the '.. getPlayerGuildName(cid)
			string = getPlayerGuildNick(cid) ~= '' and string..' ('.. getPlayerGuildNick(cid) ..').' or string..'.'
		end
		
		if getPlayerFlagValue(cid, PLAYERCUSTOMFLAG_CANSEECREATUREDETAILS) then
			string = string..'\nHealth: ['.. getCreatureHealth(cid) ..' / '.. getCreatureMaxHealth(cid) ..'], Mana: ['.. getCreatureMana(cid) ..' / '.. getCreatureMaxMana(cid) ..'].'
			string = string..'\nIP: '.. doConvertIntegerToIp(getPlayerIp(cid)) ..'.'
		end
		
		if getPlayerFlagValue(cid, PLAYERCUSTOMFLAG_CANSEEPOSITION) then
			string = string..'\nPosition: [X:'.. position.x..'] [Y:'.. position.y..'] [Z:'.. position.z..'].'
		end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, string) 
		return false
	end
	return true
end