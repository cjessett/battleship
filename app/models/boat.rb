class Boat < BasicBattleship
  SIZE = 1
  NAME = 'Boat'.freeze

  def initialize
    super(SIZE, NAME)
  end
end
