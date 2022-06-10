-- CONSTANTS
aura_env.assignmentMarkerMap = {
    "{rt1}", "{rt2}", "{rt3}", "{rt4}", "{rt5}", "{rt6}", "{rt7}"
}
aura_env.maxPerBatch = 2

-- UTIL
aura_env.getLength = function(arr) return table.getn(arr) end

aura_env.resetTormentBatches = function()
    aura_env.tormentBatches = {
        {}, -- 1
        {}, -- 2
        {}, -- 3
        {}, -- 4
        {} -- 5
    }

    aura_env.currentBatchNumber = 1
end

-- INIT
aura_env.resetTormentBatches()
