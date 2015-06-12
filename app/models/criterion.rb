class Criterion < Sentimeta::Model

  endpoint :criteria

  attr_accessor :name, :label, :subcriteria

  def self.all
    Array.wrap(fetch subcriteria: true).each do |root|
      root.subcriteria.map! { |criterion| new criterion }
    end
  end

  def self.leafs
    all.flat_map &:subcriteria
  end

end
