namespace :igdb do
  task import_games: :environment do
    puts "Importing games..."
    offset = 0
    game_fetcher = ExternalApi::Igdb::GameFetcher.new
    loop do
      games = game_fetcher.fetch(offset)
      break if games.empty?
      games.each do |game|
        Importer::GameImporter.new(game).import
      end
      offset = offset + ExternalApi::Igdb::Constraints::MAX_LIMIT
    end
    puts "games imported successfully"
  end
end