local config = {
  {item = 5906, qntd_max = 1, chance = 10},
  {item = 9942, qntd_max = 2, chance = 25},
  {item = 12575, qntd_max = 10, chance = 40},
  {item = 12396, qntd_max = 10, chance = 40},
  {item = 10142, qntd_max = 1, chance = 5},
}

local msgsucesso = "Opa, que box interessante!"
local check = 0
function onUse(cid, item, fromPos, itemEx, toPos)

  for _, var in pairs(config) do
    if math.random(1, 100) <= var.chance and check <= 5 then
      doPlayerAddItem(cid, var.item, var.qntd_max)
      check = check+1
    end
  end
  check =0
  doRemoveItem(item.uid,1)
  doCreatureSay(cid, msg_sucesso, TALKTYPE_ORANGE_1)
  doSendMagicEffect(getCreaturePosition(cid), 49)
  return true
end