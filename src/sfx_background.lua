local sfx_background = {
  love.audio.newSource('share/bart_random_silly_chip_song.ogg', 'stream'),
}

sfx_background[1]:setLooping(true)

function sfx_background.play_bgm()
  if not sfx_background[1]:isPlaying() then love.audio.play(sfx_background[1]) end
end

return sfx_background
