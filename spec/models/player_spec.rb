require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:won_matches).class_name('MatchResult').with_foreign_key('winner_id') }
    it { is_expected.to have_many(:lost_matches).class_name('MatchResult').with_foreign_key('loser_id') }
  end

  describe '#win_percentage' do
    it 'returns 0 when no matches' do
      p = Player.create!(name: 'Alice', wins_count: 0, losses_count: 0)
      expect(p.win_percentage).to eq(0)
    end

    it 'calculates percentage correctly' do
      p = Player.create!(name: 'Bob', wins_count: 3, losses_count: 1)
      expect(p.win_percentage).to eq(75.0)
    end
  end

  describe 'destroy restrictions' do
    it 'prevents destroy when player has matches and adds error' do
      winner = Player.create!(name: 'W', wins_count: 0, losses_count: 0)
      loser = Player.create!(name: 'L', wins_count: 0, losses_count: 0)
      MatchResult.create!(winner: winner, loser: loser)

      expect(winner.destroy).to be_falsey
      expect(winner.errors[:base]).to include(I18n.t('players.destroyed.restricted'))
    end
  end
end
