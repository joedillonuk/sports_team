require('minitest/autorun')
require('minitest/reporters')
require_relative('../game.rb')
require_relative('../team.rb')
require_relative('../player.rb')
require_relative( '../../db/sql_runner' )

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestGame < MiniTest::Test
  def setup()

    # Teams

    @team1 = Team.new({
      "name" => "Shotos",
      "country" => "Japan"
      })



      @team2 = Team.new({
        "name" => "Muscles",
        "country" => "Russia"
        })



    # Players

    @player1 = Player.new({
      "name" => "Ryu",
      "country" => "Japan",
      "points_won" => 0,
      "team" => @team1.id
      })



      @player2 = Player.new({
        "name" => "Akuma",
        "country" => "Japan",
        "points_won" => 0,
        "team" => @team1.id})



        @player3 = Player.new({
          "name" => "Zangief",
          "country" => "Russia",
          "points_won" => 0,
          "team" => @team2.id
          })



          @player4 = Player.new({
            "name" => "Decapre",
            "country" => "Russia",
            "points_won" => 0,
            "team" => @team2.id
            })








              # Games

              @game1 = Game.new({
                "date" => "2020-07-01",
                "home_team" => @team1.id,
                "away_team" => @team2.id,
                "result" => "TBC",
                "scorers" => "[]"
                })



                @game2 = Game.new({
                  "date" => "2020-07-02",
                  "home_team" => @team2.id,
                  "away_team" => @team1.id,
                  "result" => "TBC",
                  "scorers" => "[]"
                  })




end


def test_play_game()
result = @game1.play_game()
  assert_equal(3, result)
end







end
