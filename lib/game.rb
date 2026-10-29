require_relative "art"
require_relative "player"

class Game
  include Art

  def initialize
    @players = [Player.new(self), Player.new(self)]
    @current_player_id = 0
    @board = { a: [], b: [], c: [], d: [], e: [], f: [], g: [] }
  end
  attr_reader :board

  def play
    puts "Welcome to Connect-4\n\n"
    loop do
      draw_board
      player_turn
      return final_winner if winner?
      return final_tie if tie?

      switch_player
    end
  end

  def player_turn
    column = current_player.select_column
    @board[column].push(@current_player_id)
  end

  def current_player
    @players[@current_player_id]
  end

  def switch_player
    return @current_player_id = 1 if @current_player_id.zero?

    @current_player_id = 0
  end

  def winner?
  end

  def tie?
    (:a..:g).each { |col| return false if board[col].length < 6 }
    true
  end

  private

  def final_tie
    draw_board
    puts "It's a tie, no one wins."
    false
  end

  def final_winner
    draw_board
    if @current_player_id == 0
      puts "White wins!!!"
    else
      puts "Black wins!!!"
    end
    true
  end
end
