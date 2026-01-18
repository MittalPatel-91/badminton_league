# frozen_string_literal: true

class LeaderboardsController < ApplicationController
  def index
    # Order players first by wins_count desc, secondary by total matches asc
    @players = Player.order(wins_count: :desc)
                     .order(Arel.sql("(wins_count + losses_count) ASC"))
                     .to_a
  end
end
