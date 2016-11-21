class Board
  attr_reader :board
  attr_accessor :boats

  def initialize(height, width)
    @board = Array.new(height) { Array.new(width) { Tile.new } }
    @boats = []
  end

  # Generate a boat's placement coordinates by making a list of possible placement
  # options, filtering only for the options that are unoccupied, and choosing one
  #
  # @param size [Fixnum] the size of the boat to generate a placement option for
  #
  # @returen [Array] the Tiles to place the boat on
  def random_boat_location(size)
    whole_board = board + board.transpose
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
    boats << boat
    tiles.each { |tile| tile.boat = boat }
  end
end
