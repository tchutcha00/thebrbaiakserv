function onUse(cid, item, fromPosition, itemEx, toPosition)
	local info = 'Informação:\n\nBem-vindo as caves exclusivas.\nDigite !cave stats para saber quais são os donos atuais ou !cave time para saber quanto tempo falta para sua cave acabar.\nComo adquirir?\n\nCom 3kkk, você deve ter na sua backpack 30 pacotes de 100kk. São 12 caves disponíveis no servidor.\n\nCompre agora mesmo e aproveite, sendo livre totalmente de divisão de exp ou de players mal intencionados.\n\nFaça loot e aproveite. Bom jogo a todos!'
	doShowTextDialog(cid, 8977, info)
	return true
end
