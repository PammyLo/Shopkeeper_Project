require('../db/sql_runner')

class Order

  attr_accessor :id,

  def initialize(details)
    @id = options['id'].to_i if options['id']
    
  end


end
