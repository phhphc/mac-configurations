--[[
WindowAlias Module

A utility for managing custom aliases/names for windows in Hammerspoon.
Allows users to assign memorable names to windows and automatically cleans up
aliases when windows are destroyed.
When getting an alias, falls back to the window's title if no custom alias is set. Useful for window management scripts
that need to reference windows by custom names rather than just titles.
--]]

-- TODO: filter out closed window when restore alias

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
    self:restoreAliases()
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
    if not id then return end
    ---@type string | nil, string | nil
    local btn, text = hs.dialog.textPrompt("Window Alias", "Enter an alias for this window", "", "OK", "Cancel")
    if btn == "OK" and text ~= "" then self.aliases[id] = text end
end

---@private
function WindowAlias:watchAndUpdate()
    self.windowFilter = hs.window.filter.new()
    self.windowFilter:subscribe(hs.window.filter.windowDestroyed, function(win)
        ---@type number | nil
        local id = win:id()
        if id and self.aliases[id] then self.aliases[id] = nil end
    end)
end

-- function WindowAlias:destroy()
--     if self.windowFilter then
--         self.windowFilter:unsubscribeAll()
--         self.windowFilter = nil
--     end
--     self.aliases = {}
-- end

function WindowAlias:backupAliases()
    local dataDir = hs.configdir .. "/data"
    local backupFile = dataDir .. "/window_alias.json"

    -- Create data directory if it doesn't exist
    hs.fs.mkdir(dataDir)

    print("backup window alias to: " .. backupFile)
    print("inspected alias: " .. hs.inspect(self.aliases))

    -- Always use cleaned version since JSON requires string keys
    local cleanAliases = {}
    for id, alias in pairs(self.aliases) do
        if type(id) == "number" and type(alias) == "string" then cleanAliases[tostring(id)] = alias end
    end

    local str = hs.json.encode(cleanAliases)
    if str then
        print("backup window alias string: " .. str)
        local file = io.open(backupFile, "w")
        if file then
            file:write(str)
            file:close()
            print "backup successful"
        else
            print "failed to open file for writing"
        end
    else
        print "failed to encode aliases as JSON - this shouldn't happen with cleaned data"
    end
end

function WindowAlias:restoreAliases()
    local dataDir = hs.configdir .. "/data"
    local backupFile = dataDir .. "/window_alias.json"

    print("attempting to restore aliases from: " .. backupFile)

    local file = io.open(backupFile, "r")
    if not file then
        print "no backup file found, starting with empty aliases"
        return
    end

    local content = file:read "*all"
    file:close()

    if not content or content == "" then
        print "backup file is empty"
        return
    end

    local cleanAliases = hs.json.decode(content)
    if not cleanAliases then
        print "failed to decode JSON from backup file"
        return
    end

    print("decoded aliases: " .. hs.inspect(cleanAliases))

    -- Convert string keys back to numeric keys
    self.aliases = {}
    for idStr, alias in pairs(cleanAliases) do
        local id = tonumber(idStr)
        if id and type(alias) == "string" then self.aliases[id] = alias end
    end

    print("restored aliases: " .. hs.inspect(self.aliases))
end

return WindowAlias
