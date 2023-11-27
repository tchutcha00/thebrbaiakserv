local EventsListalist = {
	    
		
		{time = "08:00", name = "Bomberman Event"},
		{time = "09:00", name = "Desert War"},
		{time = "10:00", name = "Snowball War"},
		{time = "11:00", name = "Capture The Flag"},
	    {time = "12:00", name = "Battlefield Event"},
	    {time = "13:00", name = "Zombie Event"},
		{time = "14:00", name = "Desert War"},
		{time = "15:00", name = "Snowball War"},
	    {time = "16:00", name = "Battlefield Event"},
	    {time = "17:00", name = "Capture The Flag"},
	    {time = "18:00", name = "Zombie Event"},
	    {time = "19:00", name = "Real Castle"},
		{time = "21:00", name = "Capture The Flag"},
	    {time = "22:00", name = "Battlefield Event"},
	    {time = "22:30", name = "Bomberman Event"},
	    {time = "23:00", name = "Zombie Event"},
	    {time = "00:00", name = "Capture The Flag"},
	    {time = "01:00", name = "Snowball War"},
	    {time = "02:00", name = "Desert War"},
	    {time = "03:00", name = "Bomberman Event"}
	}
	
	local position = {x = 129, y = 74, z = 7}
	
	
	function onThink(interval, lastExecution)
		
	 local people = getPlayersOnline()
    if #people == 0 then
        return true
    end
	
	local Count = 0
	  for _, t in ipairs(EventsListalist) do
	        local eventTime = hourToNumber(t.time)
	        local realTime = hourToNumber(os.date("%H:%M:%S"))
	        if eventTime >= realTime then
	       doPlayerSay(people[1], "Proximo evento as {"..t.time.."h} "..t.name..", faltam "..timeString(eventTime - realTime)..".", TALKTYPE_MONSTER_SAY, false, 0, position)
	            return true
	        end
	        Count = Count + 1
	    end
		return true
	end