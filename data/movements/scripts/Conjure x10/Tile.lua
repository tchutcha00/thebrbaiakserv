local config = {
    time = 5,
    toPos = {x = 115, y = 80, z = 7},
	tilePosition = {x = 118, y = 86, z = 7}
}

local function countdown(cid)
    local n = 0

    local function decrease()
        if not isPlayer(cid) or not doComparePositions(getThingPos(cid), config.tilePosition) then
            return
        end

        local time = config.time - n
        if time > 0 then
            n = n + 1
			
			addEvent(decrease, 1000)
        else
            doTeleportThing(cid, config.toPos)
        end
    end

    decrease()
end

function onStepIn(cid)
    countdown(cid)
    return true
end