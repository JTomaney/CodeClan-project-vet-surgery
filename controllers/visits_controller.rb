require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/visit.rb')
also_reload('../models/*')
# index
get '/visits' do
  @visits = Visit.all()
  erb(:"visits/index")
end
# new
get '/visits/new' do
  erb(:"visits/new")
end
# create
post '/visits' do
  Visit.new(params).save()
  redirect to '/visits'
end
# show
get '/visits/:id' do
  @visit = Visit.find(params['id'].to_i)
  @pet = Pet.find(@visit.pet_id)
  @Vet = Vet.find(@visit.vet_id)
  erb(:"visits/show")
end
# edit
get '/visits/:id/edit' do
  @visit = Visit.find(params['id'].to_i)
  erb(:"visits/edit")
end
# update
post '/visits/:id' do
  visit = Visit.new(params)
  visit.update()
  redirect to '/visits'
end
# delete
post '/visits/:id/delete' do
  visit = Visit.find(params['id'].to_i)
  visit.delete()
  redirect to '/visits'
end
