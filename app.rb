require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/pet_controller.rb')
require_relative('controllers/vet_controller.rb')
require_relative('controllers/client_controller.rb')
require_relative('controllers/visits_controller.rb')

get '/' do
  erb(:index)
end
