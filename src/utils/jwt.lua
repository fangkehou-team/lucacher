---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zhangke200377.
--- DateTime: 2023/7/28 下午3:24
---

local config = require("utils.config")
local jwt = require("resty.jwt")

local sign = config.get("JWT_SIGN", "abcdabcdabcdabcdabcdabcdabcd")

local _M = {}

function _M.verify(jwt_token)
    return jwt.verify(sign, jwt_token)
end

return _M