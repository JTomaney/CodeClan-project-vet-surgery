require('minitest/autorun')
require('minitest/rg')
require_relative('../vet.rb')

class VetTest < MiniTest::Test

  def test_vet_has_name()
    vet1 = Vet.new({'name' => 'Dr. Jones'})
    assert_equal('Dr. Jones', vet1.name())
  end

end
