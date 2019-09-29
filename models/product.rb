require('../db/sql_runner')

class Product

  attr_reader :id
  attr_accessor

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @supplier_id = details['supplier_id'].to_i
    @product_name = details['product_name'].capitalize
    @description = details['description']
    @stock = details['stock'].to_i
    @cost_price = details['cost_price'].to_i
    @selling_price = details['selling_price'].to_i
    @low_stock_threshold = details['low_stock_threshold'].to_i
    @delivery_time = details['delivery_time'].to_i
  end

  def save
    sql = "INSERT INTO products
    ( supplier_id, product_name, description, stock, cost_price, selling_price, low_stock_threshold, delivery_time )
    VALUES ( $1, $2, $3, $4, $5, $6, $7, $8 )
    RETURNING id"
    values = [ @supplier_id, @product_name, @description, @stock, @cost_price, @selling_price, @low_stock_threshold, @delivery_time ]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end

end
