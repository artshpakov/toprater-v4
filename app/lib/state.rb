module State
  extend self

  attr_accessor :locale, :sphere, :criteria, :filters, :options

  def init! options
    dup = options[:params].dup
    self.locale    = dup.delete :locale
    self.sphere    = dup.delete :sphere
    self.criteria  = dup.delete :criteria
    self.filters   = dup.delete :filters
    self.options   = dup.reject { |key, value| key.in? %w(controller action format) }
  end

    def to_hash
      { locale: locale, sphere: sphere, criteria: criteria, filters: filters, options: options }
    end

end
