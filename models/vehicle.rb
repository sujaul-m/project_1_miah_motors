require_relative( '../db/sql_runner' )

class Vehicle

  attr_reader( :make, :model, :selling_price, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @make = options['make']
    @model = options['model']
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


end
