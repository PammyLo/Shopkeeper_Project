require('../db/sql_runner')

class Supplier

  # attr_reader :id
  attr_accessor :id, :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @supplier_name = details['name']
    @contact_name = details['contact_name']
    @location = details['location']
    # @address_2 = details['address_2']
    # @postcode = details['postcode']
    # @town_city = details['town_city']
  end

  def save
      sql = "INSERT INTO suppliers ( supplier_name, contact_name, location )
      VALUES ( $1, $2, $3 )
      RETURNING id"
      values = [ @supplier_name, @contact_name, @location ]
      results = SqlRunner.run( sql, values )
      @id = results.first()['id'].to_i
    end
end
