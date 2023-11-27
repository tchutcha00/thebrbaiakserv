if not battlefield then
	battlefield = {
		
		days = {
			[0] = {'12:00', '16:00', '22:00'},
			[1] = {'12:00', '16:00', '22:00'},
			[2] = {'12:00', '16:00', '22:00'},
			[3] = {'12:00', '16:00', '22:00'},
			[4] = {'12:00', '16:00', '22:00'},
			[5] = {'12:00', '16:00', '22:00'},
			[6] = {'12:00', '16:00', '22:00'}
		},
		
		game = {antimc = true, min = {level = 10000, players = 2}},
		time = {start = 300, finish = 2, wall = 15},

		joinpos = {x = 129, y = 74, z = 7},
		waitpos = {x = 2382, y = 1107, z = 7},

		teams = {

			[1] = {name = 'Black Assassins', solo = {x = 2323, y = 1107, z = 6}},
			[2] = {name = 'Red Barbarians', solo = {x = 2299, y = 1107, z = 6}},
			[3] = {name = 'Espectadores', solo = {x = 2311, y = 1101, z = 6}}
		},

		walls = {

			{id = 1056, position = {x = 2311, y = 1105, z = 6, stackpos = 1}},
			{id = 1056, position = {x = 2311, y = 1106, z = 6, stackpos = 1}},
			{id = 1056, position = {x = 2311, y = 1107, z = 6, stackpos = 1}},
			{id = 1056, position = {x = 2311, y = 1108, z = 6, stackpos = 1}}
		},

		rewards = {{6527, 25}, {9971, 50}}
	}
end