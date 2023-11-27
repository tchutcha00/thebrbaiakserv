local max_allowed = 5 -- maximo de MCs permitidos

function onLogin(cid)
	local playerIp = getPlayerIp(cid)
	local playersOnline = getPlayersOnline()

	local mcCount = 0
	for i = 1, #playersOnline do
		if (getPlayerIp(playersOnline[i]) == playerIp) then
			mcCount = mcCount + 1
			if (mcCount == max_allowed) then
				return false
			end
		end
	end
	return true
end
