local questions = {
	
	[1] = {question = "Que horas o Boss Stremoxy aparece no King Baiak?", a = "11:00", b = "18:00", c = "21:00", d = "23:00", right = "d"},
	[2] = {question = "Em qual cidade do King Baiak voc� recebe um b�nus por ca�ar em party?", a = "Venom", b = "Yalahar", c = "Donate City", d = "Tanoris", right = "d"},
	[3] = {question = "Qual desses eventos s� � realizado por um GOD do King Baiak?", a = "Bomberman", b = "Battlefield", c = "Dice Event", d = "CTF", right = "c"},
	[4] = {question = "Em qual quest o Boss Pandora aparece?", a = "Donate", b = "Cursed Skull", c = "Special Bags", d = "Nenhuma", right = "a"},
	[5] = {question = "Em qual quest o Boss O Coisa aparece?", a = "Under Set", b = "Promote", c = "Special Bags", d = "Nenhuma", right = "d"},
	[6] = {question = "A partir de qual level de minera��o come�a a minerar 2 Miner Token?", a = "40", b = "75", c = "80", d = "100", right = "d"},

}

local talkState = {}
local progress = {}
local right = {}
local nme = "Anoriel"

function msgcontains(txt, str) 
	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)')) 
end 

function onPlayerCloseChannel(cid)
	talkState[cid] = nil
end

local function askQuestion(cid)
	local question = math.random(#questions)
	if isInArray(progress[cid], question) then
		local i = 0
		while isInArray(progress[cid], question) or i > #questions do
			i = i + 1
			question = math.random(#questions)
		end
	end
	table.insert(progress[cid], question)
	return question
end
 
function onCreatureSay(cid, type, msg) 
	local msg = string.lower(msg) 
	if isInArray({"hi","oi","ola","hello"}, msg) and talkState[cid] == nil then
		talkState[cid] = 1
		selfSay("Ol� "..getCreatureName(cid)..", Nether � mesmo uma cidade muito interessante... Posso passar o resto da minha vida aqui e ainda n�o vou encontrar tudo o que h� de escondido. Que erro terr�vel foi acreditar que a {aura} espiritual era tudo o que havia para encontrar.",cid)
	elseif isInArray({"bye","tchau","goodbye","adeus"},msg) then
		selfSay("At� logo meu caro.",cid)
		talkState[cid] = nil
		progress[cid] = nil
		right[cid] = nil
	elseif isInArray({"aura"}, msg) and talkState[cid] == 1 then
		selfSay("Eu j� imaginava que voc� iria me perguntar sobre ela, todos s� pensam nisso... Eu posso te dar uma dica de como encontr�-la se voc� passar no meu teste. Ele � muito simples, basta voc� responder corretamente as minhas perguntas. Voc� quer tentar?", cid)
		talkState[cid] = 2
	elseif agreeNPC(msg) and talkState[cid] == 2 then
		selfSay("Muito bem, vamos come�ar:",cid)
		progress[cid] = {}
		local question = questions[askQuestion(cid)]
		local concat = question.question.."\n\n{a)} "..question.a.."\n{b)} "..question.b.."\n{c)} "..question.c.."\n{d)} "..question.d
		right[cid] = question.right
		selfSay(question.question,cid)
		selfSay("{a)} "..question.a,cid)
		selfSay("{b)} "..question.b,cid)
		selfSay("{c)} "..question.c,cid)
		selfSay("{d)} "..question.d,cid)
		talkState[cid] = 3

	elseif talkState[cid] == 3 then
		if isInArray({"a","b","c","d"},msg) then
			if msg == right[cid] then
				if #progress[cid] == 4 then
					selfSay("Muito bem, voc� respondeu corretamente a todas as minhas perguntas e agora vou te dar uma dica de como encontrar a localiza��o da aura espiritual, preste aten��o!",cid)
					selfSay("H� muitos anos, uma poderosa legi�o de Orcs dominou toda Nether. Eles utilizaram sua l�ngua antiga para criar v�rios rituais... Um certo dia estudando consegui ler as palvras 'krak nether tefar' em livro antigo sobre o ritual da Aura Espiritual. Eu acredito que se voc� encontrar um altar, fazer uma oferenda em dinheiro e pronunciar estas palavras voc� conseguir� encontrar o caminho para a aura. Esta � toda a informa��o que posso te dar... caso queria que eu a repita, voc� ter� que passar novamente no teste. Boa sorte!",cid)
					talkState[cid] = nil
					progress[cid] = nil
					right[cid] = nil
				else
					selfSay("Correto! Vamos para a pr�xima pergunta:", cid)
					local question = questions[askQuestion(cid)]
					local concat = question.question.."\n\n{a)} "..question.a.."\n{b)} "..question.b.."\n{c)} "..question.c.."\n{d)} "..question.d
					right[cid] = question.right
					selfSay(question.question,cid)
					selfSay("{a)} "..question.a,cid)
					selfSay("{b)} "..question.b,cid)
					selfSay("{c)} "..question.c,cid)
					selfSay("{d)} "..question.d,cid)
				end
			else
				selfSay("Errado! Infelizemente voc� n�o provou ser s�bio o bastante para encontrar a aura... Volte aqui depois que tiver adquirido mais conhecimento.", cid)
				talkState[cid] = nil
				progress[cid] = nil
				right[cid] = nil
			end
		else
			selfSay("O que?? Por favor me responda apenas a, b, c ou d!", cid)
		end


	end

	return true
end

function onThink()

	for a,b in pairs(talkState) do
		if isPlayer(a) then
			if getThingPos(a).z ~= getThingPos(getNpcCid()).z or getDistanceToCreature(a) >= 5 then 
				talkState[a] = nil
				progress[a] = nil
				right[a] = nil
			end
		else
			talkState[a] = nil
			progress[a] = nil
			right[a] = nil
		end
	end

end
