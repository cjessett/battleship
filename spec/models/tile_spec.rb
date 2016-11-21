require 'rails_helper'

RSpec.describe Tile, type: :model do
  subject(:tile) { Tile.new }

  describe '#occupied' do
    it 'returns whether the Tile is occupied by a Boat' do
      tile.instance_variable_set(:@boat, Boat.new)
      expect(tile.occupied?).to be true
    end
  end

  describe '#shoot' do
    it 'hits the tile at the given coordinates' do
      tile.shoot
      expect(tile.hit).to be true
    end
  end
end
