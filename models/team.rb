require_relative( '../db/sql_runner' )

class Team

  attr_reader :name, :country, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country = options['country']
  end


  def save()
    sql = "INSERT INTO teams
    (
      name,
      country
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @country]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result.first()['id'].to_i
  end


  def update()
    sql = "
    UPDATE teams SET (
      name,
      country
      ) =
      (
        $1,$2
      )
      WHERE id = $3"
      values = [@name, @country, @id]
      pg_result = SqlRunner.run(sql, values)
      updated_team = pg_result[0]
      @id = updated_team['id'].to_i
    end



  # Class methods

  def self.all()
    sql = "SELECT * FROM teams"
    pg_result = SqlRunner.run( sql )
    return pg_result.map { |hash| Team.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM teams
    WHERE id = $1"
    values = [id]
    pg_result = SqlRunner.run( sql, values )
    return Team.new( pg_result.first )
  end

  def self.delete_all
    sql = "DELETE FROM teams"
    SqlRunner.run( sql )
  end



end
