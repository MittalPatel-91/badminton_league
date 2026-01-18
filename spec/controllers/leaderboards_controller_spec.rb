require 'rails_helper'

RSpec.describe LeaderboardsController, type: :controller do
  describe 'GET #index' do
    it 'orders players by wins_count desc then total matches asc' do
      p1 = Player.create!(name: 'A', wins_count: 3, losses_count: 1)
      p2 = Player.create!(name: 'B', wins_count: 3, losses_count: 0)
      p3 = Player.create!(name: 'C', wins_count: 2, losses_count: 0)

      get :index
      # wins_count ties for p1 and p2; secondary ordering is total matches ASC
      expect(assigns(:players).first).to eq(p2)
      expect(assigns(:players).second).to eq(p1)
      expect(assigns(:players).third).to eq(p3)
    end
  end
end
