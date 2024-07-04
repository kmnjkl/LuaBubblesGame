local Object          = require("lib/classic")
local MainScreen      = require("src/screens/MainScreen")
local GameScreen      = require("src/screens/GameScreen")
local SettingsScreen  = require("src/screens/SettingsScreen")
local settings        = require("src/settings")

G_graphicsTools = require("src/tools/graphics_tools")

local currentScreen

function love.load()
  love.graphics.setNewFont("assets/fonts/NotoSans-Regular.ttf", 20)

  currentScreen = MainScreen({settings=settings})
  currentScreen:display()
end

function love.resize(w, h)
  currentScreen:resize(w, h)
end

function love.draw()
  currentScreen:draw()
end