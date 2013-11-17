class Ball
  SIZE = 12
  SPEED = 2
  attr_reader :x, :y, :angle, :speed 
  attr_accessor :direction

  def initialize
    @x = Game::WIDTH/2
    @y = Game::HEIGHT/2
  end
  def move!()
    if direction=="up"
      @y-=SPEED
    else
      @y+=SPEED
    end

  end

  def intersect?(paddle)
    (x1 > paddle.x1 && x1 < paddle.x2) &&
      y2 > paddle.y1 
  end

  def out_of_edge?
    @y<0
  end
  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end 
  def draw(window)
    color = Gosu::Color::GREEN

    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y2, color,
      x2, y1, color,
    )
  end
end
