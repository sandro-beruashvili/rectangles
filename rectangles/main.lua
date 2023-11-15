io.stdout:setvbuf('no')

push = require 'push'
Class = require 'class'

require 'Player'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')


  smallFont = love.graphics.newFont('font.ttf', 6)
  bigFont = love.graphics.newFont('font.ttf', 32)

  love.graphics.setFont(smallFont)

  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = true,
    vsync = true
  })

  player1 = Player(0, 0)
  player2 = Player(50, 0)
end

function love.update(dt)
  
   if love.keyboard.isDown('d') then
    player1.x = player1.x + 1
  elseif love.keyboard.isDown('a') then
    player1.x = player1.x - 1
   elseif love.keyboard.isDown('s') then
    player1.y = player1.y + 1
  elseif love.keyboard.isDown('w') then
    player1.y = player1.y - 1
  end
  
  if love.keyboard.isDown('right') then
    player2.x = player2.x + 1
  elseif love.keyboard.isDown('left') then
    player2.x = player2.x - 1
   elseif love.keyboard.isDown('down') then
    player2.y = player2.y + 1
  elseif love.keyboard.isDown('up') then
    player2.y = player2.y - 1
  end
  
  if player1:collides(player2) then
    print('collides')
  end
  if player1.x < 0 then
  player1.x = 0
elseif player1.x > VIRTUAL_WIDTH then
    player1.x = 0
  elseif player1.y < 0 then
    player1.y = 0
   elseif player1.y >= 243 then
      player1.y = 0
 end
  if player2.x < 0 then
    player2.x = 0
    elseif player2.x >= VIRTUAL_WIDTH then
    player2.x = 0
  elseif player2.y < 0 then
    player2.y = 0
   elseif player2.y >= 243 then
      player2.y = 0
 end
end
function love.draw()
  push:start()

  
  love.graphics.clear(11/255, 89/255, 158/255)
  love.graphics.setColor(255/255, 0/255, 0/255)
  
  --love.graphics.rectangle('fill', player_x, 10, 20, 20)
  
  player1:render()
  player2:render()

  push:finish()

end