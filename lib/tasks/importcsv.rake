namespace :importcsv do

require 'import.rb'
require 'csv'

  desc "Import Movie CSV Data"
  task movie: :environment do
    Movie.destroy_all
    Movie.create!(Import.csv_data(path: 'db/csv_data/movie_data.csv'))
  end

end