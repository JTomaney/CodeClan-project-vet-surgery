require('minitest/autorun')
require('minitest/rg')
require_relative('../pet.rb')
require_relative('../vet.rb')

class PetTest < MiniTest::Test

  def test_pet_has_name()
    vet1 = Vet.new({'name' => 'Dr. Jones'})
    pet1 = Pet.new({'name' => 'Indi',
      'date_of_birth' => '22/02/1994',
      'species' => 'cat',
      'owner_contact_info' => 'Jon, 07734975635',
      'treatment_notes' => 'prescribed worming/flea tablets',
      'vet_id' => vet1.id()})
    assert_equal('Indi', pet1.name())
  end

end
