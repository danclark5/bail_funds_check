require 'airrecord'
require_relative 'resistance_map/bail_fund'

class ResistanceMap

  def self.pull(db)
    bail_funds = fetch_records
    bail_funds.each do |bf| 
      insert_into_check_db(db, bf) unless bf.nil? || bf["Name"]&.empty?
    end
  end

  def self.fetch_records
    BailFund.all
  end

  def self.insert_into_check_db (db, bail_fund)
    puts bail_fund["Address or City"]
    db.execute <<-SQL
    INSERT INTO resistance_map(name, city, state) values (
    "#{bail_fund["Name"]}",
    "#{bail_fund["Address or City"]}",
    '#{bail_fund["State"]}')
    SQL
  end
end
