# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


League.create(name: "League1")

User.create(username: "Owner1", user_type: "owner", password_digest: "abc123")
User.create(username: "Owner2", user_type: "owner", password_digest: "abc123")
User.create(username: "Owner3", user_type: "owner", password_digest: "abc123")
User.create(username: "Analyst1", user_type: "analyst", password_digest: "abc123")
User.create(username: "Analyst2", user_type: "analyst", password_digest: "abc123")
User.create(username: "Analyst3", user_type: "analyst", password_digest: "abc123")


Team.create(name: "Team1", owner_id: 1, league_id: 1)
Team.create(name: "Team2", owner_id: 2, league_id: 1)
Team.create(name: "Team3", owner_id: 3, league_id: 1)

Player.create(name: "Tom Brady", position: "QB")
Player.create(name: "Aaron Rodgers", position: "QB")
Player.create(name: "Drew Brees", position: "QB")
Player.create(name: "Ezekiel Elliot", position: "RB")
Player.create(name: "Austin Ekeler", position: "RB")
Player.create(name: "Saquon Barkley", position: "RB")
Player.create(name: "Michael Thomas", position: "WR")
Player.create(name: "Davante Adams", position: "WR")
Player.create(name: "Mike Evans", position: "WR")
Player.create(name: "Julio Jones", position: "WR")

10.times do
  PlayerTeam.create(player_id: Player.all.sample.id, team_id: Team.all.sample.id)
end

10.times do
  Ranking.create(analyst_id: rand(4..6), player_id: Player.all.sample.id, ranking: rand(1..10))
end
