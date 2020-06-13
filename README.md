# Resistance Map bail fund checker

Right now this only checks data from bailfunds.github.io. The idea is to pull down their latest data and then check it
against what's in Resistance Map. From there it will spit out differences so that they can be loaded/updated.

## Setup

- install `ruby`
- `bundle install`
- You need to set your AirTable api key as an evironment variable, `export AIRTABLE_KEY="Your key here"`

## How to run

`ruby check.rb`

## Room for improvement

- Need to load more fields into the database
- Need to hook into airtable's api
- Figure out a good way to spit out diffs. Email?
- Look into uploading missing records directly to air table. Need to worry about bad data maybe.
