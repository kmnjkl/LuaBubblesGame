local Object = require("lib/classic")
local TextButton = Object:extend()

function TextButton:new(coloredtext, font, x, y, centered)
  self.text = coloredtext
  self.font = font
  
  if centered then
    self.x = x - self.w/2
    self.y = y - self.h/2
  else
    self.x, self.y = x, y
  end
end

return TextButton