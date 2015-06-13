class AlternativesController < ApplicationController

  before_action do
    params.reverse_merge! JSON.parse(params.delete(:p)) if params[:p].present?
  end


  def index
    if params[:filters]
      respond_to do |format|
        format.html do
          return render :map
        end
        format.json do
          return render json: Alternative.rate(params), root: nil # TODO inventorize params
        end
      end
    else
      @catalog = Sentimeta::Client.fetch(:catalog, sphere: :hotels).body['catalog']
    end
  end

end
