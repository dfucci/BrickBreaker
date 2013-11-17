require "hasu"
Hasu.load "Ball.rb"
Hasu.load "Padle.rb"
class Game < Hasu::Window
  WIDTH = 640
  HEIGHT = 576
  def initialize 
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @ball = Ball.new 
    @paddle = Paddle.new
    @ball.direction = "down"
  end

  def draw
    @ball.draw(self)
    @paddle.draw(self)
  end

  def update
    @ball.move!()
    if button_down?(Gosu::KbA)
      @paddle.left!
    end
    if button_down?(Gosu::KbD)
      @paddle.right!
    end
    if @ball.intersect?(@paddle)
      @ball.direction="up"
    end
    if @ball.out_of_edge?
      puts "up up up"
      @ball.direction="down"
    end

  end

end

Game.run
