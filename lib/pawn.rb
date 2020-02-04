module PawnSettings
  SPRITES = ["⚫", "⚪"]
end
class Pawn
  include PawnSettings
  attr_accessor :sprite
  def initialize(sprite=0)
    @sprite = sprite
  end
  def render
    SPRITES[sprite]
  end
end