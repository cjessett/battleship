require 'rails_helper'

RSpec.describe ScoresController, type: :controller do
  describe 'GET #index' do
    it 'returns a 200 OK status' do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:user) { User.create(email: 'test@me.com', password: 'password123') }
    let(:game) { Game.new }

    before do
      sign_in user
      allow(game).to receive(:score) { 2.3 }
    end

    it 'saves the score from the session' do
      session = { game: game, user: user }

      expect { post :create, session: session }.to change(Score, :count).by(1)
    end

    it 'redirects to the scores path' do
      post :create, session: { game: game, user: user }

      expect(response).to redirect_to scores_path
    end
  end
end
