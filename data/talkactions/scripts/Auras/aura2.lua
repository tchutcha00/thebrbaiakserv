-- CONFIGURAÇÕES
	aurastrs = 25943 -- storage da aura
	estrs = 25813 -- storage para o exhaust
	porcentagems = 30 -- chance de curar em cada volta da aura, em porcentagems
	quantheals = 20 -- porcentagems do hp máximo que cada cura irá curar. (No caso, irá curar 5% do hp máximo cada cura)
	tempos = 1180 -- tempos para dar uma volta no player (este tempos foi o que achei mais agradável visualmente, é recomendável não mudar)
	tipoauras = 36 -- número do efeito da aura (efeito de distância, pode ser identificado com /x no jogo)
	efeitocuras = 37 -- número do efeito quando a cura chega ao player (efeito de posição fixa, pode ser identificado com /z no jogo)

-- Função que chama a aura
function efeitosAura2s(i,tm,cid)
	if(isCreature(cid)) then
        	local atuals = getCreaturePosition(cid)
		local posauras = {
			{x=(atuals.x)-1, y=(atuals.y)-1, z=atuals.z},
			{x=atuals.x, y=(atuals.y)-1, z=atuals.z},
			{x=(atuals.x)+1, y=(atuals.y)-1, z=atuals.z},
			{x=(atuals.x)+1, y=atuals.y, z=atuals.z},
			{x=(atuals.x)+1, y=(atuals.y)+1, z=atuals.z},
			{x=atuals.x, y=(atuals.y)+1, z=atuals.z},
			{x=(atuals.x)-1, y=(atuals.y)+1, z=atuals.z},
			{x=(atuals.x)-1, y=atuals.y, z=atuals.z},
		}
		local chances = math.random(100)
		if(chances<=porcentagems/8) then
			doCreatureAddMana(cid, getCreatureMaxMana(cid)/quantheals)
			if(i<=8 and i>1) then
				doSendDistanceShoot({x=posauras[i].x, y=posauras[i].y, z=posauras[i].z}, atuals, tipoauras)
			else
				doSendDistanceShoot({x=posauras[1].x, y=posauras[1].y, z=posauras[1].z}, atuals, tipoauras)
			end
			doSendMagicEffect(atuals, efeitocuras)
		end
		if(i==8) then
			doSendDistanceShoot({x=posauras[i].x, y=posauras[i].y, z=posauras[i].z}, {x=posauras[1].x, y=posauras[1].y, z=posauras[1].z}, tipoauras)
		elseif(i<8) then
			doSendDistanceShoot({x=posauras[i].x, y=posauras[i].y, z=posauras[i].z}, {x=posauras[i+1].x, y=posauras[i+1].y, z=posauras[i+1].z}, tipoauras)
		end
		if(i<=8 and getPlayerStorageValue(cid, aurastrs)==2) then
			i = i+1
			tm = tempos/8
			return addEvent(efeitosAura2s,tm,i,tm,cid)
		elseif(i>8 and getPlayerStorageValue(cid, aurastrs)==2) then
			return efeitosAura2s(1,0,cid)
		else
			return TRUE
		end
	else
		return TRUE
	end
end

-- Função principal
function onSay(cid, words, param, channel)
if getPlayerStorageValue(cid, 25950) == 2 then
doPlayerSendCancel(cid, "Você precisa desativar sua aura level 1.")
return true
end
if getPlayerStorageValue(cid, 27651) == 2 then
doPlayerSendCancel(cid, "Você precisa desativar sua aura level 3.")
return true
end
if getPlayerStorageValue(cid, 28911) == 2 then
doPlayerSendCancel(cid, "Você precisa desativar sua aura level 4.")
return true
end
	if(param=="on") then
		if getPlayerStorageValue(cid, estrs) > os.time() then
			doPlayerSendCancel(cid, "Espere "..(getPlayerStorageValue(cid, estrs) - os.time()).." segundos para poder habilitar aura level 2 novamente.")
		else
			if(getPlayerStorageValue(cid, aurastrs)==2) then
				doPlayerSendCancel(cid,"Sua Aura Level 2 já está habilitada.")
			elseif(getPlayerStorageValue(cid, aurastrs)==-1) then
				doPlayerSendCancel(cid,"Aura Level 2 ligada!")
				setPlayerStorageValue(cid, aurastrs, 2)
				efeitosAura2s(1,tempos/8,cid)
		end
		end
	elseif(param=="off") then
		if(getPlayerStorageValue(cid, aurastrs)== 2) then
			setPlayerStorageValue(cid, estrs, os.time()+2)
			setPlayerStorageValue(cid, aurastrs, -1)
			doPlayerSendCancel(cid,"Aura Level 2 desligada!")
		end
	else	
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Digite '!aura2 on' para ligar sua aura, e '!aura2 off' para desligá-la.")
	end
	return true
end 
