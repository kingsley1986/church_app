//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .



$(document).on('click', 'button#send_prayer', function(e) {
    $.ajax({
        url: $(this).attr('action'),
        data: $(this).serialize(),
        type: "POST",
        dataType: "json",
        success: function(response) {
            console.log(response)
        },
        error: function(xhr, textStatus, errorThrown) {

          console.log(errorThrown)
        },
    });
    e.preventDefault(); //THIS IS VERY IMPORTANT
    $(".tab_cont").trigger('reset');



});


$(document).on('click', '.specific_service', function(event) {
  $('.cd-popup').addClass('is-visible');
});


$(document).on('click', '.deletecomment', function(event) {
  $(event.target).closest(".center_div_comment").delay(1500).slideUp('slow');

})
