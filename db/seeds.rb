require('pry')
require_relative('../models/vet.rb')
require_relative('../models/pet.rb')
require_relative('../models/client.rb')
require_relative('../models/visit.rb')

Visit.delete_all()
Client.delete_all()
Vet.delete_all()
Pet.delete_all()


client1 = Client.new({'first_name'=> 'Jon',
                      'last_name' => 'Tomaney',
                      'contact_number' => '01923291248',
                      'email' => 'jt@mail.com'})
client1.save()
client2 = Client.new({'first_name'=> 'Bill',
                      'last_name' => 'Billson',
                      'contact_number' => '7265024857',
                      'email' => 'bb@mail.com'})
client2.save()
client3 = Client.new({'first_name'=> 'Harold',
                      'last_name' => 'Gregg',
                      'contact_number' => '07364983729',
                      'email' => 'hg@mail.com'})
client3.save()

vet1 = Vet.new({'name' => 'Dr. Jones'})
vet1.save()
vet2 = Vet.new({'name' => 'Dr. Bacta'})
vet2.save()
vet3 = Vet.new({'name' => 'Dr. Octopus'})
vet3.save()

pet1 = Pet.new({'name' => 'Indi',
  'date_of_birth' => '1994-02-22',
  'species' => 'cat',
  'client_id' => client1.id(),
  'treatment_notes' => 'prescribed worming/flea tablets',
  'vet_id' => vet1.id()})
pet1.save()
pet2 = Pet.new({'name' => 'Chewie',
  'date_of_birth' => '2016-10-30',
  'species' => 'dog',
  'client_id' => client1.id(),
  'treatment_notes' => 'prescribed steroid cream for left ear',
  'vet_id' => vet2.id()})
pet2.save()
pet3 = Pet.new({'name' => 'Kurt',
  'date_of_birth' => '2005-08-06',
  'species' => 'gerbil',
  'client_id' => client2.id(),
  'treatment_notes' => 'Routine checkup, no treatment',
  'vet_id' => vet3.id()})
pet3.save()
pet4 = Pet.new({'name' => 'Muncher',
  'date_of_birth' => '2009-04-27',
  'species' => 'rabbit',
  'client_id' => client3.id(),
  'treatment_notes' => 'Chewed through a live wire, pronounced dead',
  'vet_id' => vet3.id()})
pet4.save()

visit1 = Visit.new({'pet_id' => pet1.id,
                   'vet_id' => vet1.id,
                   'treatment_notes' => 'notes',
                   'intake_date' => '2012-12-12',
                   'discharge_date' => '2012-12-15'
                  })
visit1.save()




binding.pry()
nil
