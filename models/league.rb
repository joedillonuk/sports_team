require_relative( '../db/sql_runner' )
require_relative( './player.rb')

class League

  attr_accessor :team_id, :scored, :conceded, :games_played, :wins, :draws, :id


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @team_id = options['team_id'].to_i
    @scored = options['scored'].to_i
    @conceded = options['conceded'].to_i
    @games_played = options['games_played'].to_i
    @wins = options['wins'].to_i
    @draws = options['draws'].to_i
  end

  def save()
    sql = "INSERT INTO leagues
    (
      team_id,
      scored,
      conceded,
      games_played,
      wins,
      draws
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@team_id, @scored, @conceded, @games_played, @wins, @draws]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result.first()['id'].to_i
  end

  def update()
    sql = "
    UPDATE leagues SET (
      team_id,
      scored,
      conceded,
      games_played,
      wins,
      draws
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7"
      values = [@team_id, @scored, @conceded, @games_played, @wins, @draws, @id]
      pg_result = SqlRunner.run(sql, values)
    end








    # Class methods

    def self.all()
      sql = "SELECT * FROM leagues"
      pg_result = SqlRunner.run( sql )
      return pg_result.map { |league| League.new( league ) }
    end

    def self.find( id )
      sql = "SELECT * FROM leagues
      WHERE id = $1"
      values = [id]
      pg_result = SqlRunner.run( sql, values )
      return League.new( pg_result.first )
    end

    def self.delete_all
      sql = "DELETE FROM leagues"
      SqlRunner.run( sql )
    end



  end
