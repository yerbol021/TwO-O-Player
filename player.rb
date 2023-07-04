class Player
  attr_reader :lives, :score

  def initialize
    @lives = 3
    @score = 0
  end

  def decrease_lives
    @lives -= 1
  end

  def increase_score
    @score += 1
  end
end
