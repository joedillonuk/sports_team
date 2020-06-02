require_relative( '../db/sql_runner' )
require_relative( './team.rb')

class Player

  attr_reader :name, :country, :points_won, :team, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country = options['country']
    @points_won = options['points_won'].to_i
    @team = options['team'].to_i
  end

  def save()
    sql = "INSERT INTO players
    (
      name,
      country,
      points_won,
      team
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @country, @points_won, @team]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result.first()['id'].to_i
  end

  def update()
    sql = "
    UPDATE players SET (
      name,
      country,
      points_won,
      team
      ) =
      (
        $1,$2, $3, $4
      )
      WHERE id = $5"
      values = [@name, @country, @points_won, @team, @id]
      pg_result = SqlRunner.run(sql, values)
    end

    def current_team
        sql = "SELECT * FROM teams WHERE id = $1;"
        values = [@team]
        pg_result = SqlRunner.run(sql, values)
        result = Team.new(pg_result.first)
        return result
      end


  # Class methods

  def self.all()
    sql = "SELECT * FROM players"
    pg_result = SqlRunner.run( sql )
    return pg_result.map { |hash| Player.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM players
    WHERE id = $1"
    values = [id]
    pg_result = SqlRunner.run( sql, values )
    return Player.new( pg_result.first )
  end

  def self.delete_all
    sql = "DELETE FROM players"
    SqlRunner.run( sql )
  end




end
