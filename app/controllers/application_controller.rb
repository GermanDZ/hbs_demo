class ApplicationController < ActionController::Base
  protect_from_forgery

  def from_json_view(options = {})
    template = options[:template] || "#{params[:action]}.json.erb"
    json = JSON::parse render_to_string(template, layout: false)
    json.each_pair do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def render_multi_view(options = {})
    action = options[:action] || params[:action]
    action_json = options[:action_json] || action
    layout = options[:layout] || true
    respond_to do |wants|
      wants.html do
        from_json_view(template: "#{action_json}.json.erb")
        render action, layout: layout
      end
      wants.json { render action }
    end
  end
end
