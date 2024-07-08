local Object = require("lib/classic")
local Button = Object:extend()

function Button:new(x, y, centered, drawing)
  self.w, self.h = drawing.getWidth(), drawing.getHeight()
  if centered then
    self.x = x - self.w/2
    self.y = y - self.h/2
  else
    self.x, self.y = x, y
  end
  self.drawing = drawing
end

function Button:draw()
  drawing:draw()
end

return Button