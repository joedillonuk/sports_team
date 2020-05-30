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
