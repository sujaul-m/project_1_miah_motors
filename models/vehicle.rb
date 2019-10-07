require_relative( '../db/sql_runner' )

class Vehicle

  attr_reader( :dealership_id, :make, :model, :min_stock, :quantity, :purchase_price, :selling_price, :image, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @dealership_id = options['dealership_id'].to_i
    @make = options['make']
    @model = options['model']
    @min_stock = options['min_stock']
    @quantity = options['quantity']
    @purchase_price = options['purchase_price']
    @selling_price = options['selling_price']
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO vehicles
    (
      dealership_id,
      make,
      model,
      min_stock,
      quantity,
      purchase_price,
      selling_price,
      image
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@dealership_id, @make, @model, @min_stock, @quantity, @purchase_price, @selling_price, @image]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE vehicles
    SET
    (
      dealership_id,
      make,
      model,
      min_stock,
      quantity,
      purchase_price,
      selling_price,
      image
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    WHERE id = $9"
    values = [@dealership_id, @make, @model, @min_stock, @quantity, @purchase_price, @selling_price, @image, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM vehicles
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def purchase()
    sql = "UPDATE vehicles SET quantity = quantity + 1 WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def sold()
    sql = "UPDATE vehicles SET quantity = quantity - 1 WHERE id = $1"
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

  def get_dealership_name
    sql = "SELECT name FROM dealerships WHERE id = $1"
    values = [@dealership_id]
    dealership = SqlRunner.run( sql, values )[0]["name"]
    return dealership
  end

  def mark_up
    sql = "select selling_price-purchase_price as mark_up from vehicles WHERE id = $1"
    values = [@id]
    markup = SqlRunner.run(sql, values)[0]["mark_up"]
    return markup
  end

end
