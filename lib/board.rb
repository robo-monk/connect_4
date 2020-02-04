class Board
  attr_accessor :board_ary
  def initialize
    @board_ary = build_ary
  end
  private
  def build_ary
    ary = []
    6.times do
      y = []
      6.times do
        y << "_"
      end
      ary << y
    end
    ary
  end
  def run_filter(filter, row_index, col_index)
    scan = []
    filter.each do |xy|
      begin
        @board_ary[row_index+xy[1]][col_index+xy[0]]
      rescue
        return false
      end
      target = (@board_ary[row_index+xy[1]][col_index+xy[0]])
      if target.instance_of? Pawn
        scan << target.render
      else
        return
      end
    end
    return scan.uniq.length == 1
  end
  public
  def drop_at(x, sprite)
    board_ary.each_with_index do |y, index|
      if y[x] == "_"
        @board_ary[index][x] = Pawn.new(sprite)
        return true
      end
    end
    return false
  end
  def get_ary
    @board_ary
  end
  def render
    board_ary.reverse.each do |y|
      y.each do |x|
        if x=="_"
          print "__"
        else
          print x.render
        end
        print "|"
      end
      puts "\n"
    end
  end
  def won?
    # x y
    col_filter = [[0,0],[0,1],[0,2],[0,3]]
    row_filter = [[0,0],[1,0],[2,0],[3,0]]
    dia_up_filter = [[0,0],[1,1],[2,2],[3,3]]
    dia_down_filter = [[0,0],[1,-1],[2,-2],[3,-3]]
    @board_ary.each_with_index do |y, row_index|
      results = []
      y.each_with_index do |x, col_index|
        results << run_filter(col_filter, row_index, col_index)
        results << run_filter(dia_up_filter, row_index, col_index)
        results << run_filter(dia_down_filter, row_index, col_index)
        results << run_filter(row_filter, row_index, col_index)
        return true if results.any?
      end
    end
    return false
  end
end