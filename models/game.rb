require_relative( '../db/sql_runner' )

class Game

  attr_reader :date, :home_team, :away_team, :result, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @date = options['date']
    @home_team = options['home_team'].to_i
    @away_team = options['away_team'].to_i
    @result = options['result']
  end

  def save()
      sql = "INSERT INTO games
      (
        date,
        home_team,
        away_team,
        result
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING id"
      values = [@date, @home_team, @away_team, @result]
      pg_result = SqlRunner.run(sql, values)
      @id = pg_result.first()['id'].to_i
    end








end
