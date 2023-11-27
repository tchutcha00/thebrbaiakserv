function onTime()
	if not getCreatureByName"Papai Noel" then
		doCreateMonster("Goblin Noel Guard", {x = 225, y = 271, z = 7})
		doCreateMonster("Goblin Noel Elite", {x = 217, y = 268, z = 7})
		doCreateMonster("Papai Noel", {x = 219, y = 271, z = 7})
		doBroadcastMessage("[NATAL 2019] O Papai Noel e seus Goblins chegaram na arena de Natal! Venha eliminar os goblins para ganhar presentes especiais!")
	end
	return true
end

function onThink()
	if getCreatureByName"Papai Noel" then
		if not getCreatureByName"Goblin Noel Elite" then
			doCreateMonster("Goblin Noel Elite", {x = 215, y = 272, z = 7})
		end
		if not getCreatureByName"Goblin Noel Guard" then
			doCreateMonster("Goblin Noel Guard", {x = 221, y = 275, z = 7})
		end
	end
	return true
end
