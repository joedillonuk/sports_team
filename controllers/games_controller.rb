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
  # remove the option to play game if game has already been played
  if @game.result != "TBC"
    @button = "hidden"
  else
    @button = "submit"
  end
  erb( :"games/show_game" )
end

get '/newfixture' do
  @games = Game.all()
  @teams = Team.all()
  erb ( :"games/new")
end

get '/playedyourself' do
  erb (:"games/playedyourself")
end

post '/games' do
  if params["home_team"] == params["away_team"]
    redirect to '/playedyourself'
  end
  @game = Game.new(params)
  @game.save()
  redirect to '/games'
end

post '/games/result/:id' do
  @game = Game.find(params['id'].to_i)

# Simply refresh page if play_game button is clicked again after game already played (should now be invisible)
  if @game.result != "TBC"
    redirect to "/games/#{params['id']}"
  end

  @result_array = @game.play_game()

  if @result_array[0] == @result_array[1]
    @game.result = "draw"
    @winner = @game.result
  elsif @result_array[0] > @result_array[1]
    @game.result = "#{@game.home_team}"
    @winner = @game.get_home_team.name
  elsif @result_array[0] < @result_array[1]
    @game.result = "#{@game.away_team}"
    @winner = @game.get_away_team.name
  else
  end

  @home_score = @result_array[0]
  @away_score = @result_array[1]
  @game.scorers = @result_array[2].to_s
  @game.update()
  redirect to "/games/#{params['id']}"
end
