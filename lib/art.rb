module Art
  def draw_board
    draw_top
    (1..6).each do |i|
      draw_row(6 - i)
      draw_between
    end
    puts ""
  end

  def draw_row(row)
    column = "\u2503"
    print column
    (:a..:g).each { |col| print piece(col, row) + column }
    print "\n"
  end

  def draw_top
    top_left_corner = "\u250F"
    top_right_corner = "\u2513"
    top_tee = "\u2533"
    line = "\u2501"

    puts " a  b  c  d  e  f  g"
    puts top_left_corner + line + line + top_tee + line + line + top_tee + line + line + top_tee + line + line + top_tee + line + line + top_tee + line + line + top_tee + line + line + top_right_corner
  end

  def draw_between
    left_tee = "\u2523"
    right_tee = "\u252B"
    line = "\u2501"
    intersection = "\u254B"

    puts left_tee + line + line + intersection + line + line + intersection + line + line + intersection + line + line + intersection + line + line + intersection + line + line + intersection + line + line + right_tee
  end

  def piece(x, y)
    white_piece = "\u26AA"
    black_piece = "\u26AB"
    return "  " if @board[x][y].nil?
    return white_piece if @board[x][y] == 0

    black_piece if @board[x][y] == 1
  end
end
