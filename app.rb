require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('controllers/manufacturer_controller')
require_relative('controllers/miah_motors_controller')
require_relative('controllers/vehicles_controller')

get '/' do
  erb( :homepage )
end
