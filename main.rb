require './lib/board.rb'
require './lib/pawn.rb'
require './lib/player.rb'

@p1 = Player.new(0)
@p2 = Player.new(1)
@ps = [@p1, @p2]
@turns = 0
@b = Board.new
def turn
  @b.render
  current_player = @ps[@turns%(@ps.length)]
  if @b.drop_at(current_player.get_move, current_player.sprite)
    @turns+=1
    if @b.won?
      game_over current_player
    else 
      turn
    end
  else
    puts "filled, try again dumbass"
    turn
  end
end
def game_over p
  @b.render
  puts "#{p.name} won!"
end

turn
