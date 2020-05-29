require_relative( "../models/game.rb" )
require_relative( "../models/player.rb" )
require_relative( "../models/team.rb" )
require("pry-byebug")

Game.delete_all()
Player.delete_all()
Team.delete_all()

# Players

player1 = Player.new({
  "name" => "Ryu",
  "country" => "Japan",
  "points_won" => 0})

  player1.save()

  player2 = Player.new({
    "name" => "Ken",
    "country" => "USA",
    "points_won" => 0})

    player2.save()

    player3 = Player.new({
      "name" => "Zangief",
      "country" => "Russia",
      "points_won" => 0})

      player3.save()

      # Teams

team1 = Team.new({


})




      # Games
