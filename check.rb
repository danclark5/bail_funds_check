# Pull the current listing down into a SQLite database
# Load the yaml files into their own table
# Run a query to identify possible differences
require "sqlite3"
require "pathname"
require_relative "config/initialize.rb"
require_relative "lib/bailfunds.rb"

#DEFAULT_PATH = File.expand_path( File.dirname( __FILE__ ))
DEFAULT_PATH = Pathname(__FILE__).dirname + 'test_data'

puts "hello"
db = setup
load_data(db, DEFAULT_PATH)
