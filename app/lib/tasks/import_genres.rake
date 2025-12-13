namespace :igdb do
  task import_genres: :environment do
    puts "Importing genres..."
    offset = 0
    genre_fetcher = ExternalApi::Igdb::GenreFetcher.new
    loop do
      genres = genre_fetcher.fetch(offset)
      break if genres.empty?
      genres.each do |genre|
        Importer::GenreImporter.new(genre).import
      end
      offset = offset + ExternalApi::Igdb::Constraints::MAX_LIMIT
    end
    puts "Genres imported successfully"
  end
end