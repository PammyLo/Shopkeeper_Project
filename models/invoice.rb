require('../db/sql_runner')

class Invoice

  attr_reader :id
  attr_accessor :status

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @shop_id = details['shop_id'].to_i
    @status = details['status'].to_i
  end


end
