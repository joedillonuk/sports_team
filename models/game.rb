require_relative( '../db/sql_runner' )
require_relative( './player.rb')

class Game

  attr_reader :date, :home_team, :away_team, :result, :id
  attr_writer :result, :scorers


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @date = options['date']
    @home_team = options['home_team'].to_i
    @away_team = options['away_team'].to_i
    @result = options['result']
    @scorers = options['scorers']
  end

  def save()
    sql = "INSERT INTO games
    (
      date,
      home_team,
      away_team,
      result,
      scorers
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@date, @home_team, @away_team, @result, @scorers]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result.first()['id'].to_i
  end

  def update()
    sql = "
    UPDATE games SET (
      date,
      home_team,
      away_team,
      result,
      scorers
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@date, @home_team, @away_team, @result, @scorers, @id]
      pg_result = SqlRunner.run(sql, values)
    end

    def get_home_team()
      sql = "SELECT * FROM teams WHERE id = $1;"
      values = [@home_team]
      pg_result = SqlRunner.run(sql, values)
      result = Team.new(pg_result.first)
      return result
    end

    def get_away_team()
      sql = "SELECT * FROM teams WHERE id = $1;"
      values = [@away_team]
      pg_result = SqlRunner.run(sql, values)
      result = Team.new(pg_result.first)
      return result
    end


# Testing - no longer being used
    # def play_game_random()
    #
    #   winner = rand(2)
    #   if winner == 0
    #     return "#{self.get_home_team.name} wins #{winner}"
    #   end
    #   return "#{self.get_away_team.name} wins #{winner}"
    # end

    def play_game()
      scorers_array = []
      home = self.get_home_team
      away = self.get_away_team
      home_score = 0
      away_score = 0
      for player in home.current_players
        for opponent in away.current_players
          chance = rand(4)
          if chance == 0
            scorers_array.push(player.name)
            home_score += 1
          elsif chance == 1
            scorers_array.push(opponent.name)
            away_score += 1
          else
          end
        end
      end
result_array = [home_score, away_score, scorers_array]
      result = "the score is #{home.name} #{home_score} - #{away_score} #{away.name}"
      return result_array
    end







    # Class methods

    def self.all()
      sql = "SELECT * FROM games"
      pg_result = SqlRunner.run( sql )
      return pg_result.map { |hash| Game.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM games
      WHERE id = $1"
      values = [id]
      pg_result = SqlRunner.run( sql, values )
      return Game.new( pg_result.first )
    end

    def self.delete_all
      sql = "DELETE FROM games"
      SqlRunner.run( sql )
    end



  end
