class ParamsService

  def self.decode! params
    params[:criteria] = params[:criteria].split(',') if params[:criteria].present? && params[:criteria].kind_of?(String)
  end


  def self.encode params={}
    criteria = Array.wrap(params[:criteria]).join(',') if params[:criteria].present?
    params.merge({ criteria: criteria, filters: filters })
  end

end
