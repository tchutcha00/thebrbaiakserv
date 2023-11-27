function onUse(cid, item, fromPosition, itemEx, toPosition)


if item.itemid ==  7533 then		

			local storage_golden = 77531	--storage golden outfit
			if getPlayerStorageValue(cid, storage_golden) < 1 then
					doPlayerAddOutfitId(cid, 25 ,3)
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a golden outfit!.")
					doPlayerSetStorageValue(cid, storage_golden, 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this outfit.")
			end
			return true
		
elseif item.itemid == 12774 then		

			local montaria = 2	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true
	
	
elseif item.itemid == 12775 then
	
			local montaria = 3	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true


elseif item.itemid == 12776 then
	
			local montaria = 4	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true


elseif item.itemid == 12777 then
	
			local montaria = 5	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true


elseif item.itemid == 12778 then
	
			local montaria = 6	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true

elseif item.itemid == 12779 then
	
			local montaria = 7	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true

elseif item.itemid == 7528 then
	
			local montaria = 8	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true
	
elseif item.itemid == 7529 then
	
			local montaria = 9	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true	

elseif item.itemid == 7530 then
	
			local montaria = 10	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true

elseif item.itemid == 7531 then
	
			local montaria = 11	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true

elseif item.itemid == 7532 then
	
			local montaria = 12	--(É o valor correspondente à montaria na coluna da tabela "mounts" em: data/lib/lib_mounts.lua)
			if getPlayerStorageValue(cid, (act_mounts+montaria)) < 1 then
					for mar,cos in pairs(mounts) do
						setPlayerStorageValue(cid, cos[montaria] + 10000,1)
					end
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a mount "..mount_name[montaria]..".")
					doPlayerSetStorageValue(cid, (act_mounts+montaria), 1)
					doRemoveItem(item.uid,1)
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have this mount.")
			end
			return true
		end

return true
end