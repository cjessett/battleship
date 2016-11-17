class Game
  STARTING_BOATS = 5
  STARTING_SHIPS = 3
  STARTING_CARRIERS = 2
  STARTING_SHOTS = 50

  attr_reader :board, :shots_remaining, :boats_remaining

  def initialize(options = { starting_shots: STARTING_SHOTS })
    @board = Board.new
    @shots_remaining = options[:starting_shots]
    @boats_remaining = Hash.new(0)
    board_setup
  end

  private

  # Generates, randomly places, and creates a count hash of all boat pieces
  def board_setup
    create_boats.each do |boat|
      @board.place_boat(boat, @board.random_boat_location(boat.size))
      @boats_remaining[boat.name] += 1
    end
  end

  def create_boats
    boats = []
    STARTING_CARRIERS.times { boats << Carrier.new }
    STARTING_SHIPS.times { boats << Ship.new }
    STARTING_BOATS.times { boats << Boat.new }
    boats
  end
end
