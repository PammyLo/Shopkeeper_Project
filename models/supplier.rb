require('../db/sql_runner')

class Supplier

  attr_accessor :id, :supplier_name, :contact_name, :location

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @supplier_name = details['supplier_name']
    @contact_name = details['contact_name']
    @location = details['location']
  end

  def save
    sql = "INSERT INTO suppliers ( supplier_name, contact_name, location )
      VALUES ( $1, $2, $3 )
      RETURNING id"
    values = [ @supplier_name, @contact_name, @location ]
    results = SqlRunner.run( sql, values )
    @id = results.first['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM suppliers"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Supplier.new( hash ) }
  end

  def self.products(id)
    sql = "SELECT product_name FROM products
    INNER JOIN suppliers
    ON suppliers.id = products.supplier_id
    WHERE suppliers.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |product| Product.new(product) }
  end

  def find
    sql = "SELECT * FROM suppliers
    WHERE id = $1"
    values = [ id ]
    results = SqlRunner.run( sql, values )
    return Supplier.new( results.first )
  end

  def update
    sql = "UPDATE suppliers
    SET supplier_name = $1, contact_name = $2, location = $3
    WHERE id = $4"
    values = [ @supplier_name, @contact_name, @location, @id ]
    SqlRunner.run( sql, values )
  end



end
