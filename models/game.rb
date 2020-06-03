require_relative( '../db/sql_runner' )
require_relative( './player.rb')

class Game

  attr_reader :date, :home_team, :away_team, :home_result, :away_result, :result, :scorers, :id
  attr_writer :date, :home_team, :away_team, :home_result, :away_result, :result, :scorers, :id


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @date = options['date']
    @home_team = options['home_team'].to_i
    @away_team = options['away_team'].to_i
    @home_result = options['home_result'].to_i
    @away_result = options['away_result'].to_i
    @result = options['result']
    @scorers = options['scorers']
  end

  def save()
    sql = "INSERT INTO games
    (
      date,
      home_team,
      away_team,
      home_result,
      away_result,
      result,
      scorers
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@date, @home_team, @away_team, @home_result, @away_result, @result, @scorers]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result.first()['id'].to_i
  end

  def update()
    sql = "
    UPDATE games SET (
      date,
      home_team,
      away_team,
      home_result,
      away_result,
      result,
      scorers
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
      WHERE id = $8"
      values = [@date, @home_team, @away_team, @home_result, @away_result, @result, @scorers, @id]
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


    def result_for_team(team_name)
      string = "nothing"
      if self.result == "TBC"
        string = "TBC"
      elsif self.result == "draw"
          string = "Draw"
      elsif self.result == team_name
        string = "Win"
      else
        string = "Loss"
      end
      return string
    end




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
            player.points_won += 1
            player.update()
            home_score += 1
          elsif chance == 1
            scorers_array.push(opponent.name)
            opponent.points_won += 1
            opponent.update()
            away_score += 1
          else
          end
        end
      end

      self.home_result = home_score
      self.away_result = away_score

      if self.home_result == self.away_result
        self.result = "draw"
      elsif self.home_result > self.away_result
        self.result = "#{self.get_home_team.name}"
      elsif self.home_result < self.away_result
        self.result = "#{self.get_away_team.name}"
      else
      end

      self.scorers = scorers_array.to_s
      self.update()

      result_array = [home_score, away_score, scorers_array]
      result_summary = "The final score is #{home.name} #{home_score} - #{away_score} #{away.name}. #{self.result} win!"
      return result_summary
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
