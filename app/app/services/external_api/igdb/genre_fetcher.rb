class ExternalApi::Igdb::GenreFetcher
  def initialize
    @client = ExternalApi::Igdb::Client.new
  end

  def fetch(offset=0)
    @client.post('genres', 
    "fields name, slug;
    limit #{ExternalApi::Igdb::Constraints::MAX_LIMIT};
    offset #{offset};")
  end
end