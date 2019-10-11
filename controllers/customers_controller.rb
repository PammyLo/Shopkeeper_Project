require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )



get '/customers' do
  @customers = Customer.all
  erb( :"customers/index" )
end

# new
get '/customers/new' do
  erb( :"customers/new" )
end

# save new to database
post '/customers' do
  Customer.new(params).save
  redirect to ("/customers")
end

# read
get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  erb( :"customers/show")
end

# edit
get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb( :"customers/edit")
end


# update edit in database
put '/customers/:id' do
  Customer.new(params).update
  redirect to ("/customers")
end

# delete from database
post '/customers/:id/delete' do
  Customer.delete(params[:id])
  redirect to ("/customers")
end
