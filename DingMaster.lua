local playerName = GetUnitName("player", true) .. "-" .. GetRealmName()

local dingHandler = CreateFrame("Frame")

dingHandler:RegisterEvent("PLAYER_LEVEL_UP")

dingHandler:SetScript("OnEvent", function(self, event)
    SendChatMessage("Ding! Level " .. UnitLevel("player") + 1, "GUILD", nil, nil)
end)

--local guildChatReader = CreateFrame("Frame")

--guildChatReader:RegisterEvent("CHAT_MSG_GUILD")

--guildChatReader:SetScript("OnEvent",function(self, event, message, author)
--    if playerName ~= author and message:find("Ding! Level ") then
--        SendChatMessage("gz!", "GUILD", nil, nil)
--    end
--end)

local whisperChatReader = CreateFrame("Frame")

whisperChatReader:RegisterEvent("CHAT_MSG_WHISPER")

whisperChatReader:SetScript("OnEvent",function(self, event, message, author)
    if message == "%" then
        SendChatMessage("Level "..UnitLevel("player").." "..floor( (UnitXP("player") / UnitXPMax("player"))*100 ).."%.", "WHISPER", nil, author)
    end
end)
