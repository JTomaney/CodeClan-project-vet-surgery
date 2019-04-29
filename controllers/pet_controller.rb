require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/pet.rb')
also_reload('../models/*')

get '/pets' do
  @pets = Pet.all()
  erb(:"pets/index")
end

get '/pets/new' do
  @vets = Vet.all()
  erb(:"pets/new")
end

post '/pets' do
  Pet.new(params).save()
  redirect to '/pets'
end

get '/pets/:id' do
  @pet = Pet.find(params['id'].to_i)
  erb(:"pets/show")
end

get '/pets/:id/edit' do
  @pet = Pet.find(params['id'].to_i)
  @vets = Vet.all()
  erb(:"pets/edit")
end

post '/pets/:id' do
  pet = Pet.new(params)
  pet.update()
  redirect to '/pets'
end

post '/pets/:id/delete' do
  pet = Pet.find(params['id'].to_i)
  pet.delete()
  redirect to '/pets'
end
