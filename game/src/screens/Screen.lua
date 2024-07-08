local Object = require("lib/classic")
local Screen = Object:extend()

function Screen:display()
  love.graphics.setBackgroundColor(self.settings.colors.backgroundColor)
end

function Screen:open(previousScreen)
  self.previousScreen = previousScreen
  self.settings = previousScreen.settings
  self.windowWidth, self.windowHeight = love.graphics.getWidth(), love.graphics.getHeight()
end

function Screen:new(previousScreen)
  self.drawings = {}

  self.updateListeners = {}

  self.keyoressedListeners = {}
  self.keyreleasedListeners = {}

  self.touchpressedListeners = {}
  self.touchreleasedListeners = {}
  self.touchmovedListeners = {}

  self.previousScreen = previousScreen
  self.settings = previousScreen.settings

  self.windowWidth, self.windowHeight = love.graphics.getWidth(), love.graphics.getHeight()
end

function Screen:resize(w, h)
  self.windowWidth = w
  self.windowHeight = h
end

function Screen:draw()
  -- Draw
  local data = {screen=self}
  for i, v in pairs(self.drawings)
  do
    v.draw(data)
  end
end

function Screen:update(dt)
  -- Update
  local data = {screen=self, dt=dt}
  for i, v in pairs(self.updateListeners)
  do
    v.update(data)
  end
end

function Screen:keypressed(key, scancode, isrepeat)
  -- Key pressed
  local data = {screen=self, key=key}
  for i, v in pairs(self.keyoressedListeners)
  do
    v.keypressed(data)
  end
end

function Screen:keyreleased(key, scancode)
  -- Key released
  local data = {screen=self, key=key}
  for i, v in pairs(self.keyreleasedListeners)
  do
    v.keyreleased(data)
  end
end

function Screen:touchpressed(id, x, y, dx, dy, pressure)
  -- Touch pressed
  local data = {screen=self, id=id, x=x, y=y, dx=dx, dy=dy, pressure=pressure}
  for i, v in pairs(self.touchpressedListeners)
  do
    v.touchpressed(data)
  end
end

function Screen:touchreleased(id, x, y, dx, dy, pressure)
  -- Touch released
  local data = {screen=self, id=id, x=x, y=y, dx=dx, dy=dy, pressure=pressure}
  for i, v in pairs(self.touchreleasedListeners)
  do
    v.touchreleased(data)
  end
end

function Screen:touchmoved(id, x, y, dx, dy, pressure)
  -- Touch moved
  local data = {screen=self, id=id, x=x, y=y, dx=dx, dy=dy, pressure=pressure}
  for i, v in pairs(self.touchmovedListeners)
  do
    v.touchmoved(data)
  end
end

---Add a drawing to the screen
---@param d table
---@return integer - index of the drawing in Screen.drawings
function Screen:addDrawing(d)
  table.insert(self.drawings, d)
  return #(self.drawings)
end

function Screen:getWindowWidth()
  return self.windowWidth
end

function Screen:getWindowHeight()
  return self.windowHeight
end

return Screen