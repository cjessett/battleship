class Board
  BOARD_HEIGHT = 10
  BOARD_WIDTH = 10

  attr_reader :board

  def initialize(options = { board_width: BOARD_HEIGHT, board_height: BOARD_WIDTH })
    @board = Array.new(options[:board_height]) { Array.new(options[:board_width]) { Tile.new } }
  end

  # Generate a boat's placement coordinates by making a list of possible placement
  # options, filtering only for the options that are unoccupied, and choosing one
  #
  # @param size [Fixnum] the size of the boat to generate a placement option for
  #
  # @returen [Array] the Tiles to place the boat on
  def random_boat_location(size)
    whole_board = @board + @board.transpose
    placement_options = whole_board.map { |row_or_column| row_or_column.each_cons(size).entries }
    empty_options = placement_options.flatten(1).find_all do |option|
                      option.none?(&:boat)
                    end
    empty_options.sample
  end

  # Takes a given boat object and array of Tiles, and places that boat on each Tile
  #
  # @param boat [Boat, Ship, Carrier] the boat object to place on the given Tiles
  # @param tiles [Array] the array of Tiles to place the boat on
  def place_boat(boat, tiles)
    tiles.each { |tile| tile.boat = boat }
  end
end
