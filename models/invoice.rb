require('../db/sql_runner')

class Invoice

  attr_accessor :id, :status

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @shop_id = details['shop_id'].to_i
    @status = details['status'].to_i
  end

  def save
    sql = "INSERT INTO invoices ( shop_id, status )
      VALUES ( $1, $2 )
      RETURNING id"
    values = [ @shop_id, @status ]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM invoices"
    SqlRunner.run( sql )
  end

end
