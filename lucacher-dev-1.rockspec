package = "lucacher"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/fangkehou-team/lucacher.git"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      after_response = "src/after_response.lua",
      before_request = "src/before_request.lua",
      config = "src/config.lua",
      ["utils.cache"] = "src/utils/cache.lua",
      ["utils.config"] = "src/utils/config.lua",
      ["utils.jwt"] = "src/utils/jwt.lua",
      ["utils.redis"] = "src/utils/redis.lua",
      ["utils.request"] = "src/utils/request.lua",
      ["utils.route"] = "src/utils/route.lua"
   }
}
