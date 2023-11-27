local critical = 42904

function onSay(cid, words, param)
  if(not checkExhausted(cid, 7384, 3)) then
    return true
  end
  if param == "" then
    doPlayerPopupFYI(cid, "--> Critical System:\n O sistema consiste em hitar 50% a mais dos ataques causados.\n Por Exemplo: Com 250 criticals, voce vai hitar\n 25% a mais de dano.\n Cada Pedra que voce usar, sua skill de critical\n Aumenta 1 ponto.\n Podendo no maximo ter 200\n Pontos. Para Obter a pedra\n Voce precisa comprar\n Na Alavanca do templo\n ["..getPlayerStorageValue(cid, critical).."/500] ")
  end
  return true
end
