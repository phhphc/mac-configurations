local M = {}

---@type fun()[]
local callbacks = {}

hs.shutdownCallback = function()
    for _, cb in ipairs(callbacks) do
        cb()
    end
end

---@param cb fun()
function M.addShutdownCallback(cb)
    table.insert(callbacks, cb)
end

return M
