class Array
  def queen_move_valid?(coord)
    x1, y1 = self
    x2, y2 = coord
    rise = (y2 - y1).abs
    run = (x2 - x1).abs
    return true if rise.zero? || run.zero?
    (rise / run) == 1
  end
end
