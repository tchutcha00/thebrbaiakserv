function onStartup()
function sendTempleEffect(n)
    local n = n or 1
    local poz = {
        {x = 110, y = 78, z = 7},
        {x = 116, y = 78, z = 7},
    }
    local next = #poz == n and 1 or n+1
    doSendDistanceShoot(poz[n], poz[next], 33)
    addEvent(sendTempleEffect, 500, next)
    return true
end
sendTempleEffect(1)
addEvent(sendTempleEffect, 500, 2)
    return true
end