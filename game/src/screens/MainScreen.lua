local Screen = require("src/screens/Screen")

MainScreen = Screen:extend()

function MainScreen:new(previousScreen)
  MainScreen.super.new(self, previousScreen)

  self:addDrawing({draw = function ()
    G_graphicsTools.drawCenteredText({self.settings.colors.textColor, "PLAY"}, self.settings.fonts.button1, self.windowWidth/2, self.windowHeight/2)
  end})
end

return MainScreen