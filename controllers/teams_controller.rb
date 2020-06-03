require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/team.rb' )
require_relative( '../models/player.rb' )
also_reload( '../models/*' )

get '/teams' do
  @teams = Team.all()
  @players = Player.all()
  erb ( :"teams/index" )
end

get '/teams/:id' do
  @team = Team.find(params['id'].to_i)
  @players = @team.current_players()
  erb( :"teams/show_team" )
end

post '/teams/:id' do
  @team = Team.new(params)
  @team.update()
  redirect to "teams/#{params['id']}"
end


get '/teams/edit/:id' do
  @team = Team.find(params['id'].to_i)
  erb( :"teams/edit")
end




get '/newteam' do
  @teams = Team.all()
  erb ( :"teams/new")
end

get '/fixtures/:id' do
  @team = Team.find(params['id'].to_i)
  @scheduled_games = @team.scheduled_games()
  erb( :"teams/fixtures")
end

post '/teams' do
  @team = Team.new(params)
  @team.save()
  redirect to '/teams'
end
