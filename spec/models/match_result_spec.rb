require 'rails_helper'

RSpec.describe MatchResult, type: :model do
  describe 'validations' do
    it 'does not allow winner and loser to be the same' do
      p = Player.create!(name: 'Same')
      mr = MatchResult.new(winner: p, loser: p)
      expect(mr).not_to be_valid
      expect(mr.errors[:loser]).to include(I18n.t('match_results.errors.winner_and_loser_same'))
    end
  end

  describe 'counters' do
    it 'increments player counters on create' do
      w = Player.create!(name: 'W', wins_count: 0, losses_count: 0)
      l = Player.create!(name: 'L', wins_count: 0, losses_count: 0)
      MatchResult.create!(winner: w, loser: l)
      expect(w.reload.wins_count).to eq(1)
      expect(l.reload.losses_count).to eq(1)
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:winner).class_name('Player') }
    it { is_expected.to belong_to(:loser).class_name('Player') }
  end
end
