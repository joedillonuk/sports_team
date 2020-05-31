require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/team.rb' )
also_reload( '../models/*' )

get '/teams' do
  @teams = Team.all()
  @players = Player.all()
  erb ( :"teams/index" )
end



# The Below has not yet been implemented
get '/players/:id' do
  @player = Player.find(params['id'].to_i)
  erb( :"players/show" )
end
