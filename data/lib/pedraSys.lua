PEDRA_VOC = {
		-- MS
		[5] = {
			reduce_shield = { -- Vai reduzir o valor atual do shield para a porcentagem abaixo
				-- vazio
			}, 
			multi_shield = { -- Vai multiplicar o valor atual do shield por X valor configurado abaixo
				-- ID e valor
				[7] = 2.5, -- 2.5x o shield atual dele, ou seja, se ele tem 34 de shield, vai ficar com 85 após a transformação -> RP 
				[8] = 3, -- 3x o shield atual dele, ou seja, se ele tem 34 de shield, vai ficar com 102 após a transformação  -> EK
			},
			reset_skills = { -- quais skills serão resetadas? MS resetara a skill MAG_LEVEL para RP e KINA, como está abaixo, se um MS vira RP ou KINA, ele perde as skills abaixo
				[7] = {SKILL__MAGLEVEL},
				[8] = {SKILL__MAGLEVEL},
			},
			novas_skills = { -- se um MS for virar ED, nao ha necessidade de adicionar aqui, ja que nao está resetada ali em cima ^
				[7] = {SKILL_DISTANCE},
				[8] = {SKILL_SWORD, SKILL_AXE, SKILL_CLUB},
			}
		},
		
		-- ED
		[6] = {
			reduce_shield = { -- Vai reduzir o valor atual do shield para a porcentagem abaixo
				-- vazio
			},
			multi_shield = { -- Vai multiplicar o valor atual do shield por X valor configurado abaixo
				-- ID e valor
				[7] = 2.5, -- 2.5x o shield atual dele, ou seja, se ele tem 34 de shield, vai ficar com 85 após a transformação -> RP 
				[8] = 3, -- 3x o shield atual dele, ou seja, se ele tem 34 de shield, vai ficar com 102 após a transformação  -> EK
			},
			reset_skills = { -- quais skills serão resetadas? MS resetara a skill MAG_LEVEL para RP e KINA, como está abaixo, se um MS vira RP ou KINA, ele perde as skills abaixo
				[7] = {SKILL__MAGLEVEL},
				[8] = {SKILL__MAGLEVEL},
			},
			novas_skills = { -- se um ED for virar MS, nao ha necessidade de adicionar aqui, ja que nao está resetada ali em cima ^
				[7] = {SKILL_DISTANCE},
				[8] = {SKILL_SWORD, SKILL_AXE, SKILL_CLUB},
			}
		},
		
		-- RP
		[7] = {
			-- SHIELDS
			reduce_shield = { -- Vai reduzir o valor atual do shield para a porcentagem abaixo
				-- ID e valor
				[5] = 0.25, -- 25% de shield reduzido para MS (0.25 para 25%, 0.35 para 35% e assim por diante)
				[6] = 0.25, -- 25% de shield reduzido para ED (0.25 para 25%, 0.35 para 35% e assim por diante)
			}, 
			
			multi_shield = { -- Vai multiplicar o valor atual do shield por X valor configurado abaixo
				-- vazio, caso va adicionar algo, siga o exemplo de cima.
			},
			reset_skills = { -- quais skills serão resetadas para tais vocations? Exemplo: RP vai resetar distance para MS, ED e EK, como esta abaixo
				[5] = {SKILL_DISTANCE},
				[6] = {SKILL_DISTANCE},
				[8] = {SKILL_DISTANCE, SKILL__MAGLEVEL},
			},
			novas_skills = { -- Quais skills vao ganhar tais vocations? MS e ED vao ganhar MAG LEVEL, segue exemplo abaixo
				[5] = {SKILL__MAGLEVEL},
				[6] = {SKILL__MAGLEVEL},
				[8] = {SKILL_SWORD, SKILL_AXE, SKILL_CLUB},
			}
		},
		
		-- EK
		[8] = {
			reduce_shield = { -- Vai reduzir o valor atual do shield para a porcentagem abaixo
				[5] = 0.25, -- 25% de shield atual, se ele tiver 80 de shield, vai ficar com 20 -> MS
				[6] = 0.25, -- 25% de shield atual,  se ele tiver 80 de shield, vai ficar com 20 -> ED
			},
			multi_shield = { -- Vai multiplicar o valor atual do shield por X valor configurado abaixo
				-- vazio
			},
			reset_skills = { -- quais skills serão resetadas para tais vocations? Exemplo: EK vai resetar sword, axe e club para MS, ED e RP, como esta abaixo
				[5] = {SKILL_SWORD, SKILL_AXE, SKILL_CLUB},
				[6] = {SKILL_SWORD, SKILL_AXE, SKILL_CLUB},
				[7] = {SKILL_SWORD, SKILL_AXE, SKILL_CLUB},
			},
			novas_skills = { -- Quais skills vao ganhar tais vocations? MS e ED vao ganhar MAG LEVEL, segue exemplo abaixo
				[5] = {SKILL__MAGLEVEL},
				[6] = {SKILL__MAGLEVEL},
				[7] = {SKILL_DISTANCE},
			}
		},
}