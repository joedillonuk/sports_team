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

    def update()
      sql = "
      UPDATE games SET (
        date,
        home_team,
        away_team,
        result
        ) =
        (
          $1,$2, $3, $4
        )
        WHERE id = $5"
        values = [@date, @home_team, @away_team, @result, @id]
        pg_result = SqlRunner.run(sql, values)
        updated_game = pg_result[0]
        @id = updated_game['id'].to_i
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
