# Any live cell with fewer than two live neighbours dies
# Any live cell with two or three live neighbours lives
# Any live cell with more than three live neighbours dies
# Any dead cell with exactly three live neighbours becomes a live cell

class Game
  def initialize(board)
    @board = board
    @last_col_index = @board.length - 1
    @last_row_index = @board[0].length - 1
  end

  def next
    new_board = @board.map.with_index do |row, y|
      row.map.with_index do |_, x|
        survives?(x, y) ? 1 : 0
      end
    end
    Game.new(new_board)
  end

  def to_s
    @board.map { |row|
      row.map{ |cell|
        cell == 1 ? "x" : "0"
      }.join(" ")
    }.join("\n") + "\n"
  end

  private

  attr_reader :board, :last_col_index, :last_row_index

  def survives?(x, y)
    neighbors = live_neighbors_count(x, y)
    alive = alive?(x, y)

    if neighbors <= 1 && alive
      false
    elsif neighbors <= 3 && alive
      true
    elsif neighbors <= 8 && alive
      false
    elsif neighbors == 3 && !alive
      true
    end
  end

  def live_neighbors_count(x, y)
    count = 0
    ((y-1)..(y+1)).each do |row|
      ((x-1)..(x+1)).each do |col|
        count += 1 if !offgrid_or_self?(col, row, [x, y]) && alive?(col, row)
      end
    end
    count
  end

  def alive?(x, y)
    @board[y][x] == 1
  end

  def offgrid_or_self?(col, row, center_x_y_coord)
    offgrid = row < 0 || row > last_row_index || col < 0 || col > last_col_index
    (center_x_y_coord == [col, row]) || offgrid
  end
end
