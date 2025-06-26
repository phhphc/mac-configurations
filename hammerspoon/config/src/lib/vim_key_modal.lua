local M = {}

---@alias KeyNode {[string]: fun()|KeyNode}

local modal = hs.hotkey.modal.new("cmd", "f16")
modal:bind("", "escape", function() modal:exit() end)


local prefixMap = require("src.lib.prefix_map"):new()

M.target = prefixMap

---@type number | nil
local alertId = nil

function modal:entered()
    alertId = hs.alert.show("vim key modal entered", "indefinite")
end

function modal:exited()
    prefixMap:clearPrefix()
    if alertId then
        hs.alert.closeSpecific(alertId)
        alertId = nil
    end
end

local keys = "abcdefghijklmnopqrstuvwxyz0123456789"
for i = 1, #keys do
    local key = keys:sub(i, i)
    modal:bind("", key, function()
        prefixMap:extendPrefix(key)
        local count = prefixMap:countMatches()
        if count > 1 then return end
        if count == 1 then
            local matches = prefixMap:getMatches()
            for _, match in ipairs(matches) do
                match.value()
            end
        end
        modal:exit()
    end)
end

return M
