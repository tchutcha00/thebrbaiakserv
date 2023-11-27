local e = require('data/funevents/ctf/lib')

if e then
	function onThink()
		local day = e.days[tonumber(os.date('%w'))]

		if day then
			if isInArray(day, tostring(os.date('%X')):sub(1, 5)) then
				e:open()
			end
		end

		return true
	end

end
