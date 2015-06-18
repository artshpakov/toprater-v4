class IndexController < ApplicationController

  def index
    @spheres = Sentimeta::Client.spheres
  end

  def sphere
    @presets = Sentimeta::Client::Info.presets(sphere: State.sphere).body['best_ratings']
  end

end
