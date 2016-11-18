class Tile
  STATUSES = { hit: 'hit', sunk: 'sunk', water: 'water', hidden: 'hidden' }

  attr_accessor :boat, :hit

  def initialize
    @hit = false
  end

  # Identifies if the Tile has a boat on it
  #
  # @return [Boolean] whether or not a boat is on the Tile
  def occupied?
    !!@boat
  end

  # Hits the boat on the Tile if there is one, and sets @hit to true
  def shoot
    @hit = true
    boat.hit if occupied?
  end

  # Identifies the Tile's current status
  #
  # @return [String] the Tile's current status
  def status
    return STATUSES[:hidden] unless hit
    return STATUSES[:water] unless occupied?
    boat.sunk? ? STATUSES[:sunk] : STATUSES[:hit]
  end
end
