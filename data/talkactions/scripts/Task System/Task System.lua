function onSay(cid, words, param)

	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

	local str = "Tasks atuais do King-Baiak:\n\n"
	for k, v in pairs(tasktabble.tasks) do
		local completed = getPlayerStorageValue(cid, v.storage_start)
		local contagem = getPlayerStorageValue(cid, v.storage)
		if completed == 0 then
			str = str .. "- " .. k .." [OK]\n"
		else
			str = str .. "- " .. k .. "\n"
		end
	end
	return doShowTextDialog(cid, 8983, str)
end