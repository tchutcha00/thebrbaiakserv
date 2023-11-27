local cfg = {

  ["black demon"] = {topos = {x = 1380, y = 885, z = 14}, createpos = {x = 1336, y = 796, z = 14}},
  ["death shooter"] = {topos = {x = 1219, y = 792, z = 15}, createpos = {x = 1424, y = 902, z = 15}},
  ["infernatil maximus attack"] = {topos = {x = 3243, y = 238, z = 14}, createpos = {x = 3086, y = 40, z = 11}},
  ["fire elemental maximus"] = {topos = {x = 3433, y = 185, z = 9}, createpos = {x = 3272, y = 46, z = 13}},
  ["the headsplitter"] = {topos = {x = 4007, y = 964, z = 12}, createpos = {x = 3979, y = 959, z = 12}},
  ["the energy boss"] = {topos = {x = 1793, y = 1243, z = 14}, createpos = {x = 1835, y = 39, z = 15}},
  ["the fire boss"] = {topos = {x = 1803, y = 1376, z = 14}, createpos = {x = 1785, y = 1249, z = 14}},
  ["mega fire boss"] = {topos = {x = 1651, y = 1900, z = 15}, createpos = {x = 1696, y = 2035, z = 14}},
  ["the death boss"] = {topos = {x = 1720, y = 1367, z = 15}, createpos = {x = 1719, y = 1375, z = 15}},
  ["pandora"] = {topos = {x = 3657, y = 183, z = 15}, createpos = {x = 3606, y = 154, z = 15}},
  ["big boss"] = {topos = {x = 4188, y = 31, z = 15}, createpos = {x = 4115, y = 142, z = 15}},
  ["kurwa"] = {topos = {x = 1867, y = 2035, z = 15}, createpos = {x = 2573, y = 3631, z = 7}},
  ["hellish ghalapago"] = {topos = {x = 3775, y = 2635, z = 7}, createpos = {x = 3781, y = 2615, z = 7}},
  ["frozen vengeful boss"] = {topos = {x = 3779, y = 3460, z = 5}, createpos = {x = 3709, y = 3222, z = 5}},
  ["stonecracker"] = {topos = {x = 2382, y = 2645, z = 15}, createpos = {x = 2671, y = 2521, z = 15}},
  ["pandora"] = {topos = {x = 2553, y = 2452, z = 15}, createpos = {x = 2526, y = 2455, z = 15}},
  ["infernatil maximus attack"] = {topos = {x = 2596, y = 3260, z = 6}, createpos = {x = 2504, y = 3084, z = 3}},
  ["fire elemental maximus"] = {topos = {x = 2644, y = 3173, z = 7}, createpos = {x = 2625, y = 3068, z = 5}},
  ["frozen dragon"] = {topos = {x = 5391, y = 29989, z = 7}, createpos = {x = 5558, y = 30085, z = 7}},
}

local function removeTeleport(pos)

  local tp = getTileItemById(pos,1387)

  if tp and tp.uid > 0 then
    doRemoveItem(tp.uid)
  end
end

function onDeath(cid, corpse, deathList)

  local nme = getCreatureName(cid):lower()

  if nme == "nether spook" or nme == "nether spawn" then
    local other = nme == "nether spook" and "nether spawn" or "nether spook"
    if getCreatureByName(other) then
      doCreatureSay(cid, "Vocês ainda devem derrotar "..other.." para prosseguir!", TALKTYPE_ORANGE_1)
    else
      doCreateTeleport(1387, {x = 1720, y = 1839, z = 15}, {x = 1722, y = 1801, z = 15})
      addEvent(removeTeleport,60000,{x = 1722, y = 1801, z = 15})
      doCreatureSay(cid,"O teleport abriu e vai sumir em 1 minuto",TALKTYPE_ORANGE_1)
    end
    return true
  end

  if cfg[nme] then
    doCreateTeleport(1387,cfg[nme].topos, cfg[nme].createpos)
    addEvent(removeTeleport,60000,cfg[nme].createpos)
    doCreatureSay(cid,"O teleport abriu e vai sumir em 1 minuto",TALKTYPE_ORANGE_1)
  end

  return true
end