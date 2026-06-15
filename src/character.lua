local _ = require('src.const_libretro')
local gfx_simple_tileset = require('src.gfx_simple_tileset')

local character = {
  controller_number = 0,
  texture = gfx_simple_tileset.texture,
  quad = love.graphics.newQuad(416, 16, 16, 16, 800, 1280),
  on_ground = true,
  xsize = 16,
  ysize = 16,
  dx = 0,
  dy = 0,
  x = 0,
  y = 0,
}

function character:clamp(rectangle)
  if self.x < rectangle.x then self.x = rectangle.x
  elseif self.x + 1 > rectangle.x + rectangle.width then self.x = rectangle.x + rectangle.width - 1
  end
  if self.y < rectangle.y then self.y = rectangle.y
  elseif self.y + 1 > rectangle.y + rectangle.height then self.y = rectangle.y + rectangle.height - 1
  end
end

function character:control(dt)
  if self.controller_number < 1 or self.controller_number > 8 then return end
  local speed = self.on_ground and 6 or 4
  if love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_UP) then
    self.dy = self.dy - dt * speed
  elseif love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_DOWN) then
    self.dy = self.dy + dt * speed
  end
  if love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_LEFT) then
    self.dx = self.dx - dt * speed
  elseif love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_RIGHT) then
    self.dx = self.dx + dt * speed
  end
  if love.joystick.isDown(self.controller_number, RETRO_DEVICE_ID_JOYPAD_A) then
    if self.on_ground then self.dy = -20 end
  end
end

function character:move(dt, map)
  local dxmax = 200
  local dymax = 12
  local gravity = 20 * dt
  local friction = 1.5
  self.dy = self.dy + gravity
  if self.on_ground then
    self.dx = self.dx - friction * self.dx * dt
    if math.abs(self.dx) < .01 then self.dx = 0 end
  end
  if self.dx < -dxmax then self.dx = -dxmax elseif self.dx > dxmax then self.dx = dxmax end
  if self.dy < -dymax then self.dy = -dymax elseif self.dy > dymax then self.dy = dymax end
  local dx = self.x + self.dx * dt
  local dy = self.y + self.dy * dt
  if self.dx <= 0 then
    if map:get_char(dx, self.y) ~= '.' or map:get_char(dx, self.y + .9) ~= '.' then
      dx = math.floor(dx) + 1
      self.dx = 0
    end
  else
    if map:get_char(dx + 1, self.y) ~= '.' or map:get_char(dx + 1, self.y + .9) ~= '.' then
      dx = math.floor(dx)
      self.dx = 0
    end
  end
  self.on_ground = false
  if self.dy <= 0 then
    if map:get_char(dx, dy) ~= '.' or map:get_char(dx + .9, dy) ~= '.' then
      dy = math.floor(dy) + 1
      self.dy = 0
    end
  else
    if map:get_char(dx, dy + 1) ~= '.' or map:get_char(dx + .9, dy + 1) ~= '.' then
      dy = math.floor(dy)
      self.dy = 0
      self.on_ground = true
    end
  end
  self.x = dx
  self.y = dy
end

function character:paint(xoffset, yoffset)
  xoffset, yoffset = xoffset or 0, yoffset or 0
  love.graphics.draw(
    self.texture,
    self.quad,
    math.floor((self.x - xoffset) * self.xsize),
    math.floor((self.y - yoffset) * self.ysize)
  )
end

-- Constructor.
function character:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return character
