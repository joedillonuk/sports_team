require_relative( '../db/sql_runner' )

class Player

  attr_reader :name, :country, :points_won, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country = options['country']
    @points_won = options['points_won']
  end

  def save()
    sql = "INSERT INTO players
    (
      name,
      country,
      points_won
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @country, @points_won]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result.first()['id'].to_i
  end








end
