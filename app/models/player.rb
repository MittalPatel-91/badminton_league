class Player < ApplicationRecord
  has_many :won_matches,
           class_name: "MatchResult",
           foreign_key: "winner_id",
           dependent: :restrict_with_error

  has_many :lost_matches,
           class_name: "MatchResult",
           foreign_key: "loser_id",
           dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

  # def wins_count
  #   won_matches.count
  # end

  # def losses_count
  #   lost_matches.count
  # end

  def win_percentage
    total = wins_count + losses_count
    return 0 if total.zero?
    (wins_count.to_f / total * 100).round(1)
  end
end
