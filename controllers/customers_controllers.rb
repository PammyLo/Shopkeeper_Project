require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )
