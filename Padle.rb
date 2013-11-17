class Paddle 
  WIDTH = 150
  HEIGHT = 16
  SPEED = 6

  attr_reader :x
  def initialize
    @x = Game::WIDTH/2
  end

  def x1
    x-100
  end
  def y1
    Game::HEIGHT
  end

  def x2
    x1+100
  end

  def y2
    Game::HEIGHT-15
  end
  def draw(window)
    white = Gosu::Color::WHITE
    window.draw_quad(
      x1,y1, white,
      x2, y1, white,
      x1, y2, white,
      x2,y2, white
    )
  end
  
  def left!
    @x-=SPEED
    if x1<=0
      @x = Game::WIDTH
    end
  end

  def right!
    @x+=SPEED
    if x2>Game::WIDTH
      @x = 0
    end
  end
end 
