require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet.rb')
also_reload('../models/*')
# index
get '/pets' do
  @pets = Pet.all()
  erb(:"pets/index")
end
#new
get '/pets/new' do
  @vets = Vet.all()
  erb(:"pets/new")
end
#create
post '/pets' do
  Pet.new(params).save()
  redirect to '/pets'
end
#show
get '/pets/:id' do
  @pet = Pet.find(params['id'].to_i)
  erb(:"pets/show")
end
#edit
get '/pets/:id/edit' do
  @pet = Pet.find(params['id'].to_i)
  @vets = Vet.all()
  erb(:"pets/edit")
end
#update
post '/pets/:id' do
  pet = Pet.new(params)
  pet.update()
  redirect to '/pets'
end
#delete
post '/pets/:id/delete' do
  pet = Pet.find(params['id'].to_i)
  pet.delete()
  redirect to '/pets'
end
