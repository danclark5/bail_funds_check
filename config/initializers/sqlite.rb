def create_db
  db = SQLite3::Database.new "check.db"
end

def create_resistance_map_table(db)
  row = db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS resistance_map (
      id int,
      name varchar(200),
      city varchar(100),
      state varchar(2))
  SQL
end

def create_bailfunds_table(db)
  row = db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS bailfunds (
      id int,
      name varchar(200),
      city varchar(100),
      state varchar(2))
  SQL
end


