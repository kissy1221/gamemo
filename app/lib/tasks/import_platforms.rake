namespace :igdb do
  task import_platforms: :environment do
    puts "Importing platforms..."
    offset = 0
    platform_fetcher = ExternalApi::Igdb::PlatformFetcher.new
    loop do
      platforms = platform_fetcher.fetch(offset)
      break if platforms.empty?
      platforms.each do |platform|
        Importer::PlatformImporter.new(platform).import
      end
      offset = offset + ExternalApi::Igdb::Constraints::MAX_LIMIT
    end
    puts "platforms imported successfully"
  end
end