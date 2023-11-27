local words_ = {'tk', 'world', 'us', 'online', 'eu', 'ml', 'org', 'no-ip', 'net', 'com', 'pl', 'biz', 'servegame', 'br', 'sytes', 'info', 'mine', 'nu', 'c0m', 'n3t', '0rg', 'c.o.m', 'c,o,m'}
local symbols = {'.', ',', ';', '-'}

function onSay(cid, words, param, channel)
	if getPlayerAccess(cid) < 3 then
		if getPlayerStorageValue(cid, STORAGEVALUE_HIMSELF) <= os.time() then
			playerTalkToHimself(cid, false)
			setPlayerStorageValue(cid, STORAGEVALUE_HIMSELF, -1)
		
			local advertsing = false
			for _, w in ipairs(words_) do
				for _, s in ipairs(symbols) do
		        	if(words:lower():gsub(' ', ''):find(s .. w, 1, true)) then
		            	advertsing = true
		            	break
		        	end
		    	end
			end

	        if not advertsing then
	        	local ip = words:match("%d+%.%d+%.%d+%.%d+")
	        	if ip then
	        		advertsing = true
	        	end
	        end

		    if advertsing then
		    	playerTalkToHimself(cid, true)
		    	setPlayerStorageValue(cid, STORAGEVALUE_HIMSELF, os.time() + 1)
		    end
		end
	end
end
