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
  erb(:"products/new")
end

get '/products/:id' do
  @product = Product.find(params['id'])
  @supplier = Supplier.find(product.supplier_id)
  erb(:"products/show")
end

post '/products' do
  Product.new(params).save
  redirect '/products'
end
