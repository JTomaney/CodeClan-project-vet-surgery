require_relative('../db/sql_runner.rb')

class Pet

  attr_reader :id
  attr_accessor :name, :date_of_birth, :species, :owner_contact_info, :treatment_notes, :vet_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @date_of_birth = options["date_of_birth"]
    @species = options["species"]
    @owner_contact_info = options["owner_contact_info"]
    @treatment_notes = options["treatment_notes"]
    @vet_id = options["vet_id"].to_i if options["vet_id"]
  end

  def save()
    sql = 'INSERT INTO pets
      (name, date_of_birth, species, owner_contact_info, treatment_notes, vet_id) VALUES ($1, $2, $3, $4, $5, $6)
      RETURNING id;'
    values = [@name, @date_of_birth, @species, @owner_contact_info, @treatment_notes, @vet_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE pets SET (name, date_of_birth, species, owner_contact_info, treatment_notes, vet_id) = ($1, $2, $3, $4, $5, $6) WHERE id = $7;'
    values = [@name, @date_of_birth, @species, @owner_contact_info, @treatment_notes, @vet_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM pets WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def pets()

  end

  def self.find(id)

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
