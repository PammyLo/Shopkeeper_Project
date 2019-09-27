require('../db/sql_runner')

class Shop

  attr_accessor :id, :name, :turnover

  def initialize(details)
    @id = options['id'].to_i if options['id']
    @shop_id = details['shop_id'].to_i
    @status = details['status'].to_i
  end


end
