require_relative( '../db/sql_runner' )

class Vehicle

  attr_reader( :make, :model, :purchase_price, :selling_price, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @make = options['make']
    @model = options['model']
    @purchase_price = options['purchase_price']
    @selling_price = options['selling_price']
  end

  def save()
    sql = "INSERT INTO vehicles
    (
      make,
      model,
      selling_price
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@make, @model, @selling_price]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE vehicles
    SET
    (
      make,
      model,
      selling_price
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@make, @model, @selling_price, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM vehicles
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM vehicles;"
    results = SqlRunner.run( sql )
    return results.map { |vehicle| Vehicle.new( vehicle ) }
  end

  def self.delete_all()
    sql = "DELETE FROM vehicles;"
    SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM vehicles WHERE id = $1;"
    values = [id]
    vehicle = SqlRunner.run( sql, values )
    result = Vehicle.new( vehicle.first )
    return result
  end


end
