require_relative( '../db/sql_runner' )

class MiahMotors

  attr_reader( :vehicle_id, :manufacturer_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @vehicle_id = options['vehicle_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
  end


end
