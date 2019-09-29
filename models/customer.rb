require('../db/sql_runner')

class Customer

  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @first_name = details['first_name']
    @last_name = details['last_name']
    @address_1 = details['address_1']
    @address_2 = details['address_2']
    @postcode = details['postcode']
    @town_city = details['town_city']
  end

  def save
    sql = "INSERT INTO customers ( first_name, last_name, address_1, address_2, postcode, town_city )
      VALUES ( $1, $2, $3, $4, $5, $6 )
      RETURNING id"
    values = [ @first_name, @last_name, @address_1, @address_2, @postcode, @town_city ]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run( sql )
  end

end
