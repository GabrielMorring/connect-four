class Player
  def initialize(game)
    @game = game
  end

  def select_column
    loop do
      puts "Pick a column to place your piece."
      move = gets.chomp.strip
      return move.to_sym if %w[a b c d e f g].include?(move) && @game.board[move.to_sym].length < 6

      puts "Invalid"
    end
  end
end
