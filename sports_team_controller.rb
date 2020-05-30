require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/player.rb')
require_relative('./models/team.rb')
require_relative('./models/game.rb')
also_reload('./models')


get '/' do
  erb(:index)
end
