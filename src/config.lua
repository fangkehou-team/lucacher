---
--- lucacher配置文件
--- Created by zhangke200377.
--- DateTime: 2023/7/27 下午8:59
---

local _M = {}

--- Redis相关配置

--- Redis服务地址（不带端口号）
_M.REDIS_URL = "localhost"

_M.REDIS_PORT = 6847

--- Redis用户名（如果有）
-- _M.REDIS_USERNAME = ""

--- Redis密码（如果有）
-- _M.REDIS_PASSWORD = ""

--- 鉴权函数，用于判断是否放行请求，仅在路由规则中设置auth为true
-- _M.AUTH_METHOD = function() return true end

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
            enable = true,

            --- 缓存时间，单位为秒
            expire = 20 * 60,

            --- 无效响应缓存时间，单位为秒
            neg_expire = 5,
            
            --- 验证是否进行缓存（API返回是否正常）函数
            validate = function(response_content)
                return true
            end
        },
        auth = {
            --- 是否启用该功能
            enable = false,

            --- 本路由独立鉴权函数
            method = function()
                return false
            end
        },
    },
    {
        pattern = "/user/login",
        cache = false,
        auth = false,
    },
}

--- JWT签名使用密钥，默认值为abcdabcdabcdabcdabcdabcdabcd
-- _M.JWT_SIGN = "abcdabcdabcdabcdabcdabcdabcd"

--- L1缓存空间名称（无需求默认即可）
-- _M.CACHE_KEY = "lucacher_cache"

--- L2缓存字典名称（无需求默认即可）
-- _M.CACHE_DICT = "lucacher_cache_dict"

--- 缓存锁字典名称（无需求默认即可）
-- _M.CACHE_LOCK_DICT = "lucacher_cache_lock_dict"

--- 缓存前缀（无需求默认即可）
-- _M.CACHE_HEAD = "lucacher"

--- 默认缓存时间（单位为秒）
-- _M.CACHE_EXPIRE = 2 * 60

--- 无效响应缓存时间（单位为秒）
-- _M.CACHE_NEG_EXPIRE = 5

--- 默认缓存验证函数（单位为秒）
-- _M.CACHE_VALIDATE_METHOD = function(response_content) return true end

return _M