---@class PrefixMap
---@field private data table<string, fun()>
---@field private searchPrefix string
local PrefixMap = {}
PrefixMap.__index = PrefixMap

---@return PrefixMap
function PrefixMap:new()
    local obj = {
        data = {},        -- stores key-value pairs
        searchPrefix = "" -- current search prefix, starts as empty string
    }
    setmetatable(obj, self)
    return obj
end

---@param key string
---@param value fun()
---@return boolean true if added, false if key already exists
function PrefixMap:add(key, value)
    if self.data[key] ~= nil then
        return false -- key already exists
    end
    self.data[key] = value
    return true
end

---@param key string
---@return boolean true if removed, false if key does not exist
function PrefixMap:remove(key)
    if self.data[key] == nil then
        return false -- key does not exist
    end
    self.data[key] = nil
    return true
end

---@param prefix string
function PrefixMap:extendPrefix(prefix)
    self.searchPrefix = self.searchPrefix .. prefix
end

function PrefixMap:clearPrefix()
    self.searchPrefix = ""
end

---@return number
function PrefixMap:countMatches()
    local count = 0
    local prefixLen = string.len(self.searchPrefix)

    for key, _ in pairs(self.data) do
        -- Check if key starts with the current search prefix
        if string.sub(key, 1, prefixLen) == self.searchPrefix then
            count = count + 1
        end
    end
    return count
end

---@return {key: string, value: fun()}[]
function PrefixMap:getMatches()
    local matches = {}
    local prefixLen = string.len(self.searchPrefix)

    for key, value in pairs(self.data) do
        -- Check if key starts with the current search prefix
        if string.sub(key, 1, prefixLen) == self.searchPrefix then
            table.insert(matches, { key = key, value = value })
        end
    end
    return matches
end

return PrefixMap
