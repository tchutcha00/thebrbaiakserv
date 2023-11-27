local nme = "Cave Owners"

local storages = {722340,722341,722342,722343,722344,722345,722346,722347,722348,722349,722363,722364,722365,722366,722367,722368,722369,722370,722371,722372}

function onSay(cid, words, param)
	local msg = ""
	for a,b in pairs(storages) do
		sto = getGlobalTableStorage(b)
		if sto.guid and sto.time then
			local tempo = tonumber(sto.time) - os.time()
			if tempo > 0 then
				msg = msg.."[Cave "..a.."] "..gTm(cid,nme,1)..": "..sto.guid.." "..gTm(cid,nme,2).." ".. timeString((tonumber(sto.time) - os.time()), getCreatureStorage(cid,language) == "end" and true or false) .."\n"
			else
			    msg = msg.."[Cave "..a.."] "..gTm(cid,nme,3)..": "..sto.guid.."\n"
			end
		else
			msg = msg.."[Cave "..a.."] "..gTm(cid,nme,4).."\n"
		end
	end
	doShowTextDialog(cid,8981,msg)
	return true
end
