local Object = require("lib/classic")
local MainScreen = require("src/screens/MainScreen")
local GameScreen = require("src/screens/GameScreen")
local SettingsScreen = require("src/screens/SettingsScreen")

local currentScreen

function love.load()
  love.graphics.setNewFont("assets/fonts/NotoSans-Regular.ttf", 20)

  currentScreen = MainScreen(nil)
end

function love.resize(w, h)
  currentScreen.resize(w, h)
end

function love.keypressed(key)
  currentScreen.keypressed(key)
end

function love.draw()
  local w = love.graphics.getWidth()
  local h = love.graphics.getHeight()
  local keyp = "key"
  love.graphics.print("Ура! " .. w .. " " .. h .. " " .. keyp)
  love.graphics.circle("fill", w/2, h/2, w/5)
end