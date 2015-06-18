class AlternativesController < ApplicationController

  OBJECTS_PER_PAGE = 6

  before_action do
    params.reverse_merge! JSON.parse(params.delete(:p)) if params[:p].present?
  end


  def index
    respond_to do |format|
      format.html
      format.json do
        render json: Alternative.rate(params.slice(:criteria, :filters).merge limit_objects: OBJECTS_PER_PAGE), root: nil
      end
    end
  end

end
