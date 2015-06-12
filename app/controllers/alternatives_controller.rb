class AlternativesController < ApplicationController

  before_action do
    params.reverse_merge! JSON.parse(params.delete(:p)) if params[:p].present?
  end


  def index
    respond_to do |format|
      format.html
      format.json do
        render json: Alternative.rate(params) # TODO inventorize params
      end
    end
  end

end
