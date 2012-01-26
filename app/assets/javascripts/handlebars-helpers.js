Handlebars.registerHelper('I18n', function(options) {
  var key = options.hash['key'];
  delete options.hash.key;
  return I18n.t(key, options.hash);
});