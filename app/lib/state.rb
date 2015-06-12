module State
  extend self

  attr_accessor :locale, :sphere, :criteria

  def init! options
    ParamsService.decode! options[:params]

    dup = options[:params].dup
    self.locale    = dup.delete :locale
    self.sphere    = dup.delete :sphere
    self.criteria  = dup.delete :criteria
  end

  def to_hash
    { locale: locale, sphere: sphere, criteria: criteria }
  end

end
