var animalTemplate;
var showAnimals = function(animalsData) {
  $('#animals-list').children().remove();
  $.each(animalsData.animals, renderAnimal);
};
var renderAnimal = function(idx, animal) {
  $('#animals-list').append(animalTemplate(animal));
}
var retrieveAnimals = function() {
  $.ajax({
    url: '/animals',
    dataType: 'json',
    success: showAnimals
  });
};
$(document).ready(function() {
  $.ajax({
    url: '/assets/animals.hbs',
    success: function(templates) {
      $(templates).appendTo('body');
      animalTemplate = Handlebars.compile($('#animal').text());
    }
  }).then(function() {
    $('#retrieve-button').bind('click', retrieveAnimals);
  });
});