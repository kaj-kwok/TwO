require_relative "player"
require_relative "question"

class Game

  def initialize
    @player1 = Player.new("David")
    @player2 = Player.new("Paul")
    @current_turn = @player1
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

  def make_guess(question)
      puts "Enter your Answer"
      guess = gets.chomp.to_i
      if guess === question.answer
        puts "Correct Answer"
      else  
        puts "Incorrect Answer"
        @current_turn.lives -= 1
      end
  end

  def start_turn
    question = Question.new()
    puts "#{@current_turn.name}: What is the value of #{question.value1} plus #{question.value2} equal?"
    make_guess(question)
    get_life_status
    if @player1.lives < 1 || @player2.lives < 1
      puts "Sorry #{@current_turn.name} you lose"
    else
      alternate_turn
      start_turn
    end
  end
end

new_game = Game.new
new_game.begin