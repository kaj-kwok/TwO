require_relative "player"

class Game

  def initialize
    @player1 = Player.new("David")
    @player2 = Player.new("Paul")
    @current_turn = @player1
    @value1 = ''
    @value2 = ''
  end

  def begin
    puts "Game has started"
    puts "Players are #{@player1.name} & #{@player2.name}"
    start_turn
  end

  def get_life_status 
    puts "#{@player1.name} has #{@player1.lives}/3, #{@player2.name} has #{@player2.lives}/3 "
  end

  def alternate_turn
    @current_turn === @player1 ? @current_turn = @player2 : @current_turn = @player1
  end
  
  def start_turn
    generate_question
    puts "#{@current_turn.name}: What is the value of #{@value1} plus #{@value2} equal?"
    guess = gets.chomp.to_i
    get_life_status
    alternate_turn
  end

  def generate_question
    @value1 = rand(100)
    @value2 = rand(100)
    answer = @value1+@value2
  end
end

new_game = Game.new
new_game.begin