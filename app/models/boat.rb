class Boat < BasicBattleship
  SIZE = 1
  NAME = 'Boat'.freeze

  def initialize
    super(SIZE, NAME)
  end

  # Decreases health by 1
  #
  # @return [Integer] health
  def hit
    @health > 0 ? @health -= 1 : @health
  end
end
