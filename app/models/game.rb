class Game
  attr_reader :board, :shots_remaining, :boats

  def initialize(boats: CONFIG['boats'],
                 board_height: CONFIG['board_height'],
                 board_width: CONFIG['board_width'],
                 starting_shots: CONFIG['starting_shots'])
    @board = Board.new(board_height, board_width)
    @shots_remaining = starting_shots
    @boats = boats
    board_setup
  end

  # Updates the tile at the provided coordinate in the board array to 'hit' it,
  # and updates any needed game and boat statuses
  #
  # @param [Array] the x and y coordinates used to locate the Tile to 'hit'
  def shoot(coordinates)
    tile = tile_at(coordinates[0],coordinates[1])
    tile.shoot
    @shots_remaining -= 1 unless tile.occupied?
  end

  private

  # Generates and randomly places all boat pieces
  def board_setup
    create_boats.each do |boat|
      board.place_boat(boat, @board.random_boat_location(boat.size))
    end
  end

  # Dynamically create boat objects based on the names and quantities in @boats
  def create_boats
    boats.map { |name, num| num.times.map { Object::const_get(name.to_s).new } }.flatten
  end

  def tile_at(row, column)
    board.board[row][column]
  end
end
