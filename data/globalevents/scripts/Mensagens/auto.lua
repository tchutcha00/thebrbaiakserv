local mensagens = {
	-- CONFIGURE A MENSAGEM E COR ABAIXO
	{
		msg = [[[HYPER-BAIAK]: Use !warsquare on/off para os amigos/inimigos de sua guild ficarem marcados com um quadrado ao redor, esse comando é muito útil em war com muito players onde mal dá pra enxergar quem é quem.]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: Muito cuidado ao deixar seu char upando de BOT e AFK, pois existem players de mau caráter que usam char lvl baixo para deixar você red propositalmente e depois mata-lo para ganhar os seus itens. RED = 50 frags no dia. Você é responsavel pelo seus itens e seu char!]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: você pode usar o sistema do bank atraves de comandos: [ !deposit | !balance | !withdraw] ]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: Se você eh lider de uma guild, você pode dar o comando: [!go] e todos os membros ficam com sua outfit ]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: Se você abrir CAST sem PASSWORD você ganha 5% de EXP a mais. ]], 
		cor = 18
	},
	
	{
		msg = [[[HYPER-BAIAK]: Você pode desativar o contador de kills da task no default falando !taskcount off e para ligar novamente fale !taskcount on. ]], 
		cor = 18
	},

	{
		msg = [[[Online System]: A cada 1 hora que você fica online você ganha 1 online token, para consultar execute o comando: !onlinebonus ]], 
		cor = 18
	},
	
	{
		msg = [[-> SISTEMA DE RESETS <-
Para resetar digite !resetar  Quando você resetar, você voltará para leveis iniciais, mas continua com life e mana do level que estava, ou seja, quanto mais resets tiver, mais life e mana você terá!!!]], 
		cor = 22
	},
	
	{
		msg = [[Por que minha life/mana aparecem sempre 100/100?
Sua life/mana não passarão de 100, pois ela é indicada em porcentagem.


Sou acostumado com o sistema padrão de life/mana, como saberei qual o valor real da mana e life que tenho?
Para informações diga !status.]], 
		cor = 22
	},
}

function onThink(interval, lastExecution)	
	local rnd_c = math.random(1, #mensagens)
	doBroadcastMessage(mensagens[rnd_c].msg, mensagens[rnd_c].cor)
	return true
end