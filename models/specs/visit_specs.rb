require('minitest/autorun')
require('minitest/rg')
require_relative('../visit.rb')
require_relative('../client.rb')
require_relative('../pet.rb')
require_relative('../vet.rb')

class VisitTest < MiniTest::Test
  def setup()
    client1 = Client.new({'first_name'=> 'Jon',
                          'last_name' => 'Tomaney',
                          'contact_number' => '01923291248',
                          'email' => 'jt@mail.com'})
    @vet1 = Vet.new({'name' => 'Dr. Jones'})
    @pet1 = Pet.new({'name' => 'Indi',
      'date_of_birth' => '22/02/1994',
      'species' => 'cat',
      'owner_contact_info' => 'Jon, 07734975635',
      'treatment_notes' => 'prescribed worming/flea tablets',
      'vet_id' => @vet1.id()})

  end

  def test_visit_has_treatment_notes()
    visit = Visit.new({'pet_id' => @pet1.id,
                       'vet_id' => @vet1.id,
                       'treatment_notes' => 'notes',
                       'intake_date' => '12/12/12',
                       'discharge_date' => '15/12/12'
                      })
      assert_equal("notes", visit.treatment_notes)
  end

end
