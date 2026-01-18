require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  describe 'POST #create' do
    it 'creates player and redirects with notice' do
      post :create, params: { player: { name: 'NewP' } }
      expect(response).to redirect_to(players_path)
      expect(flash[:notice]).to eq(I18n.t('players.created.successfully'))
    end
  end

  describe 'DELETE #destroy' do
    it 'prevents destroy and redirects with alert when player has matches' do
      w = Player.create!(name: 'W2', wins_count: 0, losses_count: 0)
      l = Player.create!(name: 'L2', wins_count: 0, losses_count: 0)
      MatchResult.create!(winner: w, loser: l)

      delete :destroy, params: { id: w.id }
      expect(response).to redirect_to(players_path)
      expect(flash[:alert]).to be_present
    end
  end
end
