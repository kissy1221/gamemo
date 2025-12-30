namespace :igdb do
  task import_games: :environment do
    puts "Importing games..."
    offset = 0
    total_imported = 0
    total_failed = 0
    game_fetcher = ExternalApi::Igdb::GameFetcher.new
    loop do
      games = game_fetcher.fetch(offset)
      break if games.empty?
      games.each do |game|
        Importer::GameImporter.new(game).import
        total_imported += 1
      end
      offset += ExternalApi::Igdb::Constraints::MAX_LIMIT
      print "\rProgress: #{total_imported} games imported (offset: #{offset})"
      $stdout.flush
    end
    puts "games imported successfully"
  end
end