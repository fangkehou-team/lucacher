---
--- lucacher配置文件
--- Created by zhangke200377.
--- DateTime: 2023/7/27 下午8:59
---

local _M = {};

--- Redis相关配置

--- Redis服务地址（带端口号）
_M.REDIS_URL = "";

--- Redis用户名（如果有）
_M.REDIS_USERNAME = "";

--- Redis密码（如果有）
_M.REDIS_PASSWORD = "";

--- 鉴权函数，用于判断是否放行请求，仅在路由规则中设置auth为true
_M.AUTH_METHOD = function()
    return true;
end

--- 路由规则配置
--- 路由规则由一系列的规则组成，在运行时，这些规则从上至下依次匹配，直至某个规则匹配成功或没有匹配的规则。
--- 当没有规则与请求匹配时则直接放行不做任何的缓存或鉴权操作。
--- 规则包含三个部分：pattern表达式本体，cache是否缓存，auth是否鉴权
--- pattern支持正则表达式匹配，也可以是纯字符串，纯字符串则要求完全匹配不能多也不能少。
--- cache 和 auth 均支持两种写法，直接等于boolean或等于一个元表，元表可以用于作具体配置。具体配置请参考PATTERNS中的注释。
_M.URL_PATTERNS = {
    {
        pattern = "/",
        cache = {
            --- 是否启用该功能
            enable = true;

            --- 缓存有效时间，可以带单位，d为天，h为小时，m为分钟，s为秒，不带单位默认为秒
            expire = "10d";
        },
        auth = {
            --- 是否启用该功能
            enable = false;

            ---
            method = function()

            end
        },
    },
    {
        pattern = "/user/login",
        cache = false,
        auth = false,
    },
};

return _M;