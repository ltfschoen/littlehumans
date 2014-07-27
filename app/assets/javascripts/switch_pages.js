$('#news').on('click', function(event) {
  event.preventDefault();
  $('#exchange-search').hide();
  $('#exchange-roster').hide();
  $('#exchange-main').show();
})

// prevent click showing all pages
$('#roster').on('click', function(event) {
  event.preventDefault();
  $('#exchange-search').hide();
  $('#exchange-main').hide();
  $('#exchange-roster').show();
  fetchRoster();
});

// clicked the Create Event button
$('#create_event').on('click', function(event) {
  console.log("create_event pressed");
  event.preventDefault();
  $('#exchange-search').hide();
  $('#exchange-main').hide();
  $('#exchange-roster').show();
  createEvent();
})