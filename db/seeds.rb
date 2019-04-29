require('pry')
require_relative('../models/vet.rb')
require_relative('../models/pet.rb')

Vet.delete_all()

vet1 = Vet.new({'name' => 'Dr. Jones'})
vet1.save()
vet2 = Vet.new({'name' => 'Dr. Crusher'})
vet2.save()
vet3 = Vet.new({'name' => 'Dr. Octopus'})
vet3.save()

pet1 = Pet.new({'name' => 'Indi',
  'date_of_birth' => '22/02/1994',
  'species' => 'cat',
  'owner_contact_info' => 'Jon, 07734975635',
  'treatment_notes' => 'prescribed worming/flea tablets',
  'vet_id' => vet1.id()})
pet1.save()
pet2 = Pet.new({'name' => 'Chewie',
  'date_of_birth' => '30/10/2016',
  'species' => 'dog',
  'owner_contact_info' => 'Mari, 01337830994',
  'treatment_notes' => 'prescribed steroid cream for left ear',
  'vet_id' => vet2.id()})
pet2.save()
pet3 = Pet.new({'name' => 'Kurt',
  'date_of_birth' => '06/08/2005',
  'species' => 'gerbil',
  'owner_contact_info' => 'Mat, 01923291248',
  'treatment_notes' => 'Routine checkup, no treatment',
  'vet_id' => vet3.id()})
pet3.save()


binding.pry()
nil
