local storagedodge = 92798645 -- storage do dodge
local cor = 35 -- cor do texto
local effect = 31 -- id do magic effect
local msg = "DODGE" -- msg

local dodge = {
  {min = 1, max = 10, chance = 2},
  {min = 11, max = 20, chance = 3},
  {min = 21, max = 40, chance = 5},
  {min = 41, max = 50, chance = 10},
  {min = 51, max = 70, chance = 15},
  {min = 71, max = 90, chance = 16},
  {min = 91, max = 120, chance = 17},
  {min = 121, max = 130, chance = 18},
  {min = 131, max = 150, chance = 19},
  {min = 151, max = 160, chance = 20},
  {min = 161, max = 180, chance = 21},
  {min = 181, max = 190, chance = 22},
  {min = 191, max = 210, chance = 23},
  {min = 211, max = 220, chance = 24},
  {min = 221, max = 240, chance = 25},
  {min = 241, max = 250, chance = 26},
  {min = 251, max = 270, chance = 27},
  {min = 271, max = 280, chance = 28},
  {min = 281, max = 290, chance = 29},
  {min = 291, max = 300, chance = 30},
  {min = 301, max = 320, chance = 31},
  {min = 321, max = 340, chance = 32},
  {min = 341, max = 360, chance = 33},
  {min = 361, max = 370, chance = 34},
  {min = 371, max = 390, chance = 35},
  {min = 391, max = 400, chance = 36},
  {min = 401, max = 420, chance = 37},
  {min = 421, max = 430, chance = 38},
  {min = 431, max = 450, chance = 39},
  {min = 451, max = 460, chance = 40},
  {min = 461, max = 480, chance = 41},
  {min = 481, max = 490, chance = 42},
  {min = 491, max = 499, chance = 43},
  {min = 500, max = math.huge, chance = 45}


}

function onStatsChange(cid, attacker, type, combat, value)
  if not isPlayer(cid) then
    return false
  end
  if combat == COMBAT_HEALING then return true end
  local sto_doge = tonumber(getPlayerStorageValue(cid, storagedodge))
  if sto_doge and sto_doge >= 1 then
    if getCreatureStorage(cid,722641) == 1 then
      sto_doge = tonumber(sto_doge + 10)
    end
    local chance = (sto_doge/6) >= 1 and math.ceil(sto_doge / 6) or 1
    local random = math.random(1, 500)
    if random <= chance then
      local cid_pos = getCreaturePosition(cid)
      doSendMagicEffect(cid_pos, effect)
      doSendAnimatedText(cid_pos, msg, cor)
      return false
    end
  end

  if getCreatureStorage(cid, 722641) == 1 then
    value = value - (value * 0.02)
    return true
  end
  return true
end