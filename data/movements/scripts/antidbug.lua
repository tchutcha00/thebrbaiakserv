local positions = {
{x = 112, y = 82, z = 7}, -- aqui vc coloca a posição pra onde ele vão
{x = 113, y = 82, z = 7}, 
{x = 114, y = 82, z = 7}, 
{x = 112, y = 83, z = 7},
{x = 114, y = 83, z = 7},
{x = 112, y = 84, z = 7},
{x = 113, y = 84, z = 7},
{x = 114, y = 84, z = 7}
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
doTeleportThing(cid, positions[math.random(1, #positions)])
doSendMagicEffect(getCreaturePosition(cid), 14)
return true
end