require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )


get '/' do
  @customers = Customer.all
  erb( :"customers/index" )
end

get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  erb(:"customers/show")
end
