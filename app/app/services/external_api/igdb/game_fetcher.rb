class ExternalApi::Igdb::GameFetcher
  def initialize
    @client = ExternalApi::Igdb::Client.new
  end

  def fetch(offset=0)
    @client.post('games', 
      "fields name,game_localizations.name, game_localizations.region, game_localizations.cover.image_id, websites.url, websites.type;
      where game_type = (0,2,4,8,9,10,11) & version_parent = null;
      limit #{ExternalApi::Igdb::Constraints::MAX_LIMIT};
      offset #{offset};")
  end
end