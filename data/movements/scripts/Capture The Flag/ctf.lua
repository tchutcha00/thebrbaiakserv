local e = require('data/funevents/ctf/lib')

if e then
    function onStepIn(player, item, position, fromPosition)
        if item.actionid == 33838 then
            doTeleportThing(player, fromPosition)
        elseif item.actionid == 33839 then
            e:onLeave(player)
        elseif item.actionid == 33840 then
            if not e:onJoin(player) then
                doTeleportThing(player, fromPosition)
            end
        else
            if item.actionid == 33841 or item.actionid == 33842 then
                if e:eventState() ~= CTF_STATE_GAME or item.actionid ~= (33840 + e:playerTeam(player)) or not e:withFlag(player) then
                    return true
                end
                
                e:goal(player)
            end
        end

        return true
    end

end
