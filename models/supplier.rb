require('../db/sql_runner')

class Supplier

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @contact_name = details['contact_name']
    @location = details['location']
    # @address_2 = details['address_2']
    # @postcode = details['postcode']
    # @town_city = details['town_city']
  end


end
