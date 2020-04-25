require "import.rb"
require "csv"

namespace :importcsv do
  desc "Import Movie CSV Data"
  task movie: :environment do
    Movie.destroy_all
    Movie.create!(Import.csv_data(path: "db/csv_data/movie_data.csv"))
  end

  desc "Import Column CSV Data"
  task column: :environment do
    Column.destroy_all
    Column.create!(Import.csv_data(path: "db/csv_data/column_data.csv"))
  end

  desc "Import Graph CSV Data"
  task graph: :environment do
    Graph.destroy_all
    Graph.create!(Import.csv_data(path: "db/csv_data/graph_data.csv"))
  end
end
