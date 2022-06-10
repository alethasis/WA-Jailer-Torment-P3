function()
    if (WeakAuras.IsOptionsOpen()) then
        return "{rt1}"
    elseif (aura_env.state.show) then
        local canSpamAgain = (not aura_env.lastSay or aura_env.lastSay <=
            GetTime() - aura_env.config.chatSpamInterval)
        if (canSpamAgain) then
            aura_env.lastSay = GetTime()
            SendChatMessage(aura_env.state.assignmentMarker, SAY)
        end
        
        return aura_env.state.assignmentMarker
    end
end