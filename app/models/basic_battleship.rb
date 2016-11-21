class BasicBattleship
  attr_reader :size, :name

  def initialize(size, name)
    @size = size
    @health = size
    @name = name
  end

  # Identifies if the Boat has sunk by losing all health
  #
  # @return [Boolean] whether or not the Boat is sunk
  def sunk?
    @health.zero?
  end

  # Reduces the boat's health when it is hit
  def hit
    @health -= 1
  end
end
