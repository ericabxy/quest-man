local gfx_dos_8x8_imagefont = require('src.gfx_dos_8x8_imagefont')

local score = {
  value = 0,
}

function score:paint(x, y, limit, align)
  x, y = x or 0, y or 0
  limit = limit or 48
  align = align or 'left'
  love.graphics.setFont(gfx_dos_8x8_imagefont)
  love.graphics.printf('SCORE ' .. self.value, x, y, limit, align)
end

function score:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return score
