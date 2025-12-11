namespace :igdb do
  task import_genres: :environment do
    puts "Importing genres..."
    genre_fetcher = ExternalApi::Igdb::GenreFetcher.new
    genre_fetcher.fetch_genres("").each do |genre|
      Importer::GenreImporter.new(genre).import
    end
    puts "Genres imported successfully"
  end
end