require('../db/sql_runner')
require('pry')

class Order

  attr_reader :id, :status
  attr_accessor :date_ordered


  def initialize(details)
    @id = details['id'].to_i if details['id']
    @product_id = details['product_id'].to_i
    @quantity = details['quantity'].to_i
    @status = 0
    @customer_id = details['customer_id'].to_i
    @invoice_id = nil
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

  def find
    sql = "SELECT * FROM orders
    WHERE id = $1"
    values = [ @id ]
    results = SqlRunner.run( sql, values )
    return Order.new( results.first )
  end

  def find_quantity
    sql = "SELECT quantity FROM orders
    WHERE id = $1"
    values = [ @id ]
    return SqlRunner.run( sql, values ).first
  end

  def find_selling_price
    sql = "SELECT selling_price FROM products
    INNER JOIN orders
    ON products.id = orders.product_id
    WHERE orders.id = $1"
    values = [ @id ]
    return SqlRunner.run( sql, values ).first
  end

  def value
    order_value = self.find_quantity['quantity'].to_i * self.find_selling_price['selling_price'].to_i
    return order_value.to_i
  end

  def find_customer
    sql = "SELECT customers.id FROM customers, orders
    WHERE customers.id = orders.customer_id
    AND orders.id = $1"
    values = [ @id ]
    customer = SqlRunner.run( sql, values )
    return Customer.new( customer.first )
  end

  def update_status
    sql = "UPDATE orders
    SET product_id = $1, quantity = $2, status = true, customer_id = $3, invoice_id = $4, date_ordered= $5
    WHERE id = $6"

    values = [ @product_id, @quantity, @customer_id, @invoice_id, @date_ordered, @id ]
    SqlRunner.run( sql, values )
  end

  def update_invoice_id(invoice)
    sql = "UPDATE orders
    SET invoice_id = $1
    WHERE id = $2"
    values = [ invoice, @id ]
    SqlRunner.run( sql, values )
  end

  # def check_out(shop)
  #   self.update_status
  #   amount = self.value
  #   customer = self.find_customer
  #   if customer.unpaid_invoices != nil
  #     invoice = customer.unpaid_invoices
  #     new_amount = invoice.invoice_total += amount
  #     invoice.update(new_amount)
  #   else
  #     invoice = Invoice.new({"shop_id" => shop.id})
  #     invoice.invoice_total = amount
  #     invoice.update
  #     self.update_invoice_id(invoice.id)
  #   end
  # end

  # def find_invoice_total #find current total of invoice to add order to
  #   sql = 'SELECT invoice_total FROM invoices, orders
  #   WHERE invoices.id = orders.invoice_id
  #   AND invoices.id = $1'
  #   values = [ @invoice_id ]
  #   found_total = SqlRunner.run( sql, values ).first
  #   return found_total['invoice_total'].to_i
  # end



end
