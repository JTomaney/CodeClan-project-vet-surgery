require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/pets_controller.rb')
require_relative('controllers/vets_controller.rb')
require_relative('controllers/clients_controller.rb')
require_relative('controllers/visits_controller.rb')

get '/' do
  erb(:index)
end
