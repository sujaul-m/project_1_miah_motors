require_relative( '../db/sql_runner' )

class MiahMotors

  attr_reader( :vehicle_id, :manufacturer_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @vehicle_id = options['vehicle_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
  end

  def save()
    sql = "INSERT INTO miah_motors
    (
      vehicle_id,
      manufacturer_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@vehicle_id, @manufacturer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM miah_motors"
    results = SqlRunner.run( sql )
    return results.map { |inventory| MiahMotors.new( inventory ) }
  end

  def vehicle()
    sql = "SELECT * FROM vehicles
    WHERE id = $1"
    values = [@vehicle_id]
    results = SqlRunner.run( sql, values )
    return Vehicle.new( results.first )
  end


end
