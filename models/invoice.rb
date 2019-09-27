require('../db/sql_runner')

class Invoice

  attr_reader :id
  attr_accessor :status

  def initialize(details)
    @id = options['id'].to_i if options['id']
    @shop_id = details['shop_id'].to_i
    @status = details['status'].to_i
  end


end
