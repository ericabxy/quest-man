local sfx_essential = {}

local coin_double1 = {
  love.audio.newSource('share/sfx_coin_double1.wav', 'static'),
  love.audio.newSource('share/sfx_coin_double1.wav', 'static'),
  love.audio.newSource('share/sfx_coin_double1.wav', 'static'),
}

local movement_jump1 = {
  love.audio.newSource('share/sfx_movement_jump1.wav', 'static'),
  love.audio.newSource('share/sfx_movement_jump1.wav', 'static'),
  love.audio.newSource('share/sfx_movement_jump1.wav', 'static'),
}

function sfx_essential.play_gem()
  for n, sfx in ipairs(coin_double1) do
    if not sfx:isPlaying() then love.audio.play(sfx) return n end
  end
end

function sfx_essential.play_jump()
  for n, sfx in ipairs(movement_jump1) do
    if not sfx:isPlaying() then love.audio.play(sfx) return n end
  end
end

function sfx_essential.stop_jump(n)
  if movement_jump1[n] and movement_jump1[n]:isPlaying() then love.audio.stop(movement_jump1[n]) end
end

return sfx_essential
