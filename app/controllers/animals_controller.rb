class AnimalsController < ApplicationController
  respond_to :html, :json

  def index
    @animals = []
    @animals << {name: "Bobbie", taxonomy: "mammal", order: "carnivora", family: "canidae"}
    @animals << {name: "Ed", taxonomy: "mammal", order: "perissodactyla", family: "equidae"}

    render_multi_view
  end

  def index_hbs
    @animals = []
    @animals << {name: "Ed", taxonomy: "mammal", order: "perissodactyla", family: "equidae"}
    @animals << {name: "Cattie", taxonomy: "mammal", order: "carnivora", family: "felidae"}

    render_multi_view(action_json: 'animals/index')
  end

end
