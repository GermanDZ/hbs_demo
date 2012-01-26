class AnimalsController < ApplicationController
  respond_to :html, :json

  def index
    @animals = []
    @animals << Animal.new({name: "Bobbie", taxonomy: "mammal", order: "carnivora", family: "canidae"})
    @animals << Animal.new({name: "Ed", taxonomy: "mammal", order: "perissodactyla", family: "equidae"})

    render_multi_view
  end

  def index_hbs
    @animals = []
    @animals << Animal.new({name: "Ed", taxonomy: "mammal", order: "perissodactyla", family: "equidae"})
    @animals << Animal.new({name: "Cattie", taxonomy: "mammal", order: "carnivora", family: "felidae"})

    render_multi_view(template_json: 'animals/index')
  end

  def index_erb
    @animals = []
    @animals << Animal.new({name: "Ed", taxonomy: "mammal", order: "perissodactyla", family: "equidae"})
    @animals << Animal.new({name: "Cattie", taxonomy: "mammal", order: "carnivora", family: "felidae"})
  end

end
