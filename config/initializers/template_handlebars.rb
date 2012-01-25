require 'action_view/template/handlers/handlebars'

ActionView::Template.register_template_handler(:hbs, ActionView::Template::Handlers::Handlebars.new)