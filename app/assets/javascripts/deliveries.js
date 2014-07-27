/*
  in the deliveries view. when the user clicks one of the babies (anywhere on their row)
  an ajax query is performed to grab the babies details in json format from the database
  and once the ajax success handler indicates this action has been completed, we use 
  jQuery to switch the page that is displayed to be the 'show' page associated with 
  that baby (delivery) id. 
  this functionality improves the user experience as it replicates 'touch' functionality. 
  whereby the user is not constrained by only being able to click a small URL tag to 
  switch views.
*/
function showDelivery(delivery) {
  console.log(delivery);
  var options = {
    url: "/deliveries/" + delivery, 
    type: "get",
    dataType: "json"
  }

  $.ajax(options).done(function(delivery) {
    console.log("ajax calendar success");
    console.log(delivery.id);
    dom = "#fake_click_" + delivery.id;
    console.log(dom);
    //https://developer.mozilla.org/en-US/docs/Web/API/Window.location
    var initialPage = window.location.pathname;
    console.log(initialPage);
    b = window.location.replace(initialPage + "/" + delivery.id);
    console.log(b);
  }).done(function(dom_data) { // success handler
    console.log("data is: " + dom_data);
  }).error(function(dom_data) { // failure handler
    console.log("error is: " + dom_data);
  });
}

$(document).ready(function() {
});