function (allstates, event, ...)
    local tormentDebuffId = 362401

    -- local tormentDebuffId = 101643 -- Transcendence - Monk TEST

    if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
        local _, subEvent, _, _, sourceName, _, _, destGUID, destName, _, _,
              spellID = ...

        if (subEvent == "SPELL_AURA_APPLIED" and spellID == tormentDebuffId) then
            if (not aura_env.tormentBatches) then
                aura_env.resetTormentBatches()
            end

            local curBatchNumber = aura_env.currentBatchNumber
            local curBatch = aura_env.tormentBatches[curBatchNumber] or {}

            table.insert(curBatch, destName)
            aura_env.tormentBatches[curBatchNumber] = curBatch

            local isBatchFull = aura_env.getLength(curBatch) >=
                                    aura_env.maxPerBatch

            if (isBatchFull) then
                aura_env.currentBatchNumber = curBatchNumber + 1
            end

            if (UnitIsUnit(destName, "player")) then
                allstates[destName] = {
                    show = true,
                    changed = true,
                    assignmentMarker = aura_env.assignmentMarkerMap[curBatchNumber],
                    assignmentBatch = curBatchNumber
                }
                return true
            end

        elseif (subEvent == "SPELL_AURA_REMOVED" and spellID == tormentDebuffId) then
            aura_env.resetTormentBatches()

            if (UnitIsUnit(destName, "player")) then
                allstates[destName] = {show = false, changed = true}
                return true
            end
        end
    end
end
