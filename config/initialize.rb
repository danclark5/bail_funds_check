require_relative 'initializers/sqlite'

def setup
  db = create_db
  create_resistance_map_table(db)
  create_bailfunds_table(db)
  db
end
