local lvlcrit = 42904
local multiplier = 2.1
local effect = 1

local function negativo(value)
  if value > 0 then
    value = 0 - value
  end
  return value
end

local function positivo(value)
  if value < 0 then
    value = -value
  end
  return value
end

function onCombat(cid, target)
  if getPlayerStorageValue(cid, CRITICAL_STORAGE) == 1 then
    setPlayerStorageValue(cid, CRITICAL_STORAGE, 2)
  end
  if getPlayerStorageValue(cid, CRITICAL_STORAGE_DOIS) == 1 then
    setPlayerStorageValue(cid, CRITICAL_STORAGE_DOIS, 2)
  end
  return true
end


function onStatsChange(cid, attacker, type, combat, value)
  local bonusAttack = 25000
  if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isPlayer(attacker) and isPlayer(cid) then
    if getPlayerStorageValue(attacker, CRITICAL_STORAGE) <= 0 or getPlayerStorageValue(attacker, CRITICAL_STORAGE_DOIS) <= 0 then
      if getPlayerStorageValue(attacker, 201234) > os.time() then
        if getCreatureMana(cid) > bonusAttack and (getCreatureCondition(cid,CONDITION_MANASHIELD) or getPlayerSlotItem(cid,CONST_SLOT_RING).itemid == 2204) then
          doSendAnimatedText(getCreaturePos(cid),positivo(bonusAttack),89)
          doCreatureAddMana(cid,-(bonusAttack))
          doPlayerSendTextMessage(attacker,MESSAGE_EVENT_DEFAULT,getCreatureName(cid).." loses "..positivo(bonusAttack).." mana due to your bonus attack.")
        else
          doSendAnimatedText(getCreaturePos(cid),positivo(bonusAttack),180)
          doCreatureAddHealth(cid,-(bonusAttack))
          doPlayerSendTextMessage(cid,MESSAGE_EVENT_DEFAULT,"You lose "..positivo(bonusAttack).." hitpoints due to an bonus attack by "..getCreatureName(attacker))
          doPlayerSendTextMessage(attacker,MESSAGE_EVENT_DEFAULT,getCreatureName(cid).." loses "..positivo(bonusAttack).." hitpoints due to your bonus attack.")
        end
      end
    end
  end
  if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isPlayer(attacker) and isPlayer(cid) then
    if combat == COMBAT_PHYSICALDAMAGE or getPlayerStorageValue(attacker, CRITICAL_STORAGE) == 2 or getPlayerStorageValue(attacker, CRITICAL_STORAGE_DOIS) == 2 then
      setPlayerStorageValue(attacker, CRITICAL_STORAGE, 0)
      setPlayerStorageValue(attacker, CRITICAL_STORAGE_DOIS, 0)
      local mult = 1
      if level then
        mult = mult + (0.03 * level)
      end
      local sto_cd = tonumber(getPlayerStorageValue(attacker,722360))
      local sto_crit = tonumber(getPlayerStorageValue(attacker,lvlcrit))
      if sto_cd and sto_cd < os.time() then
        if sto_crit and (sto_crit*3) >= math.random (0,10000) then
          mult = mult + (multiplier - 1)
          doSendAnimatedText(getCreaturePos(attacker), "CRITICAL!", 180)
          doSendMagicEffect(getCreaturePosition(cid), effect)
        end
      end
        if mult > 1 then
          local dano = math.ceil(negativo(value)*(mult))
          if isPlayer(cid) then
            if getCreatureMana(cid) > positivo(dano) and (getCreatureCondition(cid,CONDITION_MANASHIELD) or getPlayerSlotItem(cid,CONST_SLOT_RING).itemid == 2204) then
              doCreatureAddMana(cid,dano)
              doPlayerSendTextMessage(attacker,MESSAGE_EVENT_DEFAULT,getCreatureName(cid).." loses "..positivo(dano).." mana due to your attack.")
            else
              doSendAnimatedText(getCreaturePos(cid),positivo(dano),109)
              doCreatureAddHealth(cid,dano)
              doPlayerSendTextMessage(cid,MESSAGE_EVENT_DEFAULT,"You lose "..positivo(dano).." hitpoints due to an attack by "..getCreatureName(attacker))
              doPlayerSendTextMessage(attacker,MESSAGE_EVENT_DEFAULT,getCreatureName(cid).." loses "..positivo(dano).." hitpoints due to your attack.")
            end
            return false
          end
        end
    end
  end
  return true
end
