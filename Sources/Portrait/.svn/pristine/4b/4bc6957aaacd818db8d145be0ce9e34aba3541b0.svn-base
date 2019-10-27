jQuery(document).ready(function($) {

  /* Run examples */
  $('.token-example-field').tokenfield();

  var tagList = $('#tagList').val();
  var tags = tagList.split(",");
  
  $('.form-control').tokenfield({
    autocomplete: {
      source: tags,
      delay: 100
    },
    showAutocompleteOnFocus: true,
    delimiter: [',',' ', '-', '_']
  });

  var peopleList = $('#peopleList').val();
  var people = peopleList.split(",");
  
  $('.form-control2').tokenfield({
    autocomplete: {
      source: people,
      delay: 100
    },
    showAutocompleteOnFocus: true,
    delimiter: [',', '-', '_']
  });
	
});

function createTagToken() {
	
	$('.token-example-field').tokenfield();
	
	  var tagList = $('#tagList').val();
	  var tags = tagList.split(",");
	  
	  $('.form-control').tokenfield({
	    autocomplete: {
	      source: tags,
	      delay: 100
	    },
	    showAutocompleteOnFocus: true,
	    delimiter: [',',' ', '-', '_']
	  });
}

function createPeopleToken() {
	
	$('.token-example-field').tokenfield();
	
	var peopleList = $('#peopleList').val();
	var people = peopleList.split(",");
	
	$('.form-control2').tokenfield({
		autocomplete: {
			source: people,
			delay: 100
		},
		showAutocompleteOnFocus: true,
		delimiter: [',', '-', '_']
	});
}