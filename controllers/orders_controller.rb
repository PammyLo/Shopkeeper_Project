require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )
require_relative( '../models/order.rb' )
require_relative( '../models/product.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/invoice.rb' )
also_reload( '../models/*' )