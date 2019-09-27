require('../db/sql_runner')

class Product

  attr_reader :id
  attr_accessor

  def initialize(details)
    @id = options['id'].to_i if options['id']
    @supplier_id = details['supplier_id'].to_i
    @product_name = details['product_name']
    @description = details['description']
    @stock = details['stock'].to_i
    @cost_price = details['cost_price'].to_i
    @selling_price = details['selling_price'].to_i
    @low_stock_threshold = details['low_stock_threshold'].to_i
    @delivery_time = details['delivery_time'].to_i
  end


end
