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

  describe '#status' do
    let(:statuses) { Tile::STATUSES }

    it 'identifies when the Tile is still hidden' do
      expect(tile.status).to eql(statuses[:hidden])
    end
    it 'identifies when the Tile has been hit but is empty' do
      tile.hit = true
      expect(tile.status).to eql(statuses[:water])
    end
    it 'identifies when the Tile contains a hit, but still-afloat boat' do
      tile.instance_variable_set(:@boat, Boat.new)
      tile.hit = true
      expect(tile.status).to eql(statuses[:hit])
    end
    it 'identifies when the Tile contains a hit, sunk boat' do
      tile.instance_variable_set(:@boat, Boat.new)
      tile.hit = true
      tile.boat.instance_variable_set(:@health, 0)
      expect(tile.status).to eql(statuses[:sunk])
    end
  end
end
