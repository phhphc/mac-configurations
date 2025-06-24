-- OneAlert - A Hammerspoon Alert Manager
--
-- This module provides a wrapper around Hammerspoon's hs.alert functionality that ensures
-- only one alert is displayed at a time. When a new alert is shown, any existing alert
-- is automatically closed first.
--
-- This is useful for creating clean, non-overlapping notifications in your Hammerspoon
-- configuration without having to manually manage alert lifecycles.

---@class OneAlert
---@field private uuid string | nil The UUID of the currently displayed alert (if any)
---@field private style table | nil The alert styling options to apply
local OneAlert = {}
OneAlert.__index = OneAlert


---@param style table | nil Optional styling options for the alert.
---@return OneAlert instance A new OneAlert instance
function OneAlert:new(style)
    local self = setmetatable({}, OneAlert)
    self.uuid = nil
    self.style = style
    return self
end

---@param str string The text to display in the alert
---@param second number | nil The duration in seconds to display the alert
function OneAlert:show(str, second)
    if self.uuid then
        hs.alert.closeSpecific(self.uuid)
    end
    self.uuid = hs.alert.show(str, self.style, second)
end

function OneAlert:close()
    if self.uuid then
        hs.alert.closeSpecific(self.uuid)
    end
end

return OneAlert
