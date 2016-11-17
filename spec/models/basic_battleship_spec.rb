require 'rails_helper'

RSpec.describe BasicBattleship, type: :model do
  describe '#sunk?' do
    it "identifies when a boat's health is 0" do
      sunk_boat = BasicBattleship.new(0, 'test')
      expect(sunk_boat.sunk?).to be true
    end
    it "identifies when a boat's health is not 0" do
      active_boat = BasicBattleship.new(1, 'test')
      expect(active_boat.sunk?).to be false
    end
  end
end
