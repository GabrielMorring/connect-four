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
    puts "White's turn" if @current_player_id == 0
    puts "Black's turn" if @current_player_id == 1
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
    return true if horizontal4?
    return true if vertical4?
    return true if diagonal4?

    false
  end

  def vertical4?
    board.each do |key, column|
      puts "#{key}: #{column}"
      column.each_with_index do |item1, index|
        item2 = column[index + 1]
        item3 = column[index + 2]
        item4 = column[index + 3]
        return true if [item1, item2, item3, item4].all?(@current_player_id)
      end
    end
    false
  end

  def horizontal4?
    columns = %i[a b c d e f g]
    (0..5).each do |row|
      columns.each_with_index do |col, index|
        item1 = board.dig(col, row)
        item2 = board.dig(columns[index + 1], row)
        item3 = board.dig(columns[index + 2], row)
        item4 = board.dig(columns[index + 3], row)
        return true if [item1, item2, item3, item4].all?(@current_player_id)
      end
    end
    false
  end

  def diagonal4?
    columns = %i[a b c d e f g]
    columns.each_with_index do |key, c_index|
      (0..5).each do |r_index|
        item1 = board.dig(columns[c_index], r_index)
        item2 = board.dig(columns[c_index + 1], r_index + 1)
        item3 = board.dig(columns[c_index + 2], r_index + 2)
        item4 = board.dig(columns[c_index + 3], r_index + 3)

        item2b = board.dig(columns[c_index - 1], r_index + 1)
        item3b = board.dig(columns[c_index - 2], r_index + 2)
        item4b = board.dig(columns[c_index - 3], r_index + 3)

        return true if [item1, item2, item3, item4].all?(@current_player_id)
        return true if [item1, item2b, item3b, item4b].all?(@current_player_id)
      end
    end
    false
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
