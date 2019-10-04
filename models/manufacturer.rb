require_relative( '../db/sql_runner' )

class Manufacturer

  attr_reader( :name, :contact, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
  end

end
