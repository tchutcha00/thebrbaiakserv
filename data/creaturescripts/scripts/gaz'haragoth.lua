local running = false
function onThink(cid)
local hp = (getCreatureHealth(cid)/getCreatureMaxHealth(cid))*100
    if (hp < 12.5 and not running) then
    doCreatureSay(cid, "Gaz'haragoth begins to draw on the nightmares to HEAL himself!", TALKTYPE_ORANGE_2)
    running = true
    addEvent(Uheal, 20000, cid)
    end
    end 

function Uheal(cid)
    running = false
    doCreatureAddHealth(cid, 9900000000)
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
    doCreatureSay(cid, "Gaz'haragoth HEALS himself!", TALKTYPE_ORANGE_2)
    return true
end