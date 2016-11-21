class Tile
  attr_accessor :boat, :hit

  def initialize
    @hit = false
  end

  # Identifies if the Tile has a boat on it
  #
  # @return [Boolean] whether or not a boat is on the Tile
  def occupied?
    !@boat.nil?
  end

  # Hits the boat on the Tile if there is one, and sets @hit to true
  def shoot
    @hit = true
    boat.hit if occupied?
  end
end
