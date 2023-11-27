function onLogin(cid)
	local max,on,count = 10,getPlayersOnline(),0
	if #on > 0 then
		for i = 1, #on do
			if getCreatureName(on[i]) == "Account Manager" then count = count + 1 end
		end
	end
	if count > max then return false end
	return true
end
