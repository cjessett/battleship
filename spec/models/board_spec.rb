require 'rails_helper'

RSpec.describe Board, type: :model do
  subject(:board) { Board.new }

  describe '#initialize' do
    it 'creates a 2-dimensional array of Tile objects' do
      tile = board.board[0][0]
      expect(tile.class).to eql(Tile)
    end
  end

  describe '#place_boat' do
    before do
      tiles = [Tile.new, Tile.new, Tile.new]
      board.place_boat(Ship.new, tiles)
      @test_tile = tiles[0]
    end
    it 'places a boat on a given set of Tiles' do
      expect(@test_tile.class).to eql(Tile)
    end
  end
end
