require_relative('../db/sql_runner.rb')

class Visit

  attr_reader :id
  attr_accessor :pet_id, :vet_id, :treatment_notes, :intake_date, :discharge_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pet_id = options['pet_id']
    @vet_id = options['vet_id']
    @treatment_notes = options['treatment_notes']
    @intake_date = options['intake_date']
    @discharge_date = options['intake_date']
  end

  def save()
    sql = 'INSERT INTO visits
      (pet_id, vet_id, treatment_notes, intake_date, discharge_date) VALUES ($1, $2, $3, $4, $5)
      RETURNING id;'
    values = [@pet_id, @vet_id, @treatment_notes, @intake_date, @discharge_date]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE visits SET (pet_id, vet_id, treatment_notes, intake_date, discharge_date) = ($1, $2, $3, $4, $5) WHERE id = $6;'
    values = [@pet_id, @vet_id, @treatment_notes, @intake_date, @discharge_date, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM visits WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = 'SELECT * FROM Visits WHERE id = $1;'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Visit.new(results.first)
  end

  def self.all()
    sql = 'SELECT * FROM visits;'
    results = SqlRunner.run(sql)
    return results.map { |result| Visit.new(result) }
  end

  def self.delete_all()
    sql = 'DELETE FROM visits;'
    SqlRunner.run(sql)
  end

end
