local mensagens = {
	-- CONFIGURE A MENSAGEM E COR ABAIXO
	{
		msg = [[[HYPER-BAIAK]: Use !warsquare on/off para os amigos/inimigos de sua guild ficarem marcados com um quadrado ao redor, esse comando � muito �til em war com muito players onde mal d� pra enxergar quem � quem.]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: Muito cuidado ao deixar seu char upando de BOT e AFK, pois existem players de mau car�ter que usam char lvl baixo para deixar voc� red propositalmente e depois mata-lo para ganhar os seus itens. RED = 50 frags no dia. Voc� � responsavel pelo seus itens e seu char!]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: voc� pode usar o sistema do bank atraves de comandos: [ !deposit | !balance | !withdraw] ]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: Se voc� eh lider de uma guild, voc� pode dar o comando: [!go] e todos os membros ficam com sua outfit ]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: Se voc� abrir CAST sem PASSWORD voc� ganha 5% de EXP a mais. ]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: Voc� pode desativar o contador de kills da task no default falando !taskcount off e para ligar novamente fale !taskcount on. ]], 
		cor = 18
	},

	{
		msg = [[[Online System]: A cada 1 hora que voc� fica online voc� ganha 1 online token, para consultar execute o comando: !onlinebonus ]], 
		cor = 18
	},
	
	{
		msg = [[-> SISTEMA DE RESETS <-
Para resetar digite !resetar  Quando voc� resetar, voc� voltar� para leveis iniciais, mas continua com life e mana do level que estava, ou seja, quanto mais resets tiver, mais life e mana voc� ter�!!!]], 
		cor = 22
	},
	
	{
		msg = [[Por que minha life/mana aparecem sempre 100/100?
Sua life/mana n�o passar�o de 100, pois ela � indicada em porcentagem.


Sou acostumado com o sistema padr�o de life/mana, como saberei qual o valor real da mana e life que tenho?
Para informa��es diga !status.]], 
		cor = 22
	},
}

function onThink(interval, lastExecution)	
	local rnd_c = math.random(1, #mensagens)
	doBroadcastMessage(mensagens[rnd_c].msg, mensagens[rnd_c].cor)
	return true
end