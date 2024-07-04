local graphicsTools = {}

---Draw text with it's center in (x,y)
---@param coloredtext string|table
---@param font love.Font
---@param x any
---@param y any
---@param r any
---@param sx any
---@param sy any
---@param ox any
---@param oy any
---@param kx any
---@param ky any
function graphicsTools.drawCenteredText(coloredtext, font, x, y, r, sx, sy, ox, oy, kx, ky)
  local plainText = ""
  if type(coloredtext) == "table" then
    for index, value in ipairs(coloredtext) do
      if index%2 == 0 then
        plainText = plainText .. value
      end
    end
  else
    plainText = coloredtext
  end
  local textWidth = font:getWidth(plainText)
  local textHeight = font:getHeight()

  ox = ox and ox or 0
  oy = oy and oy or 0

  love.graphics.print(coloredtext, font, x, y, r, sx, sy, ox+textWidth/2, oy+textHeight/2, kx, ky)
end

return graphicsTools