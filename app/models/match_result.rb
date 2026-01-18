class MatchResult < ApplicationRecord
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  validate :winner_and_loser_different

  after_commit :increment_counters_on_create, on: :create

  private

  def winner_and_loser_different
    return if winner_id.blank? || loser_id.blank?

    if winner_id == loser_id
      errors.add(:loser, I18n.t("match_results.errors.winner_and_loser_same"))
    end
  end

  def increment_counters_on_create
    Player.increment_counter(:wins_count, winner_id) if winner_id
    Player.increment_counter(:losses_count, loser_id) if loser_id
  end
end
