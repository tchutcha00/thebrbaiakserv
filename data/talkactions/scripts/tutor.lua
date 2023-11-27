local blockedLinks = {'bug', 'bugado', 'pick', 'cave exclusiva', 'addon', 'mining', 'donate', 'doação', 'points', 'exclusiva', 'minera', 'mineração', 'hunt exclusiva', 'admin', 'adm', 'admin', 'task', 'missão', 'site', 'stamina', 'update', 'castle', 'ss', 'save', 'server save', 'red', 'skull', 'magia', 'magias', 'autoloot', 'ip', 'site', 'dnt', 'reset', 'dodge', 'critical', 'troco', 'vendo', 'sell', 'buy', 'compro', 'wand energy'}

-- END OF CONFIG --

local blockedLinksData = {}
local separator = '[ !\t%$%^%+%-%.%%_,<>]*'
for _, linkText in pairs(blockedLinks) do
    local data = {}
    data.link = linkText

    data.preg = '.*'
    for c in string.gmatch(linkText, '.') do
        if(c == '.') then
            data.preg = data.preg .. '.*'
        else
            data.preg = data.preg .. c .. separator
        end
    end
    data.preg = data.preg .. '.*'

    table.insert(blockedLinksData, data)
end

function isLegalMessage(words)
    for _, blockedLink in pairs(blockedLinksData) do
        if(string.match(words, blockedLink.preg) ~= nil) then
            return false, blockedLink.link
        end
    end
    return true, ''
end

local words = {'tk', 'world', 'us', 'online', 'eu', 'ml', 'org', 'no-ip', 'net', 'com', 'pl', 'biz', 'servegame', 'br', 'sytes', 'info', 'mine', 'nu', 'c0m', 'n3t', '0rg'}
local symbols = {'.', ',', ';', '-'}

function onSay(cid, words, param, channel)
    words = words .. ' ' .. param
    local legalMessage, forbiddenLink = isLegalMessage(
    string.lower(words))

    if(not legalMessage) then
	if channel == CHANNEL_HELP then
		if getPlayerStorageValue(cid, 46349) - os.time() <= 0 then
		timePassed = 2 * 60
		local pid = getPlayersOnline()
	  		for i = 1, #pid do
				if forbiddenLink == "mining" or forbiddenLink == "minerar" or forbiddenLink == "minera" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Para minerar basta comprar uma pick e usar na parede da mina, sua entrada fica no templo, você pode trocar os itens obtidos la por vip coins na alavanca dentro da mina, a hotkey se encontra no /minerar.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "cave exclusiva" or forbiddenLink == "exclusiva" or forbiddenLink == "super up" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Super UP você pode comprar por revolution coins no teleport New Items esquerda do templo.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "addon" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Você pode obter addon com addon doll (30kk na alavanca).", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "donate" or forbiddenLink == "doação" or forbiddenLink == "points" or forbiddenLink == "dnt" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Todas as doações recebem Double Points, você pode fazer sua doação acessando https://king-baiak.com.br/?subtopic=buypt", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "admin" or forbiddenLink == "adm" or forbiddenLink == "admin" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: O adm está ocupado no momento, respondera em breve.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "task" or forbiddenLink == "missão" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Você encontra o npc de task no templo, você pode pegar todas as tasks de uma vez.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "site" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Site do servidor é king-baiak.com.br !", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "stamina" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Você pode recuperar stamina com refil da alavanca (62kk) ou fazendo a quest da stamina inifita. !", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "castle" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Castle 48 horas abre todos os dias as 21:00 horas e ao domina-lo você tem acesso a caves exclusivas e vantagens até o outro dia.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "update" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Quando algum update é lançado nos imediatamente avisamos em nosso website.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "refine" or forbiddenLink == "refinar" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Você pode comprar o Refine Stone no SHOP VIP você pode usar até 100 vezes no mesmo item.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "magia" or forbiddenLink == "magias" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Você pode ver suas magias digitando !spells.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "pick" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Você pode comprar pick dentro da area mineração.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "autoloot" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Você pode ver todas as informações digitando !autoloot, lembreve de deixa-lo ativado usando !autoloot power, lembre que o gold do autoloot sempre vai para o banco.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "skull" or forbiddenLink == "red" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Você pega Red Skull com 50 frags ao dia, 250 na semana ou 650 no mês, Red Skull demora 1 dia para sair ou você pode comprar um Remove Frags na alavanca do templo. Black Skull: 150 frags ao dia, 350 na semana ou 750 no mês.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "site" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Site/IP oficial do servidor é king-baiak.com.br !", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "bug" or forbiddenLink == "bugado" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Encontrou um bug? reporte para o adm e iremos corrigir no maximo 24 horas.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "compro" or forbiddenLink == "vendo" or forbiddenLink == "sell" or forbiddenLink == "buy" or forbiddenLink == "troco" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Por favor, para comercio use o chat TRADE e mantenha este chat limpo para melhor suporte.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "dodge" or forbiddenLink == "critical" then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Dodge é um sistema de bloquear ataques do inimigo e critical dobrar o seu ataque no inimigo, você pode comprar dodge ou critical no npc Dodge/Critical no templo.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "save" or forbiddenLink == "server save"  then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: O server save ocorre todos os dias ás 05:00 da manhã !", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				elseif forbiddenLink == "reset"  then
					doPlayerSendChannelMessage(pid[i], "", "TUTOR ROBO: Quanto mais resets, mais resistente seu personagem será. Para resetar, use o comando !reset. Você pode resetar a cada 1500 leveis. Quanto maior o level que você resetar, mais life e mana terá.", TALKTYPE_CHANNEL_O, CHANNEL_HELP)
				end
				setPlayerStorageValue(cid, 46349, os.time() + timePassed)
	  		end
		else
			doPlayerSendCancel(cid, "O Tutor Robo ja lhe respondeu uma pergunta nos ultimos 2 minutos.")
		end
	end
    end

    -- HIMSELF AUTOMATICO
	if getPlayerAccess(cid) == 1 then
		if getPlayerStorageValue(cid, STORAGEVALUE_HIMSELF) <= os.time() then
		    print("oi")
			playerTalkToHimself(cid, false)
			setPlayerStorageValue(cid, STORAGEVALUE_HIMSELF, -1)
		
			local advertsing = false
			for _, w in ipairs(words) do
				for _, s in ipairs(symbols) do
		        	if(text:lower():gsub(' ', ''):find(s .. w, 1, true)) then
		            	advertsing = true
		            	break
		        	end
		    	end
			end

	        if not advertsing then
	        	local ip = text:match("%d+%.%d+%.%d+%.%d+")
	        	if ip then
	        		advertsing = true
	        	end
	        end

		    if advertsing then
		    	playerTalkToHimself(cid, true)
		    	setPlayerStorageValue(cid, STORAGEVALUE_HIMSELF, os.time() + 1)
		    end
		end
	end
    return false
end
