//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .



// $(document).on('click', '.tab_cont', function(e) {
//     $.ajax({
//         url: $(this).attr('action'),
//         data: $(this).serialize(),
//         type: "POST",
//         dataType: "json",
//         success: function(response) {
//             console.log(response)
//         },
//         error: function(xhr, textStatus, errorThrown) {
//
//           console.log(errorThrown)
//         },
//     });
//     e.preventDefault(); //THIS IS VERY IMPORTANT
//     $(".tab_cont").trigger('reset');
// });
$(document).on('ready page:load', function() {
  $("#newcomment").submit(function (event) {
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'), //sumbits it to the given url of the form
      data: valuesToSubmit,
      dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
      console.log("success", json);
    });
    $("#newcomment").trigger('reset');
  })
})



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

$(document).on('click', '.specific_service', function(event) {
  $('.cd-popup').addClass('is-visible');
});


$(document).on('click', '.deletecomment', function(event) {
  $(event.target).closest(".center_div_comment").delay(1500).slideUp('slow');

})
