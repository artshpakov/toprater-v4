class ParamsService

  def self.decode! params
    params[:criteria] = params[:criteria].split(',') if params[:criteria].present? && params[:criteria].kind_of?(String)

    if params[:filters].present?
      hash = {}
      filters = params[:filters].split('/')
      while filters.present?
        key   = filters.shift.to_sym
        value = filters.shift
        type = key.to_s #F_PRESETS[params[:sphere]][key.to_s]['kind'] rescue 'string'
        hash[key] = ("Filters::#{ type.camelcase }".constantize.decode(value) rescue value)
      end
      params[:filters] = hash
    end
  end


  def self.encode params={}
    params = State.to_hash.merge(params)

    criteria = Array.wrap(params[:criteria]).join(',') if params[:criteria].present?

    filters  = params[:filters].map do |key, value|
      type = key
      key = key.to_sym
      # type = F_PRESETS[params[:sphere]][key.to_s]['kind'] rescue 'string'
      [ key, "Filters::#{ type.capitalize }".constantize.encode(value) ] rescue [key, value]
    end.flatten.join('/') if params[:filters].present?

    params.merge({ criteria: criteria, filters: filters })
  end

end
