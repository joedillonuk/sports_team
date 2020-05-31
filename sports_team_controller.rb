require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/player.rb')
require_relative('./models/team.rb')
require_relative('./models/game.rb')
require_relative('controllers/players_controller')
require_relative('controllers/teams_controller')
require_relative('controllers/games_controller')

also_reload('./models')


get '/' do
  erb(:index)
end
