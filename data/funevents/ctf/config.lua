if not CTF then
	CTF = {

		-- dias que irá abrir
		days = {
			[0] = {'11:00', '17:00', '21:00', '23:59'},
			[1] = {'11:00', '17:00', '21:00', '23:59'},
			[2] = {'11:00', '17:00', '21:00', '23:59'},
			[3] = {'11:00', '17:00', '21:00', '23:59'},
			[4] = {'11:00', '17:00', '21:00', '23:59'},
			[5] = {'11:00', '17:00', '21:00', '23:59'},
			[6] = {'11:00', '17:00', '21:00', '23:59'}
		},
		
		-- antimc, pontos, intervalo de efeito da flag, level minimo, quantidade minima de players
		game = {antimc = true, goals = 7, effectperiod = 333, min = {level = 10000, players = 2}},
		
		-- segundos para começar, segundos para finalizar, segundos q o jogador passará na sala da morte, segundos total para o evento fechar (1h)
		time = {start = 300, finish = 5, death = 10, left = 3600},

		-- posição do teleport de entrada
		joinpos = {x = 129, y = 74, z = 7},
		-- sala de espera
		waitpos = {x = 683, y = 148, z = 7},
		-- sala da morte (quando um jogador morre, passa alguns segundos lá e dps volta pra arena)
		deadpos = {x = 683, y = 148, z = 7},

		-- times
		teams = {
			
			-- time 1
			[1] = {
				-- nome, posição de onde eles nascerão
				name = 'Red Team', solo = {x = 646, y = 152, z = 7},
				-- id da bandeira, posição da bandeira
				flag = {id = 8617, pos = {x = 651, y = 154, z = 6}}
			},

			[2] = {
				-- mesma coisa q acima
				name = 'Blue Team', solo = {x = 602, y = 156, z = 7},
				flag = {id = 8621, pos = {x = 597, y = 154, z = 6}}
			}
		},

		-- recompensas, cada tabelinha é uma recompensa em item {itemid, count}
		rewards = {{6527, 25}, {9971, 50}}
	}
end
