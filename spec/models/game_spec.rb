require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#initialize' do
    subject(:game) { Game.new }
    it 'places boats on the board' do
      carrier = Carrier.new
      ship = Ship.new
      boat = Boat.new
      game = Game.new(boats: { Boat: 1,
                               Ship: 1,
                               Carrier: 1 },
                      starting_shots: 50,
                      board_height: 10,
                      board_width: 10)
      tiles_with_boats = game.board.board.flatten.inject(0) do |sum, tile|
                          tile.boat ? sum + 1 : sum
                         end
      expected_tiles_with_boats = carrier.size + ship.size + boat.size
      expect(tiles_with_boats).to eql(expected_tiles_with_boats)
    end
  end

  describe '#shoot' do
    before do
      @game_with_boat = Game.new(boats: { Boat: 1,
                                          Ship: 0,
                                          Carrier: 0 },
                                 starting_shots: 50,
                                 board_height: 1,
                                 board_width: 1)
      @game_with_boat.shoot([0, 0])
      @tile = @game_with_boat.board.board[0][0]
      @game_without_boat = Game.new(boats: { Boat: 0,
                                             Ship: 0,
                                             Carrier: 0 },
                                    starting_shots: 50,
                                    board_height: 1,
                                    board_width: 1)
      @game_without_boat.shoot([0, 0])
    end
    it 'hits the tile at the given coordinates' do
      expect(@tile.hit).to be true
    end
    it 'does not deduct from shots_remaining if there is a boat on the Tile' do
      expect(@game_with_boat.shots_remaining).to eql(50)
    end
    it 'deducts from shots_remaining if there is not a boat on the Tile' do
      expect(@game_without_boat.shots_remaining).to eql(49)
    end
  end

  describe '#score' do
    let(:score) do
      seconds = 4
      num_tiles = 5
      time_now = Time.now + seconds
      game = Game.new(boats: { Boat: 0,
                               Ship: 0,
                               Carrier: 0 },
                      starting_shots: 50,
                      board_height: 1,
                      board_width: num_tiles)
      allow(Time).to receive(:now).and_return(time_now)
      num_tiles.times { |i| game.shoot([0, i]) }
      @expected_score = -(50 * num_tiles)/seconds
    end

    it 'calculates the score for the game' do
      expect(score).to eql(@expected_score)
    end
  end
end
