require('../db/sql_runner')

class Shop

  attr_reader :id
  attr_accessor :name, :turnover

  def initialize(details)
    @id = options['id'].to_i if options['id']
    @shop_name = details['shop_name']
    @turnover = details['turnover'].to_i
  end


end
