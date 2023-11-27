

local positions = {
	[1] = {x=113,y=95,z=7},
	[2] = {x=100,y=89,z=7},
	[3] = {x=83,y=76,z=7},
	[4] = {x=95,y=58,z=7},
	[5] = {x=80,y=89,z=7},
	[6] = {x=56,y=86,z=7},
	[7] = {x=40,y=76,z=7},
	[8] = {x=35,y=92,z=7},
	[9] = {x=52,y=98,z=7},
	[10] = {x=104,y=98,z=7},
	[11] = {x=121,y=98,z=7},
	[12] = {x=134,y=97,z=7},
	[13] = {x=81,y=63,z=7},
	[14] = {x=79,y=44,z=7},
	[15] = {x=128,y=89,z=7},
	[16] = {x=135,y=89,z=7},
	[17] = {x=145,y=90,z=7},
	[18] = {x=145,y=97,z=7},
	[19] = {x=157,y=85,z=7},
	[20] = {x=158,y=78,z=7},
	[21] = {x=148,y=75,z=7},
	[22] = {x=142,y=70,z=7},
	[23] = {x=151,y=61,z=7},
	[24] = {x=157,y=58,z=7},
	[25] = {x=139,y=54,z=7},
	[26] = {x=126,y=57,z=7},
	[27] = {x=124,y=48,z=7},
	[28] = {x=123,y=41,z=7}
}

function onUse(cid, item, frompos, item2, topos)
  print("itemUID:" .. item.uid)
	doBroadcastMessage("[AVISO] A cidade foi invadida por Monstros, venha proteger a cidade!")
	local monsterName
	if item.uid == 19000 then
		monsterName = 'King Monster'

	
	end