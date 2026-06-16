local rom_stage_1 = require('src.rom_stage_1')
local background = require('src.background')
local character = require('src.character')

local FRAMERATEMAX = 0.016666666666667
local PLAYER_ONE, PLAYER_TWO = 1, 2
local xoffset, yoffset = 0, 0
local bgmap1 = background:new()
bgmap1:load_string(rom_stage_1)
local player1 = character:new{ controller_number = PLAYER_ONE, x = 5, y = 5 }

function love.update(dt)
  if dt > FRAMERATEMAX then dt = FRAMERATEMAX end  -- Clamp delta time in case physics are running slowly.
  player1:control(dt)
  player1:move(dt, bgmap1)
  player1:clamp(bgmap1)
  xoffset = player1.x - 10
  yoffset = player1.y - 7.5
  if xoffset < bgmap1.x then xoffset = bgmap1.x
  elseif xoffset > bgmap1.x + bgmap1.width - 20 then xoffset = bgmap1.x + bgmap1.width - 20
  end
  if yoffset < bgmap1.y then yoffset = bgmap1.y
  elseif yoffset > bgmap1.y + bgmap1.height - 15 then yoffset = bgmap1.y + bgmap1.height - 15
  end
end

function love.draw()
  bgmap1:paint(xoffset, yoffset)
  player1:paint(xoffset, yoffset)
end
