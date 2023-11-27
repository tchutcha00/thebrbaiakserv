function onSay(cid, words, param)
  if param == "" then
    doPlayerPopupFYI(cid, "~~## Healing Spells ##~~\n\nMages - Mana Rune\nPally - Exura Gran San/Mana Rune\nKina - Exura Gran Ico\nTodos - Fusion Buff (+skill)\n\n~~## Fusion Spells ##~~\n\nDruid - Fusion Druid\nSorc - Fusion Sorc\nPally- Fusion Pally\nKina - Fusion Kina\n\n## Spells 5 Reset+ ##\n\nMages - Ultimate Druid\nPally - Ultimate Pally\nKina - Ultimate Kina\n\n## Spells 10 Reset+(Target) ##\n\nMages - Exori Mas Frigo\nPally - Exori Gran Con\nKina - Exori Mas Gran\n\n##Spells 15 Reset+ ##\n\nMages - Super Fusion Druid\nPally - Super Fusion Pally\nKina - Super Fusion Kina")
 if param == "" then
    doPlayerPopupFYI(cid, "## Spells 20 Reset+ ##\n\nMages - Supreme Druid\nPally - Supreme Pally\nKina - Supreme Kina\n\n~~## Spells 25 Reset+ ##~~\n\nDruid - Song Druid\nSorc - Song Sorc\nPally - Song Pally\nKina - Song Kina\n\n## Spells 30 Reset+ ## (Quest)\n\nDruid - Exori Max Frigo\nSorc - Exori Max Flam\nPally - Exori Max Con\nKina - Exori Max Hur\n\n## Spells 35 Reset+ ##\n\nMages - Ultra Druid\nPally - Ultra Pally\nKina - Ultra Kina\n\n## Spells 40 Reset+(Target) ##\nMages - Strong Druid Attack\nPally - Strong Pally Attack\nKina - Strong Kina Attack")
     if param == "" then
    doPlayerPopupFYI(cid, "## Spells 45 Reset+ ##\n\nMages - Mega Druid Attack\nPally - Mega Pally Attack\nKina - Mega Kina Attack")
  end
 end
  return true
 end
end