class AnimalsController < ApplicationController
  respond_to :html, :json

  def index
    @animals = []
    @animals << {name: "Bobbie", taxonomy: "mammal", order: "carnivora", family: "canidae"}
    @animals << {name: "Ed", taxonomy: "mammal", order: "perissodactyla", family: "equidae"}

    render_multi_view(action: 'animals/index')
  end

  def from_json_view(options = {})
    template = options[:template] || "#{params[:action]}.json.erb"
    json = JSON::parse render_to_string(template, layout: false)
    json.each_pair do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def render_multi_view(options = {})
    action = options[:action] || params[:action]
    layout = options[:layout] || true
    respond_to do |wants|
      wants.html do
        from_json_view(template: "#{action}.json.erb")
        render action, layout: layout
      end
      wants.json { render action }
    end
  end
end
