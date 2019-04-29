require_relative('../db/sql_runner.rb')

class Vet

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = 'INSERT INTO vets
      (name) VALUES ($1)
      RETURNING id;'
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE vets SET name = $1 WHERE id = $2;'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM vets WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def pets()
    sql = 'SELECT * FROM pets WHERE vet_id = $1'
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |result| Pet.new(result) }
  end

  def self.find(id)
    sql = 'SELECT * FROM vets WHERE id = $1;'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Vet.new(results.first)
  end

  def self.all()
    sql = 'SELECT * FROM vets;'
    results = SqlRunner.run(sql)
    return results.map { |result| Vet.new(result) }
  end

  def self.delete_all()
    sql = 'DELETE FROM vets;'
    SqlRunner.run(sql)
  end

end
