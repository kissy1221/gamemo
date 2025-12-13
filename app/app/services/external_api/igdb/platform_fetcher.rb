class ExternalApi::Igdb::PlatformFetcher
  def initialize
    @client = ExternalApi::Igdb::Client.new
  end

  def fetch(offset=0)
    @client.post('platforms', 
    "fields name, slug, alternative_name;
    limit #{ExternalApi::Igdb::Constraints::MAX_LIMIT};
    offset #{offset};")
  end
end