class MatchResult < ApplicationRecord
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  validates :winner, presence: true
  validates :loser, presence: true
  validate :winner_and_loser_different

  after_commit :increment_counters_on_create, on: :create
  after_commit :decrement_counters_on_destroy, on: :destroy

  private

  def winner_and_loser_different
    return if winner_id.blank? || loser_id.blank?

    errors.add(:loser, "must be different from winner") if winner_id == loser_id
  end

  def increment_counters_on_create
    Player.increment_counter(:wins_count, winner_id) if winner_id
    Player.increment_counter(:losses_count, loser_id) if loser_id
  end

  def decrement_counters_on_destroy
    Player.decrement_counter(:wins_count, winner_id) if winner_id
    Player.decrement_counter(:losses_count, loser_id) if loser_id
  end
end
