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


end
