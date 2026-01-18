class Player < ApplicationRecord
  has_many :won_matches,
           class_name: "MatchResult",
           foreign_key: "winner_id"

  has_many :lost_matches,
           class_name: "MatchResult",
           foreign_key: "loser_id"

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_destroy :prevent_destroy_if_matches

  def win_percentage
    total = wins_count + losses_count
    return 0.0 if total.zero?
    (wins_count.to_f / total * 100).round(1)
  end

  private

  def prevent_destroy_if_matches
    if won_matches.exists? || lost_matches.exists?
      errors.add(:base, I18n.t("players.destroyed.restricted"))
      throw(:abort)
    end
  end
end
