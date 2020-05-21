# M2-Quest-StartGame
Receive items the first time you log in to the server.<br/>
Contains the lua function in C ++ and the quest.<br/>
This function allows you to receive the item and put it on. If you want to use it elsewhere, remember to check if the user has the equipment on.<br/>
<br/>
Settings<br/>
```
local item = {
  ['all'] = {  -- Items for everyone
    {ITEM_ID, COUNT}, -- count OR "EQ" If I give EQ, the item will be put on the character
  },
  [1] = {       -- Warrior
    {ITEM_ID, ITEM_ID},   -- Put on
    {ITEM_ID, ITEM_ID}    -- Equipment
  },
  [2] = {       -- Ninja
    {ITEM_ID, ITEM_ID},   -- Put on
    {ITEM_ID, ITEM_ID}    -- Equipment
  },
  [3] = {       -- Sura
    {ITEM_ID, ITEM_ID},   -- Put on
    {ITEM_ID, ITEM_ID}    -- Equipment
  },
  [4] = {       -- Shaman
    {ITEM_ID, ITEM_ID},   -- Put on
    {ITEM_ID, ITEM_ID}    -- Equipment
  }
}
```
Also you can add<br/>
```
ds.give_qualification()     -- Alchemy
horse.set_level(1)          -- Horse level
pc.set_skill_level(122, 2)  -- Gives 2 combos
pc.set_skill_level(131, 10) -- Summon a horse
horse.ride()
```
Notification<br/>
```
chat("Have a nice game!")
```
