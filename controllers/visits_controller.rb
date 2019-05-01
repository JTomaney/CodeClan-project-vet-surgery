require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/visit.rb')
also_reload('../models/*')

# new
get '/visits/new' do
  @pets = Pet.all()
  @vets = Vet.all()
  erb(:"visits/new")
end
# create
post '/visits' do
  visit = Visit.new(params)
  visit.save()
  redirect to '/pets'
end
# show
get '/visits/:id' do
  @visit = Visit.find(params['id'].to_i)
  @pet = Pet.find(@visit.pet_id)
  # @Vet = Vet.find(@visit.vet_id)
  erb(:"visits/show")
end
