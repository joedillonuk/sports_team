require_relative( "../models/game.rb" )
require_relative( "../models/player.rb" )
require_relative( "../models/team.rb" )
require("pry-byebug")

Game.delete_all()
Player.delete_all()
Team.delete_all()


# Teams

team1 = Team.new({
  "name" => "Shotos",
  "country" => "Japan"
  })

  team1.save()

  team2 = Team.new({
    "name" => "Muscles",
    "country" => "Russia"
    })

    team2.save()

# Players

player1 = Player.new({
  "name" => "Ryu",
  "country" => "Japan",
  "points_won" => 0,
  "team" => team1.id
  })

  player1.save()

  player2 = Player.new({
    "name" => "Akuma",
    "country" => "Japan",
    "points_won" => 0,
    "team" => team1.id})

    player2.save()

    player3 = Player.new({
      "name" => "Zangief",
      "country" => "Russia",
      "points_won" => 0,
      "team" => team2.id
      })

      player3.save()

      player4 = Player.new({
        "name" => "Decapre",
        "country" => "Russia",
        "points_won" => 0,
        "team" => team2.id
        })

        player4.save()






          # Games

          game1 = Game.new({
            "date" => "2020-07-01",
            "home_team" => team1.id,
            "away_team" => team2.id,
            "result" => "TBC",
            "scorers" => "player1.id"
            })

            game1.save()

            game2 = Game.new({
              "date" => "2020-07-02",
              "home_team" => team2.id,
              "away_team" => team1.id,
              "result" => "TBC",
              "scorers" => ""
              })


              game2.save()
