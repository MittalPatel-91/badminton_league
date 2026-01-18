require 'rails_helper'

RSpec.describe MatchResultsController, type: :controller do
  describe 'POST #create' do
    let!(:p1) { Player.create!(name: 'P1', wins_count: 0, losses_count: 0) }
    let!(:p2) { Player.create!(name: 'P2', wins_count: 0, losses_count: 0) }

    it 'creates match and redirects with notice' do
      post :create, params: { match_result: { winner_id: p1.id, loser_id: p2.id } }
      expect(response).to redirect_to(match_results_path)
      expect(flash[:notice]).to eq(I18n.t('match_results.created.successfully'))
    end

    it 'renders new and sets flash alert on validation failure' do
      post :create, params: { match_result: { winner_id: p1.id, loser_id: p1.id } }
      expect(response).to render_template(:new)
      expect(flash[:alert]).to be_present
    end
  end
end
