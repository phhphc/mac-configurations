
---@class CharKeyGenerator
local M = {}

---@alias Character string A single character (a-z, A-Z)

---@class KeyAssignment
---@field char Character The assigned character key
---@field text string The original text this character represents

-- Priority order for character assignment (more common letters first)
local CHAR_PRIORITY = {
    'a', 'e', 'i', 'o', 'u', 's', 'n', 'r', 't', 'l', 'c', 'd', 'p', 'm', 'h', 'g', 'b', 'f', 'y', 'w', 'k', 'v', 'x', 'z', 'j', 'q',
    'A', 'E', 'I', 'O', 'U', 'S', 'N', 'R', 'T', 'L', 'C', 'D', 'P', 'M', 'H', 'G', 'B', 'F', 'Y', 'W', 'K', 'V', 'X', 'Z', 'J', 'Q'
}

---Generate a stable hash for a string to ensure consistent character assignment
---@param text string
---@return number
local function hash_string(text)
    local hash = 0
    for i = 1, #text do
        hash = (hash * 31 + string.byte(text, i)) % 2147483647
    end
    return hash
end

---Extract preferred characters from text (first letter, then vowels, then consonants)
---@param text string
---@return string[] array of preferred characters in order
local function get_preferred_chars(text)
    local preferred = {}
    local seen = {}
    
    -- First, try the first character
    local first_char = text:sub(1, 1):lower()
    if first_char:match('[a-z]') and not seen[first_char] then
        table.insert(preferred, first_char)
        seen[first_char] = true
    end
    
    -- Then, collect all alphabetic characters
    for char in text:lower():gmatch('[a-z]') do
        if not seen[char] then
            table.insert(preferred, char)
            seen[char] = true
        end
    end
    
    return preferred
end

---Assigns unique character keys to an array of strings
---Uses a stable algorithm that prioritizes:
---1. First letter of each string
---2. Common letters from the string content
---3. Fallback to unused letters in frequency order
---@param texts string[] Array of input strings
---@return KeyAssignment[] Array of character assignments
function M.assignUniqueKeys(texts)
    if not texts or #texts == 0 then
        return {}
    end
    
    -- Create a stable sorted order based on string hash for consistent results
    local indexed_texts = {}
    for i, text in ipairs(texts) do
        table.insert(indexed_texts, {
            index = i,
            text = text,
            hash = hash_string(text),
            preferred_chars = get_preferred_chars(text)
        })
    end
    
    -- Sort by hash for stable ordering
    table.sort(indexed_texts, function(a, b)
        return a.hash < b.hash
    end)
    
    local used_chars = {}
    local assignments = {}
    
    -- First pass: try to assign preferred characters
    for _, item in ipairs(indexed_texts) do
        local assigned_char = nil
        
        -- Try preferred characters from the text
        for _, char in ipairs(item.preferred_chars) do
            if not used_chars[char] and not used_chars[char:upper()] then
                assigned_char = char
                break
            end
        end
        
        -- If no preferred char available, we'll assign in second pass
        if assigned_char then
            used_chars[assigned_char] = true
            assignments[item.index] = {
                char = assigned_char,
                text = item.text
            }
        else
            assignments[item.index] = {
                char = nil,  -- Will be assigned in second pass
                text = item.text
            }
        end
    end
    
    -- Second pass: assign remaining characters from priority list
    local char_index = 1
    for i = 1, #texts do
        if not assignments[i].char then
            -- Find next available character
            while char_index <= #CHAR_PRIORITY do
                local char = CHAR_PRIORITY[char_index]
                char_index = char_index + 1
                
                if not used_chars[char] then
                    used_chars[char] = true
                    assignments[i].char = char
                    break
                end
            end
            
            -- Fallback if we run out of characters (shouldn't happen with 52 chars)
            if not assignments[i].char then
                assignments[i].char = tostring(i)  -- Use number as fallback
            end
        end
    end
    
    return assignments
end

---Legacy function name for backward compatibility
---@param texts string[]
---@return KeyAssignment[]
function M.getChars(texts)
    return M.assignUniqueKeys(texts)
end

return M
