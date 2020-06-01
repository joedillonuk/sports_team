require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/player.rb' )
require_relative('../models/team.rb')
also_reload( '../models' )




get '/players' do
  @teams = Team.all()
  @players = Player.all()
  erb ( :"players/index" )
end

get '/players/:id' do
  @player = Player.find(params['id'].to_i)
  erb( :"players/show_player" )
end



get '/newplayer' do
  @teams = Team.all()
  erb ( :"players/new")
end

post '/players' do
  @player = Player.new(params)
  @player.save()
  redirect to '/players'
end



# post 'players' do
#   @player = Player.new(params)
# @player.points_won = 0
# @player.team = nil
# @players.save
#   erb (:"players/index")
# end
