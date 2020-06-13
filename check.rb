# Pull the current listing down into a SQLite database
# Load the yaml files into their own table
# Run a query to identify possible differences
require "sqlite3"
require "pathname"
require "pry"
require_relative "config/initialize"
require_relative "lib/bailfunds"
require_relative "lib/resistance_map"
require_relative "lib/differences"

DEFAULT_PATH = Pathname(__FILE__).dirname + "bailfunds.github.io/_data/regions"

puts "#{'*'*80}\nResistance Map bail fund checker\n#{'*'*80}"
db = setup
puts "#{'*'*80}\nLoading bailfunds.github.io data\n#{'*'*80}"
load_bailfunds_data(db, DEFAULT_PATH)
puts "#{'*'*80}\nLoading resistancemap.com data\n#{'*'*80}"
ResistanceMap.pull(db)
Differences.fetch(db)

