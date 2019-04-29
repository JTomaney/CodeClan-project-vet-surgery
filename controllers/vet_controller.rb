require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet.rb')
also_reload('../models/*')

get '/vets' do
  @vets = Vet.all()
  erb(:"vets/index")
end

get '/vets/new' do
  erb(:"vets/new")
end

post '/vets' do
  Vet.new(params).save()
  erb(:"vets/index")
end

get '/vets/:id' do
  @vet = Vet.find(params['id'].to_i)
  erb(:"vets/show")
end

get '/vets/:id/edit' do
  @vet = Vet.find(params['id'].to_i)
  erb(:"vets/edit")
end

post '/vets/:id' do
  vet = Vet.new(params)
  vet.update()
  redirect to '/vets'
end
