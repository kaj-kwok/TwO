class Question
  def initialize
    @value1 = rand(100)
    @value2 = rand(100)
    @answer = @value1+@value2
  end

  attr_reader :value1, :value2, :answer

end