---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zhangke200377.
--- DateTime: 2023/7/31 下午9:51
---

local configs = require("config")

local _M = {}

function _M.get(key, default_value)
    return configs[key] or default_value
end

return _M