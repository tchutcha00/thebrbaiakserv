local days = {"Monday","Thursday","Tuesday","Wednesday","Friday","Saturday","Sunday"}

function prepareShutdown(minutes) 
	if(minutes <= 0) then
		doSaveServer()
		doShutdown()
		return false
	end
 
    if(minutes == 1) then
        doBroadcastMessage("Server is going down in " .. minutes .. " minute for global save, please log out now!")
        doSaveServer()
    elseif(minutes <= 3) then
        doBroadcastMessage("Server is going down in " .. minutes .. " minutes for global save, please log out.")
    else
        doBroadcastMessage("Server is going down in " .. minutes .. " minutes for global save.")
    end
 
    addEvent(prepareShutdown, 60000, minutes - 1)
    return true
end
 
 
function onTime()
	   prepareShutdown(5)
	return true
end
