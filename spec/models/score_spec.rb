require 'rails_helper'

RSpec.describe Score, type: :model do
  describe Score, '.top' do
    it 'returns the top ten scores by default' do
      user = User.create(email: 'test@me.com', password: 'password123')
      results = [11.1, 10.1, 9.1, 8.1, 7.1, 6.1, 5.1, 4.1, 3.1, 2.1, 1.1]
      scores = results.map { |r| Score.create(result: r, user_id: user.id) }

      top10 = Score.top

      expect(top10).to match_array scores[0...10]
    end

    it 'returns the top 3 scores' do
      user = User.create(email: 'test@me.com', password: 'password123')
      results = [2.5, 2.4, 2.3]
      scores = results.map { |r| Score.create(result: r, user_id: user.id) }

      top3 = Score.top(3)

      expect(top3).to match_array scores
    end
  end
end
