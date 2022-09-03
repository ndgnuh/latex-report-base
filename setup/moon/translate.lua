local lookup = { __title__ = {}}
local m = {}

local function titlecase(s)
    return s:sub(1, 1):upper() .. s:sub(2, #s)
end

m.translate = function(key)
    return lookup[key]
end
m.translate_title = function(key)
    return lookup.__title__[key]
end


m.provide_translation = function(args)
    local key = args.key:lower()
    local value = args.value
    local value_titlecase = args.titlecase or titlecase(value)
    
    lookup[key] = value
    lookup.__title__[key] = value_titlecase
end

return m