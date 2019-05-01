require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet.rb')
also_reload('../models/*')
# index
get '/vets' do
  @vets = Vet.all()
  erb(:"vets/index")
end
# new
get '/vets/new' do
  erb(:"vets/new")
end
# create
post '/vets' do
  Vet.new(params).save()
  redirect to '/vets'
end
# show
get '/vets/:id' do
  @vet = Vet.find(params['id'].to_i)
  @pets = @vet.pets()
  erb(:"vets/show")
end
# edit
get '/vets/:id/edit' do
  @vet = Vet.find(params['id'].to_i)
  erb(:"vets/edit")
end
# update
post '/vets/:id' do
  vet = Vet.new(params)
  vet.update()
  redirect to '/vets'
end
# delete
post '/vets/:id/delete' do
  vet = Vet.find(params['id'].to_i)
  vet.delete()
  redirect to '/vets'
end
