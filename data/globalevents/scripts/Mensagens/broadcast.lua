local msgs = {
	
	[1] = "[HYPER-BAIAK]: Comandos uteis:\nAuto Loot: !autoloot\nReparar Fire Walker: !repairfirewalker\nVender pontos: !sellpoints\nSaber quanto tempo de potion tem: !potioninfo",
	[2] = "[HYPER-BAIAK]: Informação:\nDescubra os segredos de Nether.\nHunts e muito mais.\nBom Jogo",
	[3] = "[HYPER-BAIAK]: Comandos basicos:\nDodge System: !dodge\nCritical System: !critical\nCast system: /cast\nVer lista de spells: !spells\nPara mais comandos digite /commands\nBom Jogo",
	[4] = "[HYPER-BAIAK]: Para ver quem esta matando quem, abra o canal Mortes (Ctrl + O)",
	[5] = "[HYPER-BAIAK]: Para saber seu level de Dodge e Critical basta escrever !dodge ou !critical.",
	[6] = "[Aviso de Segurança] NUNCA digite sua senha em sites que nao sejam o OFICIAL e nem crie contas com a mesma senha em outros servidores. Site oficial: HYPER-BAIAK.ONLINE",
	[7] = "[SEGURANÇA] Cadastre um E-Mail verdadeiro em sua conta do site e gere sua Recovery Key - Não seja hackiado! Site oficial: HYPER-BAIAK.ONLINE",
	[8] = "[HYPER-BAIAK]: Para informações sobre os eventos e os sistemas do servidor, acesse nosso site: HYPER-BAIAK.ONLINE",
}

function onThink(interval, lastExecution, thinkInterval)
	local type = math.random(1,2) == 1 and MESSAGE_EVENT_ADVANCE or MESSAGE_STATUS_WARNING
	doBroadcastMessage(msgs[math.random(1,#msgs)], type)
	return true
end