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



$(document).on('ready page:load', function() {
  $(".tab_cont").submit(function () {
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'), //sumbits it to the given url of the form
      data: valuesToSubmit,
      dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
      console.log("success", json);
    });
    $(".tab_cont").trigger('reset');
  })
})

// $(".resetcomments").click();
// $(".resetcomments").trigger('reset');
// }


$(document).on('click', '.deletecomment', function(event) {
  $(event.target).closest(".center_div_comment").delay(1500).slideUp('slow');

})
