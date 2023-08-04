package = "lucacher"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/fangkehou-team/lucacher.git"
}
description = {
   homepage = "https://github.com/fangkehou-team/lucacher",
   license = "Apache License Version 2"
}
build = {
   type = "builtin",
   modules = {
      config = "src/config.lua",
      ["utils.jwt"] = "src/utils/jwt.lua",
      ["utils.redis"] = "src/utils/redis.lua"
   }
}
