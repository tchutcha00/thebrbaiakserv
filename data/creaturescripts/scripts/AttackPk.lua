require('data/funevents/ctf/lib')
require('data/funevents/battlefield/lib')

function onAttack(cid, target)
    if CTF:playerState(cid) == 1 or battlefield:playerState(cid) == 1 then
        return true
    end
    
    if ((isPlayer(cid) and isPlayer(target) and getPlayerSkullType(target) > 2)) then 
       doPlayerSetPzLocked(cid, true)
    end
    return true
end