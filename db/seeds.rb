require('pry')
require_relative('../models/vet.rb')
require_relative('../models/pet.rb')

Vet.delete_all()

vet1 = Vet.new({'name' => 'Dr. Jones'})
vet1.save()
vet2 = Vet.new({'name' => 'Dr. Crusher'})
vet2.save()

binding.pry()
nil
