require('./db/sql_runner')

class Shop

  attr_accessor :id, :shop_name, :turnover

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @shop_name = details['shop_name']
    @turnover = 0
  end

  def save
    sql = "INSERT INTO shops ( shop_name, turnover )
      VALUES ( $1, $2 )
      RETURNING id"
    values = [ @shop_name, @turnover ]
    results = SqlRunner.run( sql, values )
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM shops"
    SqlRunner.run( sql )
  end

  def update_turnover
    sql = "UPDATE shops
    SET turnover = $1
    WHERE id = $2"
    values = [ @turnover, @id ]
    SqlRunner.run( sql, values )
  end

end
