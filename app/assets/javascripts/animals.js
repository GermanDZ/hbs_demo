var animalTemplate;

var showAnimals = function(animalsData) {
  $('#animals-list').children().remove();
  $.map(animalsData.animals, renderAnimal);
};

var renderAnimal = function(animal) {
  $('#animals-list').append(animalTemplate(animal));
}

var retrieveAnimals = function() {
  $.ajax({
    url: '/animals/index',
    dataType: 'json',
    success: showAnimals
  });
};

var addAnimal = function() {
  renderAnimal({
    name: $('#name').val(),
    taxonomy: 'mammal',
    order: 'carnivora',
    family: 'felidae'
  });
}

$.ajax({
  url: '/assets/animals.hbs',
  success: function(templates) {
    $(templates).appendTo('body');
    animalTemplate = Handlebars.compile($('#animal').text());
  }
}).then(function() {
  $('#retrieve-button').bind('click', retrieveAnimals);
  $('#add-button').bind('click', addAnimal);
});