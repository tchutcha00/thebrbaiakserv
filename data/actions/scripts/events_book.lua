local events = {
		
		[0] = [[Eventos de hoje (Domingo):

11:00 - Capture The Flag
12:00 - Battlefield
13:00 - Zombie Event
16:00 - Battlefield
17:00 - Capture The Flag
18:00 - Zombie Event
19:00 - Real Castle
21:00 - Capture The Flag
22:00 - Battlefield
23:00 - Zombie Event
00:00 - Capture The Flag]],
		[1] = [[Eventos de hoje (Segunda-Feira):

11:00 - Capture The Flag
12:00 - Battlefield
13:00 - Zombie Event
16:00 - Battlefield
17:00 - Capture The Flag
18:00 - Zombie Event
19:00 - Real Castle
21:00 - Capture The Flag
22:00 - Battlefield
23:00 - Zombie Event
00:00 - Capture The Flag]],
		[2] = [[Eventos de hoje (Terça-Feira):

11:00 - Capture The Flag
12:00 - Battlefield
13:00 - Zombie Event
16:00 - Battlefield
17:00 - Capture The Flag
18:00 - Zombie Event
19:00 - Real Castle
21:00 - Capture The Flag
22:00 - Battlefield
23:00 - Zombie Event
00:00 - Capture The Flag]],
		[3] = [[Eventos de hoje (Quarta-Feira):

11:00 - Capture The Flag
12:00 - Battlefield
13:00 - Zombie Event
16:00 - Battlefield
17:00 - Capture The Flag
18:00 - Zombie Event
19:00 - Real Castle
21:00 - Capture The Flag
22:00 - Battlefield
23:00 - Zombie Event
00:00 - Capture The Flag]],
		[4] = [[Eventos de hoje (Quinta-Feira):

11:00 - Capture The Flag
12:00 - Battlefield
13:00 - Zombie Event
16:00 - Battlefield
17:00 - Capture The Flag
18:00 - Zombie Event
19:00 - Real Castle
21:00 - Capture The Flag
22:00 - Battlefield
23:00 - Zombie Event
00:00 - Capture The Flag]],
		[5] = [[Eventos de hoje (Sexta-Feira):

11:00 - Capture The Flag
12:00 - Battlefield
13:00 - Zombie Event
16:00 - Battlefield
17:00 - Capture The Flag
18:00 - Zombie Event
19:00 - Real Castle
21:00 - Capture The Flag
22:00 - Battlefield
23:00 - Zombie Event
00:00 - Capture The Flag]],
		[6] = [[Eventos de hoje (Sábado):

11:00 - Capture The Flag
12:00 - Battlefield
13:00 - Zombie Event
16:00 - Battlefield
17:00 - Capture The Flag
18:00 - Zombie Event
19:00 - Real Castle
21:00 - Capture The Flag
22:00 - Battlefield
23:00 - Zombie Event
00:00 - Capture The Flag]]

}


function onUse(cid, item, fromPosition, item2, toPosisition)
	doShowTextDialog(cid,8977,events[tonumber(os.date("%w"))])
	return true
end
