class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception


  before_action :set_locale, :set_sphere, :setup

  def set_locale
    return redirect_to root_path locale: :en unless params[:locale].present?
    I18n.locale = params[:locale]
  end

  def set_sphere
    Sentimeta.sphere = params[:sphere] if params[:sphere].present?
  end

  def setup
    if request.xhr?
      if p = params.delete(:p)
        params.merge! JSON.parse(p)
      end
    else
      ParamsService.decode! params
    end

    State.init! params: params

    gon.state     = State.to_hash
    gon.criteria  = Criterion.leafs
  end

end
