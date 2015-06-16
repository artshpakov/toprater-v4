class Filters::Catalog

  def self.encode value
    value.select { |e| e.present? }.join(',')
  end

  def self.decode value
    catalog = value.split(',')
    Array.new(3) { |i| catalog[i] || "" }
  end

end
