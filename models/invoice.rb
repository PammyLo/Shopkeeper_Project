require('../db/sql_runner')
require( 'pry' )

class Invoice

  attr_reader :id, :status
  attr_accessor :shop_id, :invoice_total

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @shop_id = details['shop_id'].to_i
    @status = 0
    @invoice_total = 0
  end

  def save
    sql = "INSERT INTO invoices ( shop_id, status, invoice_total )
      VALUES ( $1, $2, $3 )
      RETURNING id"
    values = [ @shop_id, @status, @invoice_total ]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM invoices"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM invoices"
    results = SqlRunner.run( sql )
    return results.map { |invoice| Invoice.new( invoice ) }
  end

  def self.find(id)
    sql = "SELECT * FROM invoices
    WHERE id = $1"
    values = [ id ]
    results = SqlRunner.run( sql, values )
    return Invoice.new( results.first )
  end

  def find
    sql = "SELECT * FROM invoices
    WHERE id = $1"
    values = [ @id ]
    results = SqlRunner.run( sql, values )
    return Invoice.new( results.first )
  end

  def Invoice.update(invoice)
    sql = "UPDATE invoices
    SET shop_id = $1, status = $2, invoice_total = $3
    WHERE id = $4"
    values = [ invoice.shop_id, invoice.status, invoice.invoice_total, invoice.id ]
    SqlRunner.run( sql, values)
  end

  def update(amount)
    sql = "UPDATE invoices
    SET shop_id = $1, status = $2, invoice_total = $3
    WHERE id = $4"
    values = [ @shop_id, @status, amount, @id ]
    SqlRunner.run( sql, values)
  end



  # def update(status)
  #   sql = "UPDATE invoices
  #   SET shop_id = $1, status = $2, invoice_total = $3
  #   WHERE id = $4"
  #   values = [ @shop_id, status, @invoice_total, @id ]
  #   SqlRunner.run( sql, values)
  # end

  def pay
      sql = "UPDATE invoices
      SET shop_id = $1, status = $2, invoice_total = $3
      WHERE id = $4"
      new_status = "1"
      values = [ @shop_id, new_status, @invoice_total, @id ]
      SqlRunner.run( sql, values )
    end
  end

  # def pay
  #   if self.status == "0"
  #     sql = "UPDATE invoices
  #     SET shop_id = $1, status = $2, invoice_total = $3
  #     WHERE id = $4"
  #     new_status = "1"
  #     values = [ new_status, @id ]
  #     SqlRunner.run( sql, values )
  #   end
  # end
