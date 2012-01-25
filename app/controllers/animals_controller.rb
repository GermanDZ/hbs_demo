class AnimalsController < ApplicationController
  respond_to :html, :json

  def index
    @animals = []
    @animals << {name: "Bobbie", taxonomy: "mammal", order: "carnivora", family: "canidae"}
    @animals << {name: "Ed", taxonomy: "mammal", order: "perissodactyla", family: "equidae"}

    render_multi_view(action: 'animals/index')
  end

end
