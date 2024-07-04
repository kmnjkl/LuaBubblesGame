local Object = require("lib/classic")
local Screen = Object:extend()

function Screen:new(previousScreen)
  self.previousScreen = previousScreen
  self.windowWidth, self.windowHeight = love.graphics.getWidth(), love.graphics.getHeight()

  self.drawCallbacks = {}

  self.updateCallbacks = {}

  self.keypressedCallbacks = {}
  self.keyreleasedCallbacks = {}

  self.touchpressedCallbacks = {}
  self.touchreleasedCallbacks = {}
  self.touchmovedCallbacks = {}
end

function Screen:resize(w, h)
  self.windowWidth = w
  self.windowHeight = h
end

function Screen:draw()
  -- Draw
  local data = {screen=self}
  for i, func in pairs(self.drawCallbacks)
  do
    func(data)
  end
end

function Screen:update(dt)
  -- Update
  local data = {screen=self, dt=dt}
  for i, func in pairs(self.updateCallbacks)
  do
    func(data)
  end
end

function Screen:keypressed(key, scancode, isrepeat)
  -- Key pressed
  local data = {screen=self, key=key}
  for i, func in pairs(self.keypressedCallbacks)
  do
    func(data)
  end
end

function Screen:keyreleased(key, scancode)
  -- Key released
  local data = {screen=self, key=key}
  for i, func in pairs(self.keyreleasedCallbacks)
  do
    func(data)
  end
end

function Screen:touchpressed(id, x, y, dx, dy, pressure)
  -- Touch pressed
  local data = {screen=self, id=id, x=x, y=y, dx=dx, dy=dy, pressure=pressure}
  for i, func in pairs(self.touchpressedCallbacks)
  do
    func(data)
  end
end

function Screen:touchreleased(id, x, y, dx, dy, pressure)
  -- Touch released
  local data = {screen=self, id=id, x=x, y=y, dx=dx, dy=dy, pressure=pressure}
  for i, func in pairs(self.touchreleasedCallbacks)
  do
    func(data)
  end
end

function Screen:touchmoved(id, x, y, dx, dy, pressure)
  -- Touch moved
  local data = {screen=self, id=id, x=x, y=y, dx=dx, dy=dy, pressure=pressure}
  for i, func in pairs(self.touchmovedCallbacks)
  do
    func(data)
  end
end

return Screen