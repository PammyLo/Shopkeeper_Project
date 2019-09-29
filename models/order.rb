require('../db/sql_runner')

class Order

  attr_reader :id
  attr_accessor


  def initialize(details)
    @id = details['id'].to_i if details['id']
    @product_id = details['product_id'].to_i
    @quantity = details['quantity'].to_i
    @status = details['status'].to_i,
    @customer_id = details['customer_id'].to_i
    @invoice_id = details['invoice_id'].to_i
    @date_ordered = details['date_ordered']
  end


end
