namespace :igdb do
  task import_games: :environment do
    puts "Importing games..."
    offset = 0
    total_imported = 0
    total_failed = 0
    game_fetcher = ExternalApi::Igdb::GameFetcher.new
    begin
      total_games_count = game_fetcher.count
      loop do
        games = game_fetcher.fetch(offset)
        break if games.empty?
        games.each do |game|
          begin
            Importer::GameImporter.new(game).import
            total_imported += 1
          rescue => e
            total_failed += 1
            puts "Failed to import igdb_id: #{game['id']} (error: #{e.message})"
          end
        end
        offset += ExternalApi::Igdb::Constraints::MAX_LIMIT
        
        # 進捗率の計算
        progress_percentage = total_games_count > 0 ? (total_imported.to_f / total_games_count * 100).round(1) : 0
        
        # 進捗バーの生成（幅50文字）
        bar_width = 50
        filled = (progress_percentage / 100.0 * bar_width).round
        bar = "█" * filled + "░" * (bar_width - filled)
        
        # 進捗表示
        print "\rProgress: [#{bar}] #{progress_percentage}% | #{total_imported} / #{total_games_count} games imported (offset: #{offset})"
        $stdout.flush
      end
      puts "games imported successfully"
      puts "\n\n=== Import Summary ==="
      puts "Total imported: #{total_imported}"
      puts "Total failed: #{total_failed}"
    rescue => e
      puts "\n\nFatal error: #{e.message}"
      puts e.backtrace.first(5)
      raise
    end
  end
end