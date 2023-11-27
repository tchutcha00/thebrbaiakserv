local dodge = 92798645

function onSay(cid, words, param)
  if(not checkExhausted(cid, 7384, 3)) then
    return true
  end
  if param == "" then
    doPlayerPopupFYI(cid, "--> Dodge System:\n O sistema consiste em defender 50% dos ataques recebidos.\n Por Exemplo: Com 250 dodges, Voce vai denfender\n 25% do dano.\n Cada pedra que voce usar, sua skill de dodge\n Aumenta em 1 ponto.\n Podendo no maximo ter 500\n Pontos. Para obter a pedra\n Voce precisa comprar\n Na Alavanca do templo\n ["..getPlayerStorageValue(cid, dodge).."/500] ")
  end
  return true
end