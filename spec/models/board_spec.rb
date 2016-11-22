require 'rails_helper'

RSpec.describe Board, type: :model do
  subject(:board) { Board.new(10, 10) }

  describe '#initialize' do
    it 'creates a 2-dimensional array of Tile objects' do
      tile = board.board[0][0]
      expect(tile.class).to eql(Tile)
    end
  end

  describe '#place_boat' do
    before do
      tiles = [Tile.new, Tile.new, Tile.new]
      @ship = Ship.new
      board.place_boat(@ship, tiles)
      @test_tile = tiles[0]
    end
    it 'places a boat on a given set of Tiles' do
      expect(@test_tile.boat.class).to eql(Ship)
    end
    it 'populates the boats array with boat objects' do
      expect(board.boats).to eql([@ship])
    end
  end
end
