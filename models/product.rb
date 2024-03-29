require('./db/sql_runner')
require('pry')

class Product

  attr_reader :id
  attr_accessor :product_name, :supplier_id, :description, :stock, :cost_price, :selling_price, :low_stock_threshold, :delivery_time, :category

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
    @category = details['category']
  end

  def save
    sql = "INSERT INTO products
    ( supplier_id, product_name, description, stock, cost_price, selling_price, low_stock_threshold, delivery_time, category )
    VALUES ( $1, $2, $3, $4, $5, $6, $7, $8, $9 )
    RETURNING id"
    values = [ @supplier_id, @product_name, @description, @stock, @cost_price, @selling_price, @low_stock_threshold, @delivery_time, @category ]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM products
    WHERE id = $1"
    values = [ id ]
    SqlRunner.run( sql, values )
  end

  def self.all
    sql = "SELECT * FROM products"
    results = SqlRunner.run( sql )
    return results.map { |hash| Product.new( hash ) }
  end

  def self.order_by(order_by)
    sql = "SELECT * FROM products ORDER BY #{order_by} ASC"
    results = SqlRunner.run( sql )
    return results.map { |p| Product.new( p ) }
  end

  def self.find(id)
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [ id ]
    product = SqlRunner.run( sql, values ).first
    return Product.new( product )
  end

  def total
    sql = "SELECT  FROM products
    WHERE id = $1"
    values = [ @id ]
    results = SqlRunner.run( sql, values )
    return Product.new( results.first )
  end

  def update
    sql = "UPDATE products
    SET supplier_id = $1, product_name = $2, description = $3, stock = $4, cost_price = $5, selling_price = $6, low_stock_threshold = $7, delivery_time = $8, category = $9
    WHERE id = $10"
    values = [ @supplier_id, @product_name, @description, @stock, @cost_price, @selling_price, @low_stock_threshold, @delivery_time, @category, @id ]
    SqlRunner.run( sql, values )
  end

  def supplier
    sql = "SELECT suppliers.* FROM suppliers, products
    WHERE suppliers.id = products.supplier_id
    AND products.id = $1"
    values = [ @id ]
    supplier = SqlRunner.run( sql, values ).first
    return Supplier.new(supplier)
  end

  def markup
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [ @id ]
    product = SqlRunner.run( sql, values ).first
    profit = product.selling_price - product.cost_price
    markup = profit / product.cost_price * 100
    return markup
  end

  def low_stock?
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [ @id ]
    product = SqlRunner.run( sql, values ).first
    if product['stock'].to_i <= product['low_stock_threshold'].to_i
      return true
    else
      return false
    end
  end


end
