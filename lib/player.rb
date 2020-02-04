class Player
  attr_accessor :name, :sprite
  def initialize(sprite)
    set_player_name
    @sprite = sprite
  end
  def set_player_name
    puts "What's the new name of the player?"
    @name = gets.chomp
  end
  def get_move
    inp = nil
    esc = false
    while !esc
      puts "#{@name} enter col to drop pawn: "
      inp = gets.chomp.to_i
      if inp.between?(1,7)
        esc = true
      else
        puts "Input out of bounds"
      end
    end
    return inp-1
  end
end