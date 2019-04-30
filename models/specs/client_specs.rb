require('minitest/autorun')
require('minitest/rg')
require_relative('../client.rb')

class ClientTest < MiniTest::Test

  def test_owner_has_name()
    client1 = Client.new({'first_name'=> 'Jon',
                          'last_name' => 'Tomaney',
                          'contact_number' => '01923291248',
                          'email' => 'jt@mail.com'})
    assert_equal('Jon Tomaney', client1.full_name())
  end

end
