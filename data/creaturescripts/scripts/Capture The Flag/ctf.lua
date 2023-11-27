local e = require('data/funevents/ctf/lib')

if e then
	function onCombat(cid, target)
		if e:eventState() == CTF_STATE_CLOSED then
			return true
		end

		if e:playerState(cid) == 1 then

			if isPlayer(cid) and isPlayer(target) then
				if e:eventState() ~= CTF_STATE_GAME or e:playerTeam(cid) == e:playerTeam(target) then
					return false
				end
			end
		end

		return true
	end

	function onPrepareDeath(cid)
		if not isPlayer(cid) then
			return true
		end

		return e:onDeath(cid)
	end

	function onLogin(cid)
		return e:onLeave(cid)
	end

	function onLogout(cid)
		if e:eventState() ~= CTF_STATE_CLOSED then

			if e:playerState(cid) == 1 then
				return false, doPlayerSendCancel(cid, 'You cannot logout here.')
			end
		end

		return true
	end
	
	function onThink(cid)
		if e:eventState() ~= CTF_STATE_CLOSED then
			if getPlayerIp(cid) == 0 then
				e:onLeave(cid)
			end
		end
		
		return true
	end
	
end
