# Pull the current listing down into a SQLite database
# Load the yaml files into their own table
# Run a query to identify possible differences
require "sqlite3"
require "pathname"
require_relative "config/initialize.rb"
require_relative "lib/bailfunds.rb"

DEFAULT_PATH = Pathname(__FILE__).dirname + 'bailfunds.github.io/_data/regions'

puts "#{'*'*80}\nResistance Map bail fund checker\n#{'*'*80}"
db = setup
load_bailfunds_data(db, DEFAULT_PATH)
