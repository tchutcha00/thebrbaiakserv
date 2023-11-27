function onSay(cid, words, param)

        if(not checkExhausted(cid, 666, 5)) then
        return true
    end

if(words == "!myinfo") then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "# CHARACTER INFOS\n- Level:["..getPlayerLevel(cid).."]\n- Resets: ["..getPlayerResets(cid).."]\n- Life:[" .. getCreatureHealth(cid) .. "/" .. getCreatureMaxHealth(cid) .. "]\n- Mana:[" .. getCreatureMana(cid) .. "/" .. getCreatureMaxMana(cid) .. "]\n** Para saber o tempo ativo das suas potions digite: !potioninfo **\n** Para saber sobre Dodge e Critical, digite: !dodge ou !critical **")
    return true
elseif(words == "!life") then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "# CHARACTER INFOS\n- Level:["..getPlayerLevel(cid).."]\n- Resets: ["..getPlayerResets(cid).."]\n- Life:[" .. getCreatureHealth(cid) .. "/" .. getCreatureMaxHealth(cid) .. "]\n- Mana:[" .. getCreatureMana(cid) .. "/" .. getCreatureMaxMana(cid) .. "]\n** Para saber o tempo ativo das suas potions digite: !potioninfo **\n** Para saber sobre Dodge e Critical, digite: !dodge ou !critical **")
    return true
elseif(words == "!mana") then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "# CHARACTER INFOS\n- Level:["..getPlayerLevel(cid).."]\n- Resets: ["..getPlayerResets(cid).."]\n- Life:[" .. getCreatureHealth(cid) .. "/" .. getCreatureMaxHealth(cid) .. "]\n- Mana:[" .. getCreatureMana(cid) .. "/" .. getCreatureMaxMana(cid) .. "]\n** Para saber o tempo ativo das suas potions digite: !potioninfo **\n** Para saber sobre Dodge e Critical, digite: !dodge ou !critical **")
    return true
elseif(words == "!mymp") then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "# CHARACTER INFOS\n- Level:["..getPlayerLevel(cid).."]\n- Resets: ["..getPlayerResets(cid).."]\n- Life:[" .. getCreatureHealth(cid) .. "/" .. getCreatureMaxHealth(cid) .. "]\n- Mana:[" .. getCreatureMana(cid) .. "/" .. getCreatureMaxMana(cid) .. "]\n** Para saber o tempo ativo das suas potions digite: !potioninfo **\n** Para saber sobre Dodge e Critical, digite: !dodge ou !critical **")
    return true
elseif(words == "!myhp") then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "# CHARACTER INFOS\n- Level:["..getPlayerLevel(cid).."]\n- Resets: ["..getPlayerResets(cid).."]\n- Life:[" .. getCreatureHealth(cid) .. "/" .. getCreatureMaxHealth(cid) .. "]\n- Mana:[" .. getCreatureMana(cid) .. "/" .. getCreatureMaxMana(cid) .. "]\n** Para saber o tempo ativo das suas potions digite: !potioninfo **\n** Para saber sobre Dodge e Critical, digite: !dodge ou !critical **")
    return true
elseif(words == "!status") then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "# CHARACTER INFOS\n- Level:["..getPlayerLevel(cid).."]\n- Resets: ["..getPlayerResets(cid).."]\n- Life:[" .. getCreatureHealth(cid) .. "/" .. getCreatureMaxHealth(cid) .. "]\n- Mana:[" .. getCreatureMana(cid) .. "/" .. getCreatureMaxMana(cid) .. "]\n** Para saber o tempo ativo das suas potions digite: !potioninfo **\n** Para saber sobre Dodge e Critical, digite: !dodge ou !critical **")
    return true
end
end
