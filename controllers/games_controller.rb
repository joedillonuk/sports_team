require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/game.rb' )
require_relative( '../models/player.rb' )
require_relative('../models/team.rb')
also_reload( '../models/*' )

get '/games' do
  @teams = Team.all()
  @players = Player.all()
  @games = Game.all()
  erb ( :"games/index" )
end

get '/games/:id' do
  @game = Game.find(params['id'].to_i)
  erb( :"games/show_game" )
end

get '/newfixture' do
  @games = Game.all()
  erb ( :"games/new")
end
