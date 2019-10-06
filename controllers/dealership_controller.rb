require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/miah_motors.rb' )
require_relative( '../models/dealership.rb' )
require_relative( '../models/vehicle.rb' )
also_reload( '../models/*' )

get "/dealerships" do
  @dealerships = Dealership.all()
  erb ( :"dealership/index" )
end

get '/dealerships/new' do
  @dealerships = Dealership.all()
  erb(:"dealership/new")
end


post '/dealerships' do
  @dealerships = Dealership.new(params)
  @dealerships.save()
  erb(:"dealership/create")
end

get "/dealerships/:id/edit" do
  @dealership = Dealership.find(params["id"])
  erb(:"dealership/edit")
end

post "/dealerships/:id/delete" do
  @dealership = Dealership.find(params["id"])
  @dealership.delete()
  redirect "/dealerships"
end

post "/dealerships/:id" do
  @dealership = Dealership.new(params)
  @dealership.update()
  erb(:"dealership/update")
end

get '/dealerships/:id' do
  @dealership = Dealership.find(params["id"])
  erb( :"dealership/show" )
end
