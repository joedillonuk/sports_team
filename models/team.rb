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








end
