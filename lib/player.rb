class Player
  def initialize(game)
    @game = game
  end

  def make_move
    loop do
      puts "Pick a column to place your piece."
      move = gets.chomp.strip
      return move.to_sym if %w[a b c d e f].include?(move) && @game.board[move.to_sym].length < 6

      puts "Invalid"
    end
  end
end
