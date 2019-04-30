require('pry')
require_relative('../models/vet.rb')
require_relative('../models/pet.rb')
require_relative('../models/client.rb')

Client.delete_all()
Vet.delete_all()
Pet.delete_all()


client1 = Client.new({'first_name'=> 'Jon',
                      'last_name' => 'Tomaney',
                      'contact_number' => '01923291248',
                      'email' => 'jt@mail.com'})
client1.save()

vet1 = Vet.new({'name' => 'Dr. Jones'})
vet1.save()
vet2 = Vet.new({'name' => 'Dr. Crusher'})
vet2.save()
vet3 = Vet.new({'name' => 'Dr. Octopus'})
vet3.save()

pet1 = Pet.new({'name' => 'Indi',
  'date_of_birth' => '22/02/1994',
  'species' => 'cat',
  'client_id' => client1.id(),
  'treatment_notes' => 'prescribed worming/flea tablets',
  'vet_id' => vet1.id()})
pet1.save()
pet2 = Pet.new({'name' => 'Chewie',
  'date_of_birth' => '30/10/2016',
  'species' => 'dog',
  'client_id' => client1.id(),
  'treatment_notes' => 'prescribed steroid cream for left ear',
  'vet_id' => vet2.id()})
pet2.save()
pet3 = Pet.new({'name' => 'Kurt',
  'date_of_birth' => '06/08/2005',
  'species' => 'gerbil',
  'client_id' => client1.id(),
  'treatment_notes' => 'Routine checkup, no treatment',
  'vet_id' => vet3.id()})
pet3.save()




binding.pry()
nil
