class AlternativesController < ApplicationController

  before_action do
    params.reverse_merge! JSON.parse(params.delete(:p)) if params[:p].present?
  end


  def index
    respond_to do |format|
      format.html do
        render :map
      end
      format.json do
        render json: Alternative.rate(params), root: nil # TODO inventorize params
      end
    end
  end

end
