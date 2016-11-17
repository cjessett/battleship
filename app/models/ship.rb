class Ship < BasicBattleship
  SIZE = 3
  NAME = 'Ship'.freeze

  def initialize
    super(SIZE, NAME)
  end
end
