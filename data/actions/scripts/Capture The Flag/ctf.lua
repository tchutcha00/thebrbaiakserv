local e = require('data/funevents/ctf/lib')

if e then
	function onUse(player, item)
		if e:playerState(player) ~= 1 then
			return true
		end

		return e:captureFlag(player, item)
	end

end
