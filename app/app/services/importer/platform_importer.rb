class Importer::PlatformImporter
  def initialize(api_data)
    @api_data = api_data
  end

  def import
    platform = Platform.find_or_initialize_by(igdb_id: @api_data['id'])
    platform.name = @api_data['name']
    platform.slug = @api_data['alternative_name']
    platform.igdb_id = @api_data['id'] if platform.new_record?
    platform.save!
  end
end