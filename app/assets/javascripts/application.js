// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .


// mobile and desktop friendly
// function adjustStyle(width) {
//     width = parseInt(width);
//     if (width < 701) {
//         $("#size-stylesheet").attr("href", "../narrow.css.scss");
//     } else if ((width >= 701) && (width < 900)) {
//         $("#size-stylesheet").attr("href", "../medium.css.scss");
//     } else {
//        $("#size-stylesheet").attr("href", "../wide.css.scss"); 
//     }
//     // add iphone.css.scss and style.css.scss
// }

// $(function() {
//     adjustStyle($(this).width());
//     $(window).resize(function() {
//         adjustStyle($(this).width());
//     });
// });