require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/miah_motors.rb' )
require_relative( '../models/manufacturer.rb' )
require_relative( '../models/vehicle.rb' )
also_reload( '../models/*' )

get "/vehicles" do
  @vehicles = Vehicle.all()
  erb ( :"vehicles/index" )
end

get '/vehicles/new' do
  @vehicles = Vehicle.all()
  erb(:"vehicles/new")
end

post '/vehicles' do
  @vehicles = Vehicle.new(params)
  @vehicles.save()
  erb(:"vehicles/create")
end
