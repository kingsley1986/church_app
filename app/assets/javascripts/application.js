// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


// $(document).on('click', '#goingpeople_upcoming_event', function(event) {
//   alert("kdjfkdjfkdjfkdjkfdjkfj")
//   $.ajax({
//     url: $(this).attr('ajax_path'),
//     data: { },
//     async: true,
//     dataType: 'script'
//   });
//   return false;
// });

jQuery(document).ready(function($) {
  if (typeof operamini != 'undefined') {  //check to see if operamini a JS var added by Opera Mini browser exists so other browsers won't error
    if(operamini) { //this should only work for Opera Mini
      $('.collapse').click(function(e){ //bind click which Opera Mini likes better
        e.preventDefault(); //prevent default action
        $(this).collapse({ //manually add collapse to the targeted button
          toggle:true
        });
      });
    }
  }
});


$(document).on('click', '.specific_service', function(event) {
   if (confirm("would you like to come with a friend or family?")) {

     $(".specific_service").hide();
     $("#questionclass").show();
     $("#hiderthisclass").show();
   } else {
     alert("Thank you for chosing to come for this programme")

   }

});


$(document).on('ready page:load', function() {
  $(".tab_cont").submit(function () {
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'), //sumbits it to the given url of the form
      data: valuesToSubmit,
      dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
    });
    alert("Your prayer request is being sent to Pastor, do you wish to continue?")
    $(".tab_cont").trigger('reset');
  })
})


$(document).on('click', '.deletecomment', function(event) {
  $(event.target).closest(".center_div_comment").delay(1500).slideUp('slow');

})
