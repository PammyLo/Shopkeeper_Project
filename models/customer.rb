require('../db/sql_runner')

class Customer

  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @first_name = details['first_name']
    @last_name = details['last_name']
    @address_1 = details['address_1']
    @address_2 = details['address_2']
    @postcode = details['postcode']
    @town_city = details['town_city']
  end


end
