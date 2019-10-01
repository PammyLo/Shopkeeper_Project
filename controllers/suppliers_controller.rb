require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all
  erb( :"suppliers/index" )
end

# new
get '/suppliers/new' do
  @suppliers = Supplier.all
  erb( :"suppliers/new" )
end

# save in database
post '/suppliers' do
  Supplier.new(params).save
  redirect to ("/suppliers")
end

get '/suppliers/:id' do
  @supplier = Supplier.find(params['id'].to_i)
  erb( :"suppliers/show" )
end

get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb( :"suppliers/edit")
end

put '/suppliers/:id' do
  Supplier.new(params).update
  redirect to ("/suppliers")
end

# post '/suppliers/:id/delete' do
#   Product.delete(params[:id])
#   redirect to ("/suppliers")
# end
