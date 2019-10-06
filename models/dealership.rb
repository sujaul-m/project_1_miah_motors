require_relative( '../db/sql_runner' )

class Dealership

  attr_reader( :name, :contact, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
  end

  def save()
    sql = "INSERT INTO dealerships
    (
      name,
      contact
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @contact]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE dealerships
    SET
    (
      name,
      contact
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @contact, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM dealerships
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def vehicles
    sql = "SELECT v.* FROM vehicles v INNER JOIN miah_motors m ON m.vehicle_id = v.id WHERE m.dealerships_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |vehicle| Vehicle.new(vehicle) }
  end

  def self.all()
    sql = "SELECT * FROM dealerships;"
    results = SqlRunner.run( sql )
    return results.map { |dealership| Dealership.new( dealership ) }
  end

  def self.delete_all()
    sql = "DELETE FROM dealerships;"
    SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM dealerships WHERE id = $1;"
    values = [id]
    dealership = SqlRunner.run( sql, values )
    result = Dealership.new( dealership.first )
    return result
  end


end
