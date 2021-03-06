require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/miah_motors.rb' )
require_relative( '../models/dealership.rb' )
require_relative( '../models/vehicle.rb' )
also_reload( '../models/*' )

get "/vehicles" do
  @vehicles = Vehicle.all()
  erb ( :"vehicles/index" )
end

get '/vehicles/new' do
  @vehicles = Vehicle.all()
  @dealerships = Dealership.all()
  erb(:"vehicles/new")
end

post '/vehicles' do
  @vehicles = Vehicle.new(params)
  @vehicles.save()
  erb(:"vehicles/create")
end

get "/vehicles/:id/edit" do
  @vehicle = Vehicle.find(params["id"])
  @dealerships = Dealership.all()
  erb(:"vehicles/edit")
end

post "/vehicles/:id/purchase" do
  @vehicle = Vehicle.find(params["id"])
  @vehicle.purchase()
  redirect "/vehicles"
end

post "/vehicles/:id/sold" do
  @vehicle = Vehicle.find(params["id"])
  @vehicle.sold()
  redirect "/vehicles"
end

post "/vehicles/:id/delete" do
  @vehicle = Vehicle.find(params["id"])
  @vehicle.delete()
  redirect "/vehicles"
end

post "/vehicles/:id" do
  @vehicle = Vehicle.new(params)
  @vehicle.update()
  erb(:"vehicles/update")
end

get '/vehicles/:id' do
  @vehicle = Vehicle.find(params["id"])
  erb( :"vehicles/show" )
end
