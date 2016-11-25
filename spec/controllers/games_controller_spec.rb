require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET #new' do
    it 'return a 200 OK status' do
      get :new

      expect(response).to have_http_status(:ok)
    end

    it 'sets a new game in the session' do
      get :new

      expect(controller.session[:game]).to be_a Game
    end
  end

  describe 'PUT #update' do
    it 'fires at the given coordinates in the game' do
      get :new

      expect(controller.session[:game]).to receive(:shoot).with([0, 0])

      put :update, params: { coordinates: [0, 0] }
    end
  end
end
