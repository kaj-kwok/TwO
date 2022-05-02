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

  def make_guess
      puts "Enter your Answer"
      answer = @value1+@value2
      guess = gets.chomp.to_i
      if guess === answer
        puts "Correct Answer"
      else  
        puts "Incorrect Answer"
        @current_turn.lives -= 1
      end
  end
  
  
  def start_turn
    generate_question
    puts "#{@current_turn.name}: What is the value of #{@value1} plus #{@value2} equal?"
    make_guess

    get_life_status
    if @player1.lives < 1 || @player2.lives < 1
      puts "Sorry #{@current_turn.name} you lose"
    else
      alternate_turn
      start_turn
    end
  end

  def generate_question
    @value1 = rand(100)
    @value2 = rand(100)
    answer = @value1+@value2
  end
end

new_game = Game.new
new_game.begin