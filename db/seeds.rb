require('pry')
require_relative('../models/vet.rb')
require_relative('../models/pet.rb')

Vet.delete_all()

vet1 = Vet.new({'name' => 'Dr. Jones'})
vet1.save()
vet2 = Vet.new({'name' => 'Dr. Crusher'})
vet2.save()

pet1 = Pet.new({'name' => 'Indi',
  'date_of_birth' => '22/02/1994',
  'species' => 'cat',
  'owner_contact_info' => 'Jon, 07734975635',
  'treatment_notes' => 'prescribed worming/flea tablets',
  'vet_id' => vet1.id()})
pet1.save()



binding.pry()
nil
