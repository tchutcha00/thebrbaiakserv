if not protectedLevers then
	protectedLevers = {
		[17320] = {
			winPosition = {x = 16157, y = 17233, z = 7},
			items = {
				[12661] =	{rate = 0.01, rare = true},
				[10000] =	{rate = 0.02},
				[8978] =	{rate = 0.03},
				[2816] =	{rate = 0.05},
				[8300] =	{rate = 0.06},
				[2328] =	{rate = 0.06, count = 5},
				[6543] =	{rate = 0.08, count = 5},
				[6545] =	{rate = 0.09, count = 5},
				[7489] =	{rate = 0.09},
				[8305] =	{rate = 0.10},
				[12739] =	{rate = 0.12},
				[12372] =	{rate = 0.14, count = 15},
				[12601] =	{rate = 0.15, count = 15}
			}
		},
		[17321] = {
			winPosition = {x = 16157, y = 17245, z = 7},
			items = {
				[12748] =	{rate = 0.01, rare = true},
				[10000] =	{rate = 0.02},
				[8978] =	{rate = 0.03},
				[2816] =	{rate = 0.05},
				[8300] =	{rate = 0.06},
				[2328] =	{rate = 0.06, count = 5},
				[6543] =	{rate = 0.08, count = 5},
				[6545] =	{rate = 0.09, count = 5},
				[7489] =	{rate = 0.09},
				[8305] =	{rate = 0.10},
				[12739] =	{rate = 0.12},
				[12372] =	{rate = 0.14, count = 15},
				[12601] =	{rate = 0.15, count = 15}
			}
		},
		[17322] = {
			winPosition = {x = 16169, y = 17233, z = 7},
			items = {
				[12772] =	{rate = 0.01, rare = true},
				[10000] =	{rate = 0.02},
				[8978] =	{rate = 0.03},
				[2816] =	{rate = 0.05},
				[8300] =	{rate = 0.06},
				[2328] =	{rate = 0.06, count = 5},
				[6543] =	{rate = 0.08, count = 5},
				[6545] =	{rate = 0.09, count = 5},
				[7489] =	{rate = 0.09},
				[8305] =	{rate = 0.10},
				[12739] =	{rate = 0.12},
				[12372] =	{rate = 0.14, count = 15},
				[12601] =	{rate = 0.15, count = 15}
			}
		},
		[17323] = {
			winPosition = {x = 16169, y = 17245, z = 7},
			items = {
				[12751] =	{rate = 0.01, rare = true},
				[10000] =	{rate = 0.02},
				[8978] =	{rate = 0.03},
				[2816] =	{rate = 0.05},
				[8300] =	{rate = 0.06},
				[2328] =	{rate = 0.06, count = 5},
				[6543] =	{rate = 0.08, count = 5},
				[6545] =	{rate = 0.09, count = 5},
				[7489] =	{rate = 0.09},
				[8305] =	{rate = 0.10},
				[12739] =	{rate = 0.12},
				[12372] =	{rate = 0.14, count = 15},
				[12601] =	{rate = 0.15, count = 15}
			}
		},
		[17324] = {
			winPosition = {x = 16181, y = 17233, z = 7},
			items = {
				[12749] =	{rate = 0.01, rare = true},
				[10000] =	{rate = 0.02},
				[8978] =	{rate = 0.03},
				[2816] =	{rate = 0.05},
				[8300] =	{rate = 0.06},
				[2328] =	{rate = 0.06, count = 5},
				[6543] =	{rate = 0.08, count = 5},
				[6545] =	{rate = 0.09, count = 5},
				[7489] =	{rate = 0.09},
				[8305] =	{rate = 0.10},
				[12739] =	{rate = 0.12},
				[12372] =	{rate = 0.14, count = 15},
				[12601] =	{rate = 0.15, count = 15}
			}
		},
		[17325] = {
			winPosition = {x = 16181, y = 17245, z = 7},
			items = {
				[3973] =	{rate = 0.01, rare = true},
				[12607] =	{rate = 0.01, rare = true},
				[10000] =	{rate = 0.03},
				[8300] =	{rate = 0.06},
				[2328] =	{rate = 0.08, count = 5},
				[6543] =	{rate = 0.09},
				[6545] =	{rate = 0.09, count = 5},
				[8305] =	{rate = 0.10, count = 5},
				[7489] =	{rate = 0.12},
				[12739] =	{rate = 0.12},
				[12372] =	{rate = 0.14, count = 15},
				[12601] =	{rate = 0.15, count = 15}
			}
		},
		[17326] = {
			winPosition = {x = 172, y = 1924, z = 7},
			customKey = 2090,
			discardLog = true,
			items = {
				[12661] =	{rate = 0.02, period = 86400, rare = true},
				[12748] =	{rate = 0.02, period = 86400, rare = true},
				[12772] =	{rate = 0.02, period = 86400, rare = true},
				[12751] =	{rate = 0.02, period = 86400, rare = true},
				[12599] =	{rate = 0.05},
				[8300] =	{rate = 0.06},
				[2328] =	{rate = 0.06, count = 5},
				[6545] =	{rate = 0.08, count = 5},
				[6543] =	{rate = 0.09},
				[8305] =	{rate = 0.10, count = 5},
				[12739] =	{rate = 0.10},
				[7489] =	{rate = 0.11},
				[12372] =	{rate = 0.12, count = 15},
				[12601] =	{rate = 0.15, count = 15}
			}
		}
	}
end

function onUse(cid, item)
	local obj = protectedLevers[item.actionid]
	if not obj then
		return true
	end

	if getGameState() == GAMESTATE_STARTUP then
		doPlayerSendCancel(cid, 'Legendary levers have been disabled for serversave.')
		return true
	end

	return legendLever:random(cid, obj, item)
end
