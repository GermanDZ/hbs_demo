class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def from_json_view(options = {})
    template = options[:template] || "#{params[:action]}.json"
    json = JSON::parse render_to_string(template, layout: false)
    json.each_pair do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def render_multi_view(options = {})
    action = options[:action] || params[:action]
    template_json = options[:template_json] || action
    layout = options[:layout] || true
    respond_to do |wants|
      wants.html do
        from_json_view(template: "#{template_json}.json")
        render action, layout: layout
      end
      wants.json { render action }
    end
  end
end
