require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/game.rb' )
also_reload( '../models/*' )

get '/games' do
  @teams = Team.all()
  @players = Player.all()
  @games = Game.all()
  erb ( :"games/index" )
end



# The Below has not yet been implemented
get '/players/:id' do
  @player = Player.find(params['id'].to_i)
  erb( :"players/show" )
end
