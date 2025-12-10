class ExternalApi::Igdb::Client
  BASE_URL = 'https://api.igdb.com/v4'

  def initialize
    @client_id = ENV["IGDB_CLIENT_ID"]
    @token = ENV["IGDB_TOKEN_KEY"]
  end

  def post(path, body)
    HTTParty.post(
      "#{BASE_URL}/#{path}",
      headers: {
        "Authorization" => "Bearer #{@token}",
        "Client-ID" => @client_id,
      },
      body: body
    )
  end
end