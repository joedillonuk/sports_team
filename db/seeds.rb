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
  "slogan" => "We must train harder."
  })

  team1.save()

  team2 = Team.new({
    "name" => "Muscles",
    "slogan" => "MUSCLE POWER!"
    })

    team2.save()

    team3 = Team.new({
      "name" => "Zoners",
      "slogan" => "Keep your distance."
      })

      team3.save()

      team4 = Team.new({
        "name" => "Rushdown",
        "slogan" => "Give it all you've got!"
        })

        team4.save()

        team5 = Team.new({
          "name" => "Chargers",
          "slogan" => "We'll immediately back-down."
          })

          team5.save()

          team6 = Team.new({
            "name" => "Saikyo",
            "slogan" => "SAIKYO!"
            })

            team6.save()

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
                  "name" => "Sean",
                  "country" => "Brazil",
                  "points_won" => 0,
                  "team" => team1.id
                  })

                  player3.save()


                  player4 = Player.new({
                    "name" => "Zangief",
                    "country" => "Russia",
                    "points_won" => 0,
                    "team" => team2.id
                    })

                    player4.save()

                    player5 = Player.new({
                      "name" => "Harmageddon",
                      "country" => "Japan",
                      "points_won" => 0,
                      "team" => team2.id
                      })

                      player5.save()

                      player6 = Player.new({
                        "name" => "Hakan",
                        "country" => "Tukey",
                        "points_won" => 0,
                        "team" => team2.id
                        })

                        player6.save()

                        player7 = Player.new({
                          "name" => "Dhalsim",
                          "country" => "India",
                          "points_won" => 0,
                          "team" => team3.id
                          })

                          player7.save()

                          player8 = Player.new({
                            "name" => "Menat",
                            "country" => "Egypt",
                            "points_won" => 0,
                            "team" => team3.id
                            })

                            player8.save()

                            player9 = Player.new({
                              "name" => "Sagat",
                              "country" => "Thailand",
                              "points_won" => 0,
                              "team" => team3.id
                              })

                              player9.save()

                              player10 = Player.new({
                                "name" => "Rufus",
                                "country" => "USA",
                                "points_won" => 0,
                                "team" => team4.id
                                })

                                player10.save()

                                player11 = Player.new({
                                  "name" => "Ibuki",
                                  "country" => "Japan",
                                  "points_won" => 0,
                                  "team" => team4.id
                                  })

                                  player11.save()

                                  player12 = Player.new({
                                    "name" => "Cammy",
                                    "country" => "UK",
                                    "points_won" => 0,
                                    "team" => team4.id
                                    })

                                    player12.save()

                                    player13 = Player.new({
                                      "name" => "Guile",
                                      "country" => "USA",
                                      "points_won" => 0,
                                      "team" => team5.id
                                      })

                                      player13.save()

                                      player14 = Player.new({
                                        "name" => "Bison",
                                        "country" => "Unknown",
                                        "points_won" => 0,
                                        "team" => team5.id
                                        })

                                        player14.save()

                                        player15 = Player.new({
                                          "name" => "Urien",
                                          "country" => "Unknown",
                                          "points_won" => 0,
                                          "team" => team5.id
                                          })

                                          player15.save()

                                          player16 = Player.new({
                                            "name" => "Dan",
                                            "country" => "Hong Kong",
                                            "points_won" => 0,
                                            "team" => team6.id
                                            })

                                            player16.save()

                                            player17 = Player.new({
                                              "name" => "Blanka",
                                              "country" => "Brazil",
                                              "points_won" => 0,
                                              "team" => team6.id
                                              })

                                              player17.save()

                                              player18 = Player.new({
                                                "name" => "Yuriko",
                                                "country" => "Hong Kong",
                                                "points_won" => 0,
                                                "team" => team6.id
                                                })

                                                player18.save()



                                                # Games

                                                game1 = Game.new({
                                                  "date" => "2020-07-01",
                                                  "home_team" => team1.id,
                                                  "away_team" => team2.id,
                                                  "home_result" => 0,
                                                  "away_result" => 0,
                                                  "result" => "TBC",
                                                  "scorers" => ""
                                                  })

                                                  game1.save()

                                                  game2 = Game.new({
                                                    "date" => "2020-07-02",
                                                    "home_team" => team2.id,
                                                    "away_team" => team1.id,
                                                    "home_result" => 0,
                                                    "away_result" => 0,
                                                    "result" => "TBC",
                                                    "scorers" => ""
                                                    })


                                                    game2.save()

                                                    game3 = Game.new({
                                                      "date" => "2020-07-03",
                                                      "home_team" => team3.id,
                                                      "away_team" => team4.id,
                                                      "home_result" => 0,
                                                      "away_result" => 0,
                                                      "result" => "TBC",
                                                      "scorers" => ""
                                                      })

                                                      game3.save()

                                                      game4 = Game.new({
                                                        "date" => "2020-07-04",
                                                        "home_team" => team4.id,
                                                        "away_team" => team3.id,
                                                        "home_result" => 0,
                                                        "away_result" => 0,
                                                        "result" => "TBC",
                                                        "scorers" => ""
                                                        })


                                                        game4.save()
