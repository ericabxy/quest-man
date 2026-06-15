return {
  texture = love.graphics.newImage('share/oga_simples_pimples.png'),
  bgtiles = {
    ['G'] = love.graphics.newQuad(128, 64, 16, 16, 800, 1280),
    ['g'] = love.graphics.newQuad(128, 80, 16, 16, 800, 1280),
    ['B'] = love.graphics.newQuad(80, 64, 16, 16, 800, 1280),
    ['b'] = love.graphics.newQuad(80, 80, 16, 16, 800, 1280),
    ['.'] = love.graphics.newQuad(128, 0, 16, 16, 800, 1280), 
    [':'] = love.graphics.newQuad(208, 256, 16, 16, 800, 1280),
    ['='] = love.graphics.newQuad(256, 224, 16, 16, 800, 1280),
    ['#'] = love.graphics.newQuad(272, 224, 16, 16, 800, 1280),
    ['o'] = love.graphics.newQuad(560, 816, 16, 16, 800, 1280),
  }
}
