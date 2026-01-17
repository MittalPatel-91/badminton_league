# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Sample seed data for badminton league
player_names = [ "Alice", "Bob", "Carol", "Dave" ]
players = player_names.map { |n| Player.find_or_create_by!(name: n) }

# Create some sample matches
MatchResult.find_or_create_by!(winner: players[0], loser: players[1])
MatchResult.find_or_create_by!(winner: players[2], loser: players[3])
MatchResult.find_or_create_by!(winner: players[0], loser: players[2])
MatchResult.find_or_create_by!(winner: players[1], loser: players[3])

# Ensure cached counters match seeded match results
Player.find_each do |p|
  wins = MatchResult.where(winner_id: p.id).count
  losses = MatchResult.where(loser_id: p.id).count
  p.update!(wins_count: wins, losses_count: losses)
end
