class Importer::GenreImporter
  def initialize(api_data)
    @api_data = api_data
  end

  def import
    genre = Genre.find_or_initialize_by(igdb_id: @api_data['id'])
    genre.name = @api_data['name']
    genre.slug = @api_data['slug']
    genre.igdb_id = @api_data['id'] if genre.new_record?
    genre.save!
  end
end