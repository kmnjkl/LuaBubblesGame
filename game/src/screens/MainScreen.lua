local Object = require("lib/classic")
local Screen = require("src/screens/Screen")

MainScreen = Screen:extend()

function MainScreen:new(previousScreen)
  MainScreen.super.new(self, previousScreen)
  
end

return MainScreen