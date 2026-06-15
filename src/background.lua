local gfx_simple_tileset = require('src.gfx_simple_tileset')

local background = {
  texture = gfx_simple_tileset.texture,
  quads = gfx_simple_tileset.bgtiles,
  charmap = {},
  width = 50,
  height = 25,
  xsize = 16,
  ysize = 16,
  x = 0,
  y = 0,
}

function background:get_char(x, y)
  x, y = math.floor(x) + 1, math.floor(y) + 1
  if self.charmap[x] and self.charmap[x][y] then return self.charmap[x][y] end
end

function background:load_string(s)
  self.charmap = {}
  self.width = #(s:match("[^\n]+"))
  self.height = 0
  for x = 1, self.width, 1 do self.charmap[x] = {} end  
  local row_i, col_i = 1, 1
  for row in s:gmatch("[^\n]+") do
    assert(#row == self.width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(self.width) .. ', but it is ' .. tostring(#row))
    col_i = 1
    for character in row:gmatch(".") do
      self.charmap[col_i][row_i] = character
      col_i = col_i + 1
    end
    self.height = self.height + 1
    row_i = row_i + 1
  end
end

function background:paint(xoffset, yoffset)
  xoffset, yoffset = xoffset or 0, yoffset or 0
  for col_i, col in ipairs(self.charmap) do
    for row_i, char in ipairs(col) do
      if self.quads[char] then
        local x, y = col_i - 1, row_i - 1
        love.graphics.draw(self.texture, self.quads[char], math.floor((x - xoffset) * self.xsize), math.floor((y - yoffset) * self.ysize))
      end
    end
  end
end

-- Constructor.
function background:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return background
