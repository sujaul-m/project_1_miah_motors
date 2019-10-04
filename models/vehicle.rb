require_relative( '../db/sql_runner' )

class Vehicle

  attr_reader( :make, :model, :selling_price, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @make = options['make']
    @model = options['model']
    @selling_price = options['selling_price']
  end


end
