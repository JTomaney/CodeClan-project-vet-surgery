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

  def save()
    sql = 'INSERT INTO clients
      (first_name, last_name, contact_number, email) VALUES ($1, $2, $3, $4)
      RETURNING id;'
    values = [@first_name, @last_name, @contact_number, @email]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE clients SET (first_name, last_name, contact_number, email) = ($1, $2, $3, $4) WHERE id = $5;'
    values = [@first_name, @last_name, @contact_number, @email, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM clients WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def pets()
    sql = 'SELECT * FROM pets WHERE client_id = $1'
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Pet.new(result) }
  end

  def self.find(id)
    sql = 'SELECT * FROM clients WHERE id = $1;'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Client.new(results.first)
  end

  def self.all()
    sql = 'SELECT * FROM clients;'
    results = SqlRunner.run(sql)
    return results.map { |result| Client.new(result) }
  end

  def self.delete_all()
    sql = 'DELETE FROM clients;'
    SqlRunner.run(sql)
  end


end
