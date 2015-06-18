class Alternative < Sentimeta::Model

  endpoint :objects

  attr_accessor :id, :full_id, :name, :photos, :coordinates, :overall_rating
  include ActiveModel::Serialization

  def full_id() @full_id || id end

  def self.rate options
    fetch \
      criteria: (options.delete(:criteria) || State.criteria),
      filters: (options.delete(:filters) || State.filters),
      fields: options
  end

  def cover
    entry = photos.find { |p| p['type']=='primary_image' } || photos.find { |p| p['type']=='photo' } || photos.first
    entry.try(:[], 'hash').present? ? "https://api.toprater.com/api/v1/picture?hash=#{ entry['hash'] }" : entry['url']
  rescue
    nil
  end

  def coordinates
    { latitude: @coordinates['lat'], longitude: @coordinates['lng'] } if @coordinates.present?
  end

  def rating
    ((overall_rating + 1) * 2.5).round(1) rescue nil
  end

end
