class Importer::GameImporter
  JAPAN_REGION_ID = 3
  OFFICIAL_WEBSITE_TYPE = 1


  def initialize(api_data)
    @api_data = api_data
  end

  def import
    game = Game.find_or_initialize_by(igdb_id: api_data['id'])

    game.name = japanese_game_localization&.[]('name') || api_data['name']
    game.official_site_url = official_website&.[]('url')
    game.cover_image_url = cover_image_url
    game.igdb_id = api_data['id'] if game.new_record?
    game.save!
  end

  private
  attr_reader :api_data

  def japanese_game_localization
    api_data['game_localizations']&.find{|gl| gl['region'] == JAPAN_REGION_ID}
  end

  def official_website
    api_data['websites']&.find{|w| w['type'] == OFFICIAL_WEBSITE_TYPE}
  end

  def image_id
    japanese_game_localization&.dig('cover','image_id')
  end

  def cover_image_url
    return nil if image_id.nil?
    ExternalApi::Igdb::Constraints::COVER_IMAGE_URL_PREFIX + image_id
  end

end