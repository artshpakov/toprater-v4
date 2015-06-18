class Alternative < Sentimeta::Model

  endpoint :objects

  attr_accessor :id, :full_id, :name, :photos, :coordinates
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

end
