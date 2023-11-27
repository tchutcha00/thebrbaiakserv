function onThink(interval, lastExecution)
    local cor = 25
    local mensagens ={
[[Doações acima de R$ 100,00 DOUBLE POINTS !]]
}
doBroadcastMessage(mensagens[1], cor)
return TRUE
end