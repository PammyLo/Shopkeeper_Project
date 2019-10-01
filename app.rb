require( 'sinatra' )
require( 'sinatra/reloader' )
require_relative('./models/shop.rb')
require_relative('controllers/suppliers_controller')
require_relative('controllers/products_controller')
also_reload('controllers/*')

get '/' do
  @turnover = Shop.turnover
  erb( :index )
end
