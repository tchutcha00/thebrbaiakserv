-- Cria a tabela de configuração
language_Talkactions = {}

-- Cria uma tabela para cada NPC
language_Talkactions.autoloot = {pt = {}, en = {}}
language_Talkactions["Addon Doll"] = {pt = {}, en = {}}
language_Talkactions.snowball = {pt = {}, en = {}}
language_Talkactions.aol = {pt = {}, en = {}}
language_Talkactions.bless = {pt = {}, en = {}}
language_Talkactions["Safe Depot"] = {pt = {}, en = {}}
language_Talkactions["Sell Points"] = {pt = {}, en = {}}
language_Talkactions.fly = {pt = {}, en = {}}
language_Talkactions.firewalker = {pt = {}, en = {}}
language_Talkactions.vip = {pt = {}, en = {}}
language_Talkactions["Cave Owners"] = {pt = {}, en = {}}
-- Define as mensagens nas línguas para cada NPC

-- Autoloot
language_Talkactions.autoloot["pt"][1] = "Não disponível para free account"
language_Talkactions.autoloot["en"][1] = "Not available to free accounts"

language_Talkactions.autoloot["pt"][2] = "sim"
language_Talkactions.autoloot["en"][2] = "yes"

language_Talkactions.autoloot["pt"][3] = "não"
language_Talkactions.autoloot["en"][3] = "no"

language_Talkactions.autoloot["pt"][4] = "{Auto-Loot} ---Menu Auto Loot do jogador\n{Auto-Loot} ----------------\n{Auto-Loot} ---Coletar dinheiro: "
language_Talkactions.autoloot["en"][4] = "{Auto-Loot} ---Player Auto Loot menu\n{Auto-Loot} --------------------\n{Auto-Loot} ---Collect money: "

language_Talkactions.autoloot["pt"][5] = ". Para ligar/desligar: !autoloot gold \n{Auto-Loot} ---Coletar itens únicos: "
language_Talkactions.autoloot["en"][5] = ". To turn on/off: !autoloot gold \n{Auto-Loot} ---Collect unique items: "

language_Talkactions.autoloot["pt"][6] = ". Para ligar/desligar: !autoloot power\n{Auto-Loot} --Configuração dos slots:\n{Auto-Loot} ---Slot 1: "
language_Talkactions.autoloot["en"][6] = ". To turn on/off: !autoloot power\n{Auto-Loot} ---Slot configuration:\n{Auto-Loot} ---Slot 1: "

language_Talkactions.autoloot["pt"][7] = "\n{Auto-Loot} ---Para adicionar um novo item aos slots: !autoloot add, <nome do item>\n{Auto-Loot} ---Para retirar um item dos slots: !autoloot remove, <nome do item>\n{Auto-Loot} ---Para limpar todos os slots utilize: !autoloot clear\n{Auto-Loot} ---Para informações de quanto você já fez utilizando a coleta de dinheiro, use: !autoloot goldinfo\n\nSe seu autoloot bugar use !autoloot desbug\n\n{Auto-Loot} ----------------"
language_Talkactions.autoloot["en"][7] = "\n{Auto-Loot} ---To add a new item to the slots: !autoloot add, <item name>\n{Auto-Loot} ---To remove an item from the slots: !autoloot remove, <item name>\n{Auto-Loot} ---To clean all the slots use: !autoloot clean\n{Auto-Loot} ---To see information about how much you have collected using to gold collecting, use: !autoloot goldinfo\n\nIf your autoloot gets bugged, use: !autoloot desbug\n\n{Auto-Loot} -------------------"

language_Talkactions.autoloot["pt"][8] = "ligou"
language_Talkactions.autoloot["en"][8] = "have turned on"

language_Talkactions.autoloot["pt"][9] = "desligou"
language_Talkactions.autoloot["en"][9] = "have turned off"

language_Talkactions.autoloot["pt"][10] = "Você"
language_Talkactions.autoloot["en"][10] = "You"

language_Talkactions.autoloot["pt"][11] = "o auto loot."
language_Talkactions.autoloot["en"][11] = "the auto loot."

language_Talkactions.autoloot["pt"][12] = "a coleta de dinheiro."
language_Talkactions.autoloot["en"][12] = "the money collecting."

language_Talkactions.autoloot["pt"][13] = "O sistema de coleta de dinheiro está desligado"
language_Talkactions.autoloot["en"][13] = "The money collecting system is turned off"

language_Talkactions.autoloot["pt"][14] = "O sistema já coletou"
language_Talkactions.autoloot["en"][14] = "The system has alredy collected"

language_Talkactions.autoloot["pt"][15] = "Você não pode adicionar moedas no autoloot. Para coletar dinheiro use !autoloot gold"
language_Talkactions.autoloot["en"][15] = "You cannot add coins to the autoloot. To collect money use !autoloot gold"

language_Talkactions.autoloot["pt"][16] = "adicionado à sua lista do auto loot! Para ver sua lista diga !autoloot list"
language_Talkactions.autoloot["en"][16] = "added to your auto loot list! To see your list use !autoloot list"

language_Talkactions.autoloot["pt"][17] = "já está em sua lista!"
language_Talkactions.autoloot["en"][17] = "is already in your list!"

language_Talkactions.autoloot["pt"][18] = "Sua lista já tem 4 itens! Você deve remover algum antes de adicionar outro."
language_Talkactions.autoloot["en"][18] = "Your list already has 4 items! You must remove one before adding a new one."

language_Talkactions.autoloot["pt"][19] = "adicionado à sua lista do auto loot! Para ver sua lista diga !autoloot"
language_Talkactions.autoloot["en"][19] = "added to your auto loot list! To see your list use !autoloot list"

language_Talkactions.autoloot["pt"][20] = "já está em sua lista!"
language_Talkactions.autoloot["en"][20] = "is already in your list!"

language_Talkactions.autoloot["pt"][21] = "Você já tem um item adicionado no auto loot! Para adicionar outro, você deve remover o item atual."
language_Talkactions.autoloot["en"][21] = "You already have an item added in the auto loot! To add a another, you must remove the current one."

language_Talkactions.autoloot["pt"][22] = "Este item não existe!"
language_Talkactions.autoloot["en"][22] = "This item does not exist!"

language_Talkactions.autoloot["pt"][23] = "removido da sua lista do auto loot!"
language_Talkactions.autoloot["en"][23] = "removed from your auto loot list!"

language_Talkactions.autoloot["pt"][24] = "Este item não está na sua lista!"
language_Talkactions.autoloot["en"][24] = "This item is not in your list!"

language_Talkactions.autoloot["pt"][25] = "Lista limpa!"
language_Talkactions.autoloot["en"][25] = "List cleared!"

language_Talkactions.autoloot["pt"][26] = "Sua lista ja está limpa!"
language_Talkactions.autoloot["en"][26] = "Your list is already cleared!"

language_Talkactions.autoloot["pt"][27] = "Desbugado!"
language_Talkactions.autoloot["en"][27] = "Disbugged!"

language_Talkactions.autoloot["pt"][28] = "O sistema auto loot está coletando"
language_Talkactions.autoloot["en"][28] = "The auto loot system is collecting"

-- Addon Doll
language_Talkactions["Addon Doll"]["pt"][1] = "Digite o nome correto!"
language_Talkactions["Addon Doll"]["en"][1] = "Type the correct name!"

language_Talkactions["Addon Doll"]["pt"][2] = "Voce não possui Addon Doll!"
language_Talkactions["Addon Doll"]["en"][2] = "You do not have an Addon Doll!"

language_Talkactions["Addon Doll"]["pt"][3] = "Parametro incorreto!"
language_Talkactions["Addon Doll"]["en"][3] = "Bad param!"

language_Talkactions["Addon Doll"]["pt"][4] = "Você recebeu seu addons!"
language_Talkactions["Addon Doll"]["en"][4] = "You have reived your addons!"

-- Snowball
language_Talkactions.snowball["pt"][1] = "Você tem"
language_Talkactions.snowball["en"][1] = "You have"

language_Talkactions.snowball["pt"][2] = "pontos"
language_Talkactions.snowball["en"][2] = "points"

language_Talkactions.snowball["pt"][3] = "munições.\n------------------\nO maior matador:\n"
language_Talkactions.snowball["en"][3] = "ammunition.\n----------------\nThe biggest killer:\n"

language_Talkactions.snowball["pt"][4] = "Você precisa estar no evento ou fora do protection zone."
language_Talkactions.snowball["en"][4] = "You must be inside the event and out of protection zone."

language_Talkactions.snowball["pt"][5] = "Restam"
language_Talkactions.snowball["en"][5] = "There are"

language_Talkactions.snowball["pt"][6] = "bolas de neve."
language_Talkactions.snowball["en"][6] = "snowballs left."

language_Talkactions.snowball["pt"][7] = "Usando sua última bola de neve."
language_Talkactions.snowball["en"][7] = "Using your last snowball."

language_Talkactions.snowball["pt"][8] = "Você está sem bolas de neve, recarregue no centro do campo."
language_Talkactions.snowball["en"][8] = "You are out of snowballs, recharge in the center of the map."

language_Talkactions.snowball["pt"][9] = "Você não pode atirar tão rapido."
language_Talkactions.snowball["en"][9] = "You cannot shoot that fast."

language_Talkactions.snowball["pt"][10] = "Você foi morto por"
language_Talkactions.snowball["en"][10] = "You were killed by"

language_Talkactions.snowball["pt"][11] = "Você matou"
language_Talkactions.snowball["en"][11] = "You killed"

-- Firewalker
language_Talkactions.firewalker["pt"][1] = "Você precisa de"
language_Talkactions.firewalker["en"][1] = "You need"

language_Talkactions.firewalker["pt"][2] = "gps para trocar."
language_Talkactions.firewalker["en"][2] = "gps to change."

language_Talkactions.firewalker["pt"][3] = "Você não tem uma"
language_Talkactions.firewalker["en"][3] = "You do not have a"

language_Talkactions.firewalker["pt"][4] = "para trocar por uma nova."
language_Talkactions.firewalker["en"][4] = "to trade for a new one."

-- Cave Owners
language_Talkactions["Cave Owners"]["pt"][1] = "Dono"
language_Talkactions["Cave Owners"]["en"][1] = "Owner"

language_Talkactions["Cave Owners"]["pt"][2] = "por mais"
language_Talkactions["Cave Owners"]["en"][2] = "for"

language_Talkactions["Cave Owners"]["pt"][3] = "LIVRE. Antigo dono"
language_Talkactions["Cave Owners"]["en"][3] = "FREE. Former owner"

language_Talkactions["Cave Owners"]["pt"][4] = "LIVRE"
language_Talkactions["Cave Owners"]["en"][4] = "FREE"

-- Aol
language_Talkactions.aol["pt"][1] = "Você comprou um AOL."
language_Talkactions.aol["en"][1] = "You have bought an AOL."

language_Talkactions.aol["pt"][2] = "Você precisa de 50k para comprar um aol"
language_Talkactions.aol["en"][2] = "You need 50k to buy an aol."

-- Bless
language_Talkactions.bless["pt"][1] = "Você já tem todas as bless."
language_Talkactions.bless["en"][1] = "You already have all the blessings."

language_Talkactions.bless["pt"][2] = "Você precisa de"
language_Talkactions.bless["en"][2] = "You need"

language_Talkactions.bless["pt"][3] = "para comprar bless."
language_Talkactions.bless["en"][3] = "to buy bless."

language_Talkactions.bless["pt"][4] = "para comprar bless."
language_Talkactions.bless["en"][4] = "to buy bless."

-- Safe Depot
language_Talkactions["Safe Depot"]["pt"][1] = "Aguarde antes de usar novamente."
language_Talkactions["Safe Depot"]["en"][1] = "Wait before using again."

language_Talkactions["Safe Depot"]["pt"][2] = "Você não pode pegar backpacks com esse comando."
language_Talkactions["Safe Depot"]["en"][2] = "You cannot pick up backpacks with this command."

language_Talkactions["Safe Depot"]["pt"][3] = "O item foi movido do depot para sua backpack."
language_Talkactions["Safe Depot"]["en"][3] = "The item was moved from the depot to your backpack."

language_Talkactions["Safe Depot"]["pt"][4] = "Você não tem espaço na sua bp para pegar o item."
language_Talkactions["Safe Depot"]["en"][4] = "You do not have room for this item in your backpack."

language_Talkactions["Safe Depot"]["pt"][5] = "Nenhum item para mover do depot para sua backpack."
language_Talkactions["Safe Depot"]["en"][5] = "No items to move from depot to your backpack."

language_Talkactions["Safe Depot"]["pt"][6] = "Você não está no dp."
language_Talkactions["Safe Depot"]["en"][6] = "You are not in the depot."

-- Sell Points
language_Talkactions["Sell Points"]["pt"][1] = "Escolha uma quantidade de points."
language_Talkactions["Sell Points"]["en"][1] = "Choose an ammount of points."

language_Talkactions["Sell Points"]["pt"][2] = "Você transferiu"
language_Talkactions["Sell Points"]["en"][2] = "You have transfered"

language_Talkactions["Sell Points"]["pt"][3] = "para este documento."
language_Talkactions["Sell Points"]["en"][3] = "to this document."

language_Talkactions["Sell Points"]["pt"][4] = "Você não tem espaço para o documento, libere um slot na sua backpack."
language_Talkactions["Sell Points"]["en"][4] = "You do not have room for this document, open a slot in your backpack."

language_Talkactions["Sell Points"]["pt"][5] = "Desculpe, os points não foram encontrados."
language_Talkactions["Sell Points"]["en"][5] = "Sorry, the points have not been found."

language_Talkactions["Sell Points"]["pt"][6] = "Escolha a quantidade de points você quer transferir ao documento."
language_Talkactions["Sell Points"]["en"][6] = "Choose how many points you wish to transfer to the document."

-- Fly
language_Talkactions.fly["pt"][1] = "Não pode usar aqui."
language_Talkactions.fly["en"][1] = "You cannot use it here."

language_Talkactions.fly["pt"][2] = "Não pode usar em eventos."
language_Talkactions.fly["en"][2] = "You cannot use it in events."

language_Talkactions.fly["pt"][3] = "Você não pode usar fly na war anti entrosa."
language_Talkactions.fly["en"][3] = "You cannot use fly in a war anti entrosa."

language_Talkactions.fly["pt"][4] = "Você precisa estar em uma protection zone para se teleportar."
language_Talkactions.fly["en"][4] = "You must be in a protection zone to teleport."

language_Talkactions.fly["pt"][5] = "Bora treinar!"
language_Talkactions.fly["en"][5] = "Lets train!"

language_Talkactions.fly["pt"][6] = "Todos os trainers estão lotados."
language_Talkactions.fly["en"][6] = "All the trainers are occupied."

language_Talkactions.fly["pt"][7] = "Sua casa fica na área donate e somente jogadores donate podem ir para lá."
language_Talkactions.fly["en"][7] = "Your house is in the donate area and only donate players can go there."

language_Talkactions.fly["pt"][8] = "Bem vindo à sua casa!"
language_Talkactions.fly["en"][8] = "Welcome to your house!"

language_Talkactions.fly["pt"][9] = "Você não tem uma casa!"
language_Talkactions.fly["en"][9] = "You do not have a house!"

-- Vip System
language_Talkactions.vip["pt"][1] = "Você só pode executar este comando em protection zone."
language_Talkactions.vip["en"][1] = "You can only execute this command in protection zone."

function getTalkMessage(cid, fileName, message)
	local lang = getPlayerStorageValue(cid, language)
	if type(lang) == "string" then
		if language_Talkactions[fileName][lang] and language_Talkactions[fileName][lang][message] then
			return language_Talkactions[fileName][lang][message]
		else
			return language_Talkactions[fileName]["en"][message]
		end
	else
		return language_Talkactions[fileName]["pt"][message]
	end
end

gTm = getTalkMessage
