class Differences
  def self.fetch(db)
    puts "#{'*'*80}\nFinding missing records from resistancemap.com\n#{'*'*80}"
    puts missing(db).map {|r| "#{r[1]} - #{r[0]}"}
    puts "#{'*'*80}\nFinding extras in resistancemap.com\n#{'*'*80}"
    puts extras(db).map {|r| "#{r[1]} - #{r[0]}"}
  end

  def self.missing(db)
    db.execute <<-SQL
    SELECT bf.name, bf.state 
    FROM bailfunds bf
    LEFT JOIN resistance_map rm on bf.name = rm.name
    WHERE rm.name is null
    ORDER BY bf.state, bf.name
    SQL
  end

  def self.extras(db)
    db.execute <<-SQL
    SELECT rm.name, rm.state 
    FROM resistance_map rm 
    LEFT JOIN bailfunds bf  on bf.name = rm.name
    WHERE bf.name is null
    ORDER BY rm.state, rm.name
    SQL
  end
end
