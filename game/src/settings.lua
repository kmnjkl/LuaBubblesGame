local colors = require "src/values/colors"

local defaultSettings = {}
defaultSettings.colors = {}
defaultSettings.fonts = {}

defaultSettings.colors.backgroundColor  = colors.white
defaultSettings.colors.textColor        = colors.black

defaultSettings.fonts.button1           = love.graphics.newFont("assets/fonts/NotoSans-Regular.ttf", 60)

return defaultSettings