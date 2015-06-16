class Alternative < Sentimeta::Model

  endpoint :objects

  attr_accessor :id, :full_id, :name


  def full_id() @full_id || id end

  def self.rate options
    fetch \
      criteria: (options.delete(:criteria) || State.criteria),
      filters: (options.delete(:filters) || State.filters),
      fields: options
  end

end
