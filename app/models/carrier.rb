class Carrier < BasicBattleship
  SIZE = 5
  NAME = 'Carrier'.freeze

  def initialize
    super(SIZE, NAME)
  end
end
