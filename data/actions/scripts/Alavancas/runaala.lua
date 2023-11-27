function onUse(cid, item, fromPosition, itemEx, toPosition)

local configs = {

    [8877] = {itemid = 8978, cost = 1000000000},
    [8883] = {itemid = 5468, cost = 40000000},
    [8884] = {itemid = 12396, cost = 100000000},
    [8885] = {itemid = 12575, cost = 100000000},
    [8886] = {itemid = 7489, cost = 200000000},
    [8887] = {itemid = 6542, cost = 150000000},
	[8880] = {itemid = 6543, cost = 200000000},
	[8881] = {itemid = 6544, cost = 250000000},
	[8882] = {itemid = 6545, cost = 300000000},
	[8909] = {itemid = 2328, cost = 350000000},
    [8889] = {itemid = 12739, cost = 300000000},
    [8893] = {itemid = 9693, cost = 50000000},
    [8894] = {itemid = 12674, cost = 200000000},
    [8895] = {itemid = 12678, cost = 200000000},
    [8896] = {itemid = 12676, cost = 200000000},
    [8897] = {itemid = 12675, cost = 200000000},
    [8898] = {itemid = 12677, cost = 200000000},

    -- Legendary Set
    [8899] = {itemid = 12681, cost = 100000000},
    [8900] = {itemid = 12682, cost = 100000000},
    [8901] = {itemid = 12683, cost = 100000000},
    [8902] = {itemid = 12679, cost = 100000000},
    [8903] = {itemid = 12672, cost = 100000000},
    [8904] = {itemid = 2122, cost = 100000000},
	[8906] = {itemid = 12601, cost = 150000000},
	[8907] = {itemid = 12372, cost = 150000000},
	[8908] = {itemid = 8305, cost = 100000000},
    [8905] = {itemid = 12289, cost = 1000000000}

    
}

local coinid = 9971

    if configs[item.actionid] then
            if doPlayerRemoveMoney(cid, configs[item.actionid].cost) then
                doPlayerAddItem(cid, configs[item.actionid].itemid)
                doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
                doSendAnimatedText(fromPosition, "(R$)", TEXTCOLOR_RED)
            else
                doCreatureSay(cid, "[Atenção]: Você não tem dinheiro suficiente!", TALKTYPE_ORANGE_1)
            end
        else
            return doPlayerSendCancel(cid, "You need " .. math.ceil((getItemCap(configs[item.actionid].itemid, configs[item.actionid].quantperslot)*20)+getItemCap(configs[item.actionid].backpackid)) .. " cap for buy that.")
        end
	return true
end
