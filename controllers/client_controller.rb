require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/client.rb')
also_reload('../models/*')
# index
get '/clients' do
  @clients = Client.all()
  erb(:"clients/index")
end
#new
get '/clients/new' do
  erb(:"clients/new")
end
#create
post '/clients' do
  Client.new(params).save()
  redirect to '/clients'
end
#show
get '/clients/:id' do
  @client = Client.find(params['id'].to_i)
  @pets = @client.pets()
  erb(:"clients/show")
end
#edit
get '/clients/:id/edit' do
  @client = Client.find(params['id'].to_i)
  @pets = Pet.all()
  erb(:"clients/edit")
end
#update
post '/clients/:id' do
  client = Client.new(params)
  client.update()
  redirect to '/clients'
end
#delete
post '/clients/:id/delete' do
  client = Client.find(params['id'].to_i)
  client.delete()
  redirect to '/clients'
end
