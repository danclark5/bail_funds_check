require 'airrecord'

Airrecord.api_key = ENV["AIRTABLE_KEY"]

class BailFund < Airrecord::Table
  self.base_key = "appurHEuqUjrzuFgv"
  self.table_name = "Bail Funds"
end
