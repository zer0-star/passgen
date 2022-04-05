# Package

version       = "0.1.0"
author        = "zer0-star"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["passgen"]

backend       = "c"

# Dependencies

requires "nim >= 1.0.0"
requires "cligen"
