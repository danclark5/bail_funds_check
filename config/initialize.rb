require_relative 'initializers/sqlite'

def setup
  db = create_db
  create_resistance_map_table(db)
  create_bailfunds_table(db)
  truncate_tables(db)
  db
end

def truncate_tables(db)
  db.execute("DELETE FROM resistance_map")
  db.execute("DELETE FROM bailfunds")
end
