class Game
  attr_reader :board, :shots_remaining, :boats, :starting_shots, :starting_time

  def initialize(boats: CONFIG['boats'],
                 board_height: CONFIG['board_height'],
                 board_width: CONFIG['board_width'],
                 starting_shots: CONFIG['starting_shots'])
    @board = Board.new(board_height, board_width)
    @starting_shots = starting_shots
    @shots_remaining = starting_shots
    @boats = boats
    @starting_time = Time.now
    board_setup
  end

  # Updates the tile at the provided coordinate in the board array to 'hit' it,
  # and updates any needed game and boat statuses
  #
  # @param [Array] the x and y coordinates used to locate the Tile to 'hit'
  def shoot(coordinates)
    tile = tile_at(coordinates[0], coordinates[1])
    tile.shoot
    @shots_remaining -= 1 unless tile.occupied?
  end

  # Calculate the game score based on missed shots, hit shots, and elapsed time
  #
  # @return [Fixnum] the score of the game
  def calculate_score
    statuses = Tile::STATUSES
    missed_shots = starting_shots - shots_remaining
    hit_shots = board.board.flatten.select do |tile|
      [statuses[:hit], statuses[:sunk]].include?(tile.status)
    end
    hit_shots = hit_shots.count
    total_time = (Time.now - starting_time).round
    ((500 * hit_shots) - (50 * missed_shots)) / total_time
  end

  def score
    @score ||= calculate_score
  end

  # Identifies if the game is over by determining if all shots or boats are gone
  #
  # @return [Boolean] whether or not the game is over
  def game_over?
    shots_remaining <= 0 || board.boats.all?(&:sunk?)
  end

  private

  # Generates and randomly places all boat pieces
  def board_setup
    create_boats.each do |boat|
      board.place_boat(boat, board.random_boat_location(boat.size))
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
