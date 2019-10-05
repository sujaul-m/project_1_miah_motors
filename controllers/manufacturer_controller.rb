require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/miah_motors.rb' )
require_relative( '../models/manufacturer.rb' )
require_relative( '../models/vehicle.rb' )
also_reload( '../models/*' )

get "/manufacturers" do
  @manufacturers = Manufacturer.all()
  erb ( :"manufacturer/index" )
end

get '/manufacturers/new' do
  @@manufacturers = Manufacturer.all()
  erb(:"manufacturer/new")
end


post '/manufacturers' do
  @manufacturers = Manufacturer.new(params)
  @manufacturers.save()
  erb(:"manufacturer/create")
end

get "/manufacturers/:id/edit" do
  @manufacturer = Manufacturer.find(params["id"])
  erb(:"manufacturer/edit")
end

post "/manufacturers/:id/delete" do
  @manufacturer = Manufacturer.find(params["id"])
  @manufacturer.delete()
  redirect "/manufacturers"
end

post "/manufacturers/:id" do
  @manufacturers = Manufacturer.new(params)
  @manufacturers.update()
  erb(:"manufacturer/update")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params["id"])
  erb( :"manufacturer/show" )
end
