class AlternativesController < ApplicationController

  def index
  	@criteria = Criterion.all
  end

end
