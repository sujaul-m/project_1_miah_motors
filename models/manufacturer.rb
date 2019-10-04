require_relative( '../db/sql_runner' )

class Manufacturer

  attr_reader( :name, :contact, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
  end

  def save()
    sql = "INSERT INTO manufacturers
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
    sql = "UPDATE manufacturers
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

  def self.all()
    sql = "SELECT * FROM manufacturers;"
    results = SqlRunner.run( sql )
    return results.map { |manufacturer| Manufacturer.new( manufacturer ) }
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers;"
    SqlRunner.run(sql)
  end


end
