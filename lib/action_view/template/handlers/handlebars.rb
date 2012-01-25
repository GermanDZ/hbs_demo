require 'handlebars'

class ActionView::Template::Handlers::Handlebars
  extend ActiveSupport::Benchmarkable

  def call(template)
    <<-RUBY_CODE
      template = ActionView::Template::Handlers::Handlebars.compile_template('#{template.virtual_path}', '#{template.source}');
      partial_renderer = @view_renderer.send(:_partial_renderer)
      locals = partial_renderer.instance_variable_get('@locals')
      context = partial_renderer.instance_variable_get('@options')[:context] || {}
      rendered = ActionView::Template::Handlers::Handlebars.render(template, config, @_assigns, locals, context)
      rendered.html_safe
    RUBY_CODE
  end

  def self.logger
    @@logger ||= Rails.logger
  end

  def self.render(template, config, *values)
    vars = {}
    values.each {|v| vars.merge! v }
    template.call(vars.as_json)
  end

  def self.compile_template(path, name)
    benchmark("Compiling handlebar #{path}") do
      Handlebars.register_helper(:I18n) do |context, block|
        params = {}
        context['hash'].each do |key, value|
          params[key.to_sym] = value unless key == 'key'
        end
        I18n.translate(context['hash']['key'], params)
      end
      Handlebars.compile(name)
    end
  end
end
