require('../db/sql_runner')

class Order

  attr_reader :id
  attr_accessor


  def initialize(details)
    @id = details['id'].to_i if details['id']
    @product_id = details['product_id'].to_i
    @quantity = details['quantity'].to_i
    @status = details['status'].to_i
    @customer_id = details['customer_id'].to_i
    @invoice_id = details['invoice_id'].to_i
    @date_ordered = details['date_ordered']
  end

  def save
    sql = "INSERT INTO orders
    ( product_id, quantity, status, customer_id, invoice_id, date_ordered )
    VALUES ( $1, $2, $3, $4, $5, $6 )
    RETURNING id"
    values = [ @product_id, @quantity, @status, @customer_id, @invoice_id, @date_ordered ]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM orders"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM orders"
    results = SqlRunner.run( sql )
    return results.map { |order| Order.new( order ) }
  end

  def self.find( id )
    sql = "SELECT * FROM orders
    WHERE id = $1"
    values = [ id ]
    results = SqlRunner.run( sql, values )
    return Order.new( results.first )
  end

end
