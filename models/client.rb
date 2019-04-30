require_relative('../db/sql_runner.rb')

class Client

  attr_reader :id
  attr_accessor :first_name, :last_name, :contact_number, :email

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @contact_number = options['contact_number']
    @email = options['email']
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

end
