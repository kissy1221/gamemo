class ExternalApi::Igdb::TokenService
  TOKEN_URL = 'https://id.twitch.tv/oauth2/token'
  def initialize
    @client_id = ENV["IGDB_CLIENT_ID"]
    @client_secret = ENV["IGDB_CLIENT_SECRET"]
  end

  
end