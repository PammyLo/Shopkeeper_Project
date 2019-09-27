require('../db/sql_runner')

class Supplier

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = options['id'].to_i if options['id']
    @name = details['name']
    @contact_name = details['contact_name']
    @address_1 = details['address_1']
    @address_2 = details['address_2']
    @postcode = details['postcode']
    @town_city = details['town_city']
  end


end
