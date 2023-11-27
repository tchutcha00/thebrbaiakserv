local cfg = {
bless = {1, 2, 3, 4, 5}
}

function onLogin(cid)
	for i = 1, #cfg.bless do
	if getPlayerStorageValue(cid, 89210) == 1 then
		doPlayerAddBlessing(cid, i)
		end
	end	
return true
end
