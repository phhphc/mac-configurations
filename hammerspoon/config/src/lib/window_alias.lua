--[[
WindowAlias Module

A utility for managing custom aliases/names for windows in Hammerspoon.
Allows users to assign memorable names to windows and automatically cleans up
aliases when windows are destroyed.
When getting an alias, falls back to the window's title if no custom alias is set. Useful for window management scripts
that need to reference windows by custom names rather than just titles.
--]]

---@class WindowAlias
---@field private aliases table<number, string>
---@field private windowFilter hs.window.filter
local WindowAlias = {}
WindowAlias.__index = WindowAlias

---@return WindowAlias instance
function WindowAlias:new(alias)
    local self = setmetatable({}, WindowAlias)
    self.aliases = {}
    self:watchAndUpdate()
    return self
end

---@param win hs.window
---@return string
function WindowAlias:getAlias(win)
    ---@type number | nil
    local id = win:id()
    return (id and self.aliases[id]) or win:title()
end

---@param win hs.window
function WindowAlias:setAlias(win)
    ---@type number | nil
    local id = win:id()
    if not id then
        return
    end
    ---@type string | nil, string | nil
    local btn, text = hs.dialog.textPrompt("Window Alias", "Enter an alias for this window", "", "OK", "Cancel")
    if btn == "OK" and text ~= "" then
        self.aliases[id] = text
    end
end

---@private
function WindowAlias:watchAndUpdate()
    self.windowFilter = hs.window.filter.new()
    self.windowFilter:subscribe(hs.window.filter.windowDestroyed, function(win)
        ---@type number | nil
        local id = win:id()
        if id and self.aliases[id] then
            self.aliases[id] = nil
        end
    end)
end

function WindowAlias:destroy()
    if self.windowFilter then
        self.windowFilter:unsubscribeAll()
        self.windowFilter = nil
    end
    self.aliases = {}
end

return WindowAlias
