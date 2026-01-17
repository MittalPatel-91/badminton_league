class LeaderboardsController < ApplicationController
  def index
    @players = Player.all.to_a
    @players.sort_by! { |p| -p.wins_count }
  end
end
