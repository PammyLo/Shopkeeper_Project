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
  erb( :"suppliers/new" )
end

# save new to database
post '/suppliers' do
  Supplier.new(params).save
  redirect to ("/suppliers")
end

# read
get '/suppliers/:id' do
  @supplier = Supplier.find(params['id'].to_i)
  erb( :"suppliers/show" )
end

# edit
get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb( :"suppliers/edit")
end

# update edit in database
put '/suppliers/:id' do
  Supplier.new(params).update
  redirect to ("/suppliers")
end

# delete from database
post '/suppliers/:id/delete' do
  Supplier.delete(params[:id])
  redirect to ("/suppliers")
end
