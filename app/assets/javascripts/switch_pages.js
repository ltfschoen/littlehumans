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