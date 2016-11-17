require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#initialize' do
    subject(:game) { Game.new }
    it 'places boats on the board' do
      carrier = Carrier.new
      ship = Ship.new
      boat = Boat.new
      boat_list = game.instance_variable_get(:@boats_remaining)
      num_carriers = boat_list[carrier.name]
      num_ships = boat_list[ship.name]
      num_boats = boat_list[boat.name]
      tiles_with_boats = game.board.board.flatten.inject(0) do |sum, tile|
                          tile.boat ? sum + 1 : sum
                         end
      expected_tiles_with_boats = (carrier.size * num_carriers) +
                                  (ship.size * num_ships) +
                                  (boat.size * num_boats)
      expect(tiles_with_boats).to eql(expected_tiles_with_boats)
    end
  end
end
