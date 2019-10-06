require_relative( '../db/sql_runner' )

class MiahMotors

  attr_reader( :vehicle_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @vehicle_id = options['vehicle_id'].to_i
  end

  def save()
    sql = "INSERT INTO miah_motors
    (
      vehicle_id
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@vehicle_id]
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

  def manufacturer()
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [@manufacturer_id]
    results = SqlRunner.run( sql, values )
    return Manufacturer.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM miah_motors"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM miah_motors
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  # def order_stock(min_stock, quantity)
  #   sql = "select vehicles.* from vehicles where (min_stock = $1) > (quantity = $2);"
  #   values = [min_stock, quantity]
  #   results = SqlRunner.run( sql, values )
  #   return results.map { |vehicle| Vehicle.new( vehicle ) }
  # end


end
