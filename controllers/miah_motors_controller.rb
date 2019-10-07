require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/miah_motors.rb' )
require_relative( '../models/dealership.rb' )
require_relative( '../models/vehicle.rb' )
also_reload( '../models/*' )

get "/inventory" do
  @stocks = MiahMotors.all()
  erb ( :"miah_motors/index" )
end

get '/inventory/new' do
  @vehicles = Vehicle.all
  @dealerships = Dealership.all
  erb(:"miah_motors/new")
end

get "/inventory/order" do
  @stocks = MiahMotors.all()
  erb ( :"miah_motors/index_order" )
end


post '/inventory' do
  inventory = MiahMotors.new(params)
  inventory.save
  redirect to("/inventory")
end

post '/inventory/:id/delete' do
  MiahMotors.delete(params[:id])
  redirect to("/inventory")
end
