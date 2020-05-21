    ALUA(pc_give_and_wear)
    {
        LPCHARACTER ch = CQuestManager::instance().GetCurrentCharacterPtr();

        if (!lua_isstring(L, 1) && !lua_isnumber(L, 1))
        {
            sys_err("QUEST Make item call error : wrong argument");
            lua_pushnumber (L, 0);
            return 1;
        }

        DWORD dwVnum;

        if (lua_isnumber(L, 1)) // 번호인경우 번호로 준다.
        {
            dwVnum = (int) lua_tonumber(L, 1);
        }
        else if (!ITEM_MANAGER::instance().GetVnum(lua_tostring(L, 1), dwVnum))
        {
            sys_err("QUEST Make item call error : wrong item name : %s", lua_tostring(L,1));
            lua_pushnumber (L, 0);

            return 1;
        }

        sys_log(0, "QUEST [REWARD] item %s to %s", lua_tostring(L, 1), ch->GetName());

        PC* pPC = CQuestManager::instance().GetCurrentPC();

        LogManager::instance().QuestRewardLog(pPC->GetCurrentQuestName().c_str(), ch->GetPlayerID(), ch->GetLevel(), dwVnum, 1);

        LPITEM item = ITEM_MANAGER::instance().CreateItem(dwVnum);
        equipItem(ch, item);

        return 1;
    }