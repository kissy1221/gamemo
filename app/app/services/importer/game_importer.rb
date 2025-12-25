class Importer::GameImporter
  def initialize(api_data)
    @api_data = api_data
  end

  def import
    game = Game.find_or_initialize_by(igdb_id: @api_data['id'])
    japanese_game_localization = @api_data['game_localizations']&.find{|gl| gl['region'] == 3}
    image_id = japanese_game_localization&.[]('cover')&.[]('image_id')
    official_website = @api_data['websites']&.find{|w| w['type'] == 1}

    game.name = japanese_game_localization&.[]('name') || @api_data['name']
    game.official_site_url = official_website&.[]('url')
    game.cover_image_url = image_id.nil? ? nil : ExternalApi::Igdb::Constraints::COVER_IMAGE_URL_PREFIX + image_id
    game.igdb_id = @api_data['id'] if game.new_record?
    game.save!
  end
end