require 'yaml'

def load_data(db, path)
  path.children.each do |child|
    child.open do |f|
      process_regional_data(db, YAML.load(f))
    end
  end
end

def process_regional_data(db, regional_data)
  state = regional_data["name"]
  puts state
  process_subregional_data(db, state, regional_data["subregions"])
end

def process_subregional_data(db, state, subregional_data)
  puts subregional_data
  subregional_data.each {|srd| process_bailfunds(db, state, srd["name"], srd["bailfunds"])}
end

def process_bailfunds(db, state, city, bailfunds)
  puts bailfunds
  bailfunds.each {|bf| insert_record(db, state, city, bf["name"])}
end

def insert_record(db, state, city, name)
  db.execute "INSERT INTO resistance_map(name, city, state) values ('#{name}', '#{city}', '#{state}')"
end
