require_relative('../db/sql_runner.rb')

class Pet

  attr_reader :id
  attr_accessor :name, :date_of_birth, :species, :client_id, :vet_id

  def initialize(options)
    options['vet_id'] = false if options['vet_id'] == ""
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @date_of_birth = options["date_of_birth"]
    @species = options["species"]
    @client_id = options["client_id"]
    @vet_id = options["vet_id"].to_i if options["vet_id"]
  end

  def save()
    sql = 'INSERT INTO pets
    (name, date_of_birth, species, client_id, vet_id) VALUES ($1, $2, $3, $4, $5)
    RETURNING id;'
    values = [@name, @date_of_birth, @species, @client_id,  @vet_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE pets SET (name, date_of_birth, species, client_id, vet_id) = ($1, $2, $3, $4, $5) WHERE id = $6;'
    values = [@name, @date_of_birth, @species, @client_id,  @vet_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM pets WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def vet()
    sql = 'SELECT * FROM vets WHERE id = $1'
    values = [@vet_id]
    results = SqlRunner.run(sql, values)
    return Vet.new(results[0])
  end

  def client()
    sql = 'SELECT * FROM clients WHERE id = $1'
    values = [@client_id]
    results = SqlRunner.run(sql, values)
    return Client.new(results[0])
  end

  def visits()
    sql = 'SELECT * FROM visits WHERE pet_id = $1'
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Visit.new(result)  }
  end

  def self.find(id)
    sql = 'SELECT * FROM pets WHERE id = $1;'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Pet.new(results.first)
  end

  def self.all()
    sql = 'SELECT * FROM pets;'
    results = SqlRunner.run(sql)
    return results.map { |result| Pet.new(result) }
  end

  def self.delete_all()
    sql = 'DELETE FROM pets;'
    SqlRunner.run(sql)
  end


end
