function onLogin(cid)
    registerCreatureEvent(cid, "fraglook")
    registerCreatureEvent(cid, "playerFrag")
    return true
end

local vocs = {

    [5] = "Real Sorcerer",
    [6] = "Real Druid",
    [7] = "Real Paladin",
    [8] = "Real Knight"

}

function getDeathsAndKills(cid, type) -- by vodka
	local query,d = db.getResult("SELECT `player_id` FROM "..(tostring(type) == "kill" and "`player_killers`" or "`player_deaths`").." WHERE `player_id` = "..getPlayerGUID(cid)),0
	if (query:getID() ~= -1) then
		repeat
			d = d+1
		until not query:next()
		query:free()
	end
	return d 
end

function GetPatenteLook(cid)
	local ranks, kills = {
		[{0, 9}] = "[Noob da Corte]", 
		[{10, 49}] = "[Visconde]",
		[{50, 99}] = "[Conde]",
		[{100, 149}] = "[Duque]",
		[{150, 199}] = "[Pr�ncipe]",		
		[{200, math.huge}] = "[Rei]"
	},getDeathsAndKills(cid, "kill")
	for v , r in pairs(ranks) do
		if kills >= v[1] and kills <= v[2] then
			return r
		end
	end
end
 
function onLook(cid, thing, position, lookDistance)
    if isPlayer(thing.uid) then
        if getPlayerAccess(cid) > 3 then return true end
        local artigo = getPlayerSex(thing.uid) == 0 and "Ela" or "Ele"
        local voc = getPlayerStorageValue(thing.uid,722380) > 0 and vocs[getPlayerStorageValue(thing.uid,722380)] or getPlayerVocationName(thing.uid)
        local str = ""
        local playerGuildId = getPlayerGuildId(thing.uid)
        if playerGuildId > 0 then
            local nick = getPlayerGuildNick(thing.uid) ~= "" and " ("..getPlayerGuildNick(thing.uid)..")." or "."
            if thing.uid ~= cid then
                str = " "..artigo.." � "..getPlayerGuildRank(thing.uid).." da guild "..getPlayerGuildName(thing.uid)..nick
            else
                str = " Voc� � "..getPlayerGuildRank(thing.uid).." da guild "..getPlayerGuildName(thing.uid)..nick
            end
            str = str .. " [N�vel da Guild: " .. GuildSystem:getLevel(playerGuildId) .. "]"
        end
        if thing.uid ~= cid then
            doPlayerSendTextMessage(cid,25,"Voc� v� "..getCreatureName(thing.uid).." [Resets: "..getPlayerResets(thing.uid).."] (Level "..getPlayerLevel(thing.uid).."). "..artigo.." � "..voc.."."..str.."\n"..artigo.." tem ["..math.max(0, getPlayerStorageValue(thing.uid, 92798645)).."/500] de Dodge e ["..math.max(0, getPlayerStorageValue(thing.uid, 42904)).."/500] de Critical.\nSeu t�tulo real � "..GetPatenteLook(thing.uid)..".")
        else
            doPlayerSendTextMessage(cid,25,"Voc� se v� [Resets: "..getPlayerResets(thing.uid).."]. Voc� � "..voc.."."..str.."\nVoc� tem ["..math.max(0, getPlayerStorageValue(thing.uid, 92798645)).."/500] de Dodge e ["..math.max(0, getPlayerStorageValue(thing.uid, 42904)).."/500] de Critical.\nSeu t�tulo real � "..GetPatenteLook(cid)..".")
        end
        return false
    end
    return true
end