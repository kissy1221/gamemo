class ExternalApi::Igdb::GenreFetcher
  def initialize
    @client = ExternalApi::Igdb::Client.new
  end

  def fetch_genres(query)
    @client.post('genres', "fields name, slug;
    limit 100;")
  end
end