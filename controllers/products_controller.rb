require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )
require_relative( '../models/product.rb' )
require_relative( '../models/supplier.rb' )
also_reload( '../models/*' )

get '/products' do
  @products = Product.all
  erb( :"products/index" )
end

get '/products/new' do
  @suppliers = Supplier.all
  erb( :"products/new" )
end

post '/products' do
  Product.new(params).save
  redirect to ("/products")
end

get '/products/:id' do
  @product = Product.find(params['id'].to_i)
  @supplier = Product.supplier(@product.id)['supplier_name']
  erb( :"products/show" )
end

get '/products/:id/edit' do
  @product = Product.find(params['id'].to_i)
  @supplier = Product.supplier(@product.id)
  erb( :"products/edit")
end

post '/products/:id/delete' do
  Product.delete(params[:id])
  redirect to ("/products")
end
