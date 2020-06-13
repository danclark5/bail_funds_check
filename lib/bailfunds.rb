require "yaml"

def load_bailfunds_data(db, path)
  puts "Loading the following regions from bailfunds.github.io..."
  path.children.each do |child|
    child.open do |f|
      process_regional_data(db, YAML.load(f))
    end
  end
end

def process_regional_data(db, regional_data)
  state = regional_data["name"]
  puts state
  if regional_data.keys.include? "subregions"
    process_subregional_data(db, state, regional_data["subregions"])
  end
  if regional_data.keys.include? "bailfunds"
    process_bailfunds(db, state, "", regional_data["bailfunds"])
  end
end

def process_subregional_data(db, state, subregional_data)
  subregional_data.each {|srd| process_bailfunds(db, state, srd["name"], srd["bailfunds"])}
end

def process_bailfunds(db, state, city, bailfunds)
  bailfunds.each {|bf| insert_record(db, state, city, bf["name"])}
end

def insert_record(db, state, city, name)
  db.execute "INSERT INTO bailfunds(name, city, state) values (\"#{name}\", \"#{sanitize_city(city)}\", \"#{state}\")"
end

def sanitize_city city
  city.to_s.gsub /"/, '|'
end
