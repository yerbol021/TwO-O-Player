class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
  end

  def play
    while @player1.lives > 0 && @player2.lives > 0
      puts "------ New Turn ------"
      ask_question
      check_answer(gets.chomp.to_i)
      display_scores
      switch_turns
    end

    announce_winner
  end

  private

  def ask_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @answer = num1 + num2

    puts "#{current_player_name}: What does #{num1} plus #{num2} equal?"
    print "> "
  end

  def check_answer(player_answer)
    if player_answer == @answer
      puts "#{current_player_name}: Yes, you are correct."
    else
      puts "#{current_player_name}: Seriously? No!"
      current_player.decrease_lives
    end
  end

  def display_scores
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def announce_winner
    if @player1.lives == 0
      puts "Player 2 wins with a score of #{player2.score}/3."
    else
      puts "Player 1 wins with a score of #{player1.score}/3."
    end
  end

  def player1
    @player1
  end

  def player2
    @player2
  end

  def current_player
    @current_player
  end

  def current_player_name
    @current_player == @player1 ? "Player 1" : "Player 2"
  end
end
