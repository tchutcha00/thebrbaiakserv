function onSay(cid, words, param, channelId)
	if(not checkExhausted(cid, 666, 5)) then
		return true
	end
	
			local t, data = string.explode(param, " ", 1), getPlayerSpectators(cid)
			if(isInArray({'off', 'no', 'disable'}, t[1])) then
			if getPlayerStorageValue(cid, 45503) > 0 then
				data.mutes = {}
				data.broadcast = false
				doPlayerSetSpectators(cid, data)
				setPlayerStorageValue(cid, 45503, 0)

				db.executeQuery("UPDATE `players` SET `broadcasting` = 0, `viewers` = 0 WHERE `id` = " .. getPlayerGUID(cid))
				doPlayerSendTextMessage(cid, 25, "You have disabled your cast stream.")
				local rates = getPlayerRates(cid)
				if getPlayerStorageValue(cid, 45504) <= 0 then -- Check cast Password
					doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]-0.05)
				end
			else
				doPlayerSendTextMessage(cid, 25, "Your cast stream already disabled.")
				return true
			end
			elseif(isInArray({'on', 'yes', 'enable'}, t[1])) then
			if getPlayerStorageValue(cid, 45503) <= 0 then
				data.broadcast = true
				doPlayerSetSpectators(cid, data)
				doPlayerOpenPrivateChannel(cid)
				setPlayerStorageValue(cid, 45503, 1)

				db.executeQuery("UPDATE `players` SET `broadcasting` = 1 WHERE `id` = " .. getPlayerGUID(cid))
				local rates = getPlayerRates(cid)
				if getPlayerStorageValue(cid, 45504) <= 0 then -- Check cast Password
					doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]+0.05)
					doPlayerSendTextMessage(cid, 25, "You have enabled your cast stream and now receive +5% monsters experience.")
				else
					doPlayerSendTextMessage(cid, 25, "You have enabled your cast stream. Remove the password to gain +5% monsters experience.")
				end
			else
				doPlayerSendTextMessage(cid, 25, "Your cast stream already enabled.")
				return true
			end
			elseif(isInArray({'show', 'count', 'see'}, t[1])) then
				if(data.broadcast) then
					local count = table.maxn(data.names)
					if(count > 0) then
						doPlayerSendTextMessage(cid, 25, "You are currently watched by " .. count .. " people.")
						local str = ""
						for _, name in ipairs(data.names) do
							str = str .. (str:len() > 0 and ", " or "") .. name
						end

						doPlayerSendTextMessage(cid, 25, str .. ".")
					else
						doPlayerSendTextMessage(cid, 25, "None is watching your stream right now.")
					end
				else
					doPlayerSendTextMessage(cid, 25, "You are not streaming right now.")
				end
			elseif(isInArray({'kick', 'remove'}, t[1])) then
				if(data.broadcast) then
					if(t[2]) then
						if(t[2] ~= "all") then
							local found = false
							for _, name in ipairs(data.names) do
								if(t[2]:lower() == name:lower()) then
									found = true
									break
								end
							end

							if(found) then
								table.insert(data.kick, t[2])
								doPlayerSetSpectators(cid, data)
								doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " has been kicked.")
							else
								doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " not found.")
							end
						else
							data.kick = data.names
							doPlayerSetSpectators(cid, data)
						end
					else
						doPlayerSendTextMessage(cid, 25, "You need to type a name.")
					end
				else
					doPlayerSendTextMessage(cid, 25, "You are not streaming right now.")
				end
			elseif(isInArray({'ban', 'block'}, t[1])) then
				if(data.broadcast) then
					if(t[2]) then
						local found = false
						for _, name in ipairs(data.names) do
							if(t[2]:lower() == name:lower()) then
								found = true
								break
							end
						end

						if(found) then
							table.insert(data.bans, t[2])
							doPlayerSetSpectators(cid, data)
							doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " has been banned.")
						else
							doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " not found.")
						end
					else
						doPlayerSendTextMessage(cid, 25, "You need to type a name.")
					end
				else
					doPlayerSendTextMessage(cid, 25, "You are not streaming right now.")
				end
			elseif(isInArray({'unban', 'unblock'}, t[1])) then
				if(data.broadcast) then
					if(t[2]) then
						local found, i = 0, 1
						for _, name in ipairs(data.bans) do
							if(t[2]:lower() == name:lower()) then
								found = i
								break
							end

							i = i + 1
						end

						if(found > 0) then
							table.remove(data.bans, found)
							doPlayerSetSpectators(cid, data)
							doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " has been unbanned.")
						else
							doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " not found.")
						end
					else
						doPlayerSendTextMessage(cid, 25, "You need to type a name.")
					end
				else
					doPlayerSendTextMessage(cid, 25, "You are not streaming right now.")
				end
			elseif(isInArray({'bans', 'banlist'}, t[1])) then
				if(table.maxn(data.bans)) then
					local str = ""
					for _, name in ipairs(data.bans) do
						str = str .. (str:len() > 0 and ", " or "") .. name
					end

					doPlayerSendTextMessage(cid, 25, "Currently banned spectators: " .. str .. ".")
				else
					doPlayerSendTextMessage(cid, 25, "Your ban list is empty.")
				end
			elseif(isInArray({'mute', 'squelch'}, t[1])) then
				if(data.broadcast) then
					if(t[2]) then
						local found = false
						for _, name in ipairs(data.names) do
							if(t[2]:lower() == name:lower()) then
								found = true
								break
							end
						end

						if(found) then
							table.insert(data.mutes, t[2])
							doPlayerSetSpectators(cid, data)
							doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " has been muted.")
						else
							doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " not found.")
						end
					else
						doPlayerSendTextMessage(cid, 25, "You need to type a name.")
					end
				else
					doPlayerSendTextMessage(cid, 25, "You are not streaming right now.")
				end
			elseif(isInArray({'unmute', 'unsquelch'}, t[1])) then
				if(data.broadcast) then
					if(t[2]) then
						local found, i = 0, 1
						for _, name in ipairs(data.mutes) do
							if(t[2]:lower() == name:lower()) then
								found = i
								break
							end

							i = i + 1
						end

						if(found > 0) then
							table.remove(data.mutes, found)
							doPlayerSetSpectators(cid, data)
							doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " has been unmuted.")
						else
							doPlayerSendTextMessage(cid, 25, "Spectator " .. t[2] .. " not found.")
						end
					else
						doPlayerSendTextMessage(cid, 25, "You need to type a name.")
					end
				else
					doPlayerSendTextMessage(cid, 25, "You are not streaming right now.")
				end
			elseif(isInArray({'mutes', 'mutelist'}, t[1])) then
				if(table.maxn(data.mutes)) then
					local str = ""
					for _, name in ipairs(data.mutes) do
						str = str .. (str:len() > 0 and ", " or "") .. name
					end

					doPlayerSendTextMessage(cid, 25, "Currently muted spectators: " .. str .. ".")
				else
					doPlayerSendTextMessage(cid, 25, "Your mute list is empty.")
				end
			elseif(isInArray({'auth', 'protect', 'protection', 'protected'}, t[1])) then
				if(isInArray({'off', 'no', 'disable'}, t[2])) then
					data.auth = false
					doPlayerSetSpectators(cid, data)
					doPlayerSendTextMessage(cid, 25, "Your chat is now unprotected, all spectators can chat without authentication.")
				elseif(isInArray({'on', 'yes', 'enable'}, t[2])) then
					data.auth = true
					doPlayerSetSpectators(cid, data)
					doPlayerSendTextMessage(cid, 25, "Your chat is now protected, all spectators have to authenticate before they can talk.")
				else
					doPlayerSendTextMessage(cid, 25, "Your chat is currently " .. (data.auth and "protected" or "unprotected") .. " from guests.")
				end
			elseif(isInArray({'password', 'guard'}, t[1])) then
				if(t[2]) then
					if(isInArray({'off', 'no', 'disable'}, t[2])) then
						if(data.password:len() ~= 0) then
							db.executeQuery("UPDATE `players` SET `broadcasting` = `broadcasting` - 2 WHERE `id` = " .. getPlayerGUID(cid))
						end

						data.password = ""
						doPlayerSetSpectators(cid, data)
						local rates = getPlayerRates(cid)
						if getPlayerStorageValue(cid, 45503) > 0 and getPlayerStorageValue(cid, 45504) > 0 then -- Check Cast On and password
							doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]+0.05)
							doPlayerSendTextMessage(cid, 25, "You have removed password for your cast stream and getting +5% monsters experience.")
						else
							doPlayerSendTextMessage(cid, 25, "You have removed password for your cast stream.")
						end
						
						setPlayerStorageValue(cid, 45504, 0)
					else
						if(data.password:len() ~= 0) then
							db.executeQuery("UPDATE `players` SET `broadcasting` = `broadcasting` + 2 WHERE `id` = " .. getPlayerGUID(cid))
						end

						data.password = string.trim(t[2])
						doPlayerSetSpectators(cid, data)
						local rates = getPlayerRates(cid)
						if getPlayerStorageValue(cid, 45503) > 0 and getPlayerStorageValue(cid, 45504) <= 0 then -- Check Cast On and password off
							doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]-0.05)
							doPlayerSendTextMessage(cid, 25, "You have set new password for your stream. Remove the password to gain +5% monsters experience.")
						else
							doPlayerSendTextMessage(cid, 25, "You have set new password for your stream.")
						end
						
						setPlayerStorageValue(cid, 45504, 1)
					end
				elseif(data.password ~= "") then
					doPlayerSendTextMessage(cid, 25, "Your stream is currently protected with password: " .. data.password .. ".")
				else
					doPlayerSendTextMessage(cid, 25, "Your stream is currently not protected.")
				end
			elseif(isInArray({'status', 'info'}, t[1])) then
				doPlayerSendTextMessage(cid, 25, "Your stream is currently " .. (data.broadcast and "enabled" or "disabled") .. ".")
			else
				doPlayerPopupFYI(cid, "Available commands:\n\n/cast on - enables the stream\n/cast off - disables the stream\n/cast password {password} - sets a password on the stream\n/cast password off - disables the password protection\n/cast auth on - enables requirement of authentication on chat\n/cast auth off - disables requirement of authentication on chat\n/cast kick {name} - kick a spectator from your stream\n/cast ban {name} - locks spectator IP from joining your stream\n/cast unban {name} - removes banishment lock\n/cast bans - shows banished spectators list\n/cast mute {name} - mutes selected spectator from chat\n/cast unmute {name} - removes mute\n/cast mutes - shows muted spectators list\n/cast show - displays the amount and nicknames of current spectators\n/cast status - displays stream status")
			end

			return true
		end