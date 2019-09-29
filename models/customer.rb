require('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :first_name, :last_name, :address_1, :address_2, :postcode, :town_city

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

  def self.all
    sql = "SELECT * FROM customers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Customer.new( hash ) }
  end

  def find
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [ id ]
    results = SqlRunner.run( sql, values )
    return Customer.new( results.first )
  end

  def update
    sql = "UPDATE customers
    SET first_name = $1, last_name = $2, address_1 = $3, address_2 = $4, postcode = $5, town_city = $6
    WHERE id = $7"
    values = [ @first_name, @last_name, @address_1, @address_2, @postcode, @town_city, @id ]
    SqlRunner.run( sql, values )
  end

end
