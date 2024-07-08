local Object          = require("lib/classic")
local MainScreen      = require("src/screens/MainScreen")
local GameScreen      = require("src/screens/GameScreen")
local SettingsScreen  = require("src/screens/SettingsScreen")
local settings        = require("src/settings")
local graphicsTools   = require("src/tools/graphics_tools")

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
  local text, font = {{0,0,0}, "black ", {1,0,0}, "red\n", {0,1,0}, "green"}, settings.fonts.button1
  love.graphics.print(text, font)
  -- love.graphics.setColor(0,0,0, 1)
  love.graphics.print({{0,0,0,1}, graphicsTools.getTextWidth(text, font) .. " ", {0,0,0,1}, graphicsTools.getTextWidth("black red green", font)})
end