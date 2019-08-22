//
//= require jquery
//= require jquery.turbolinks

//= require jquery_ujs

//= require turbolinks

//= require_tree .




$(document).on('click', '.deletecomment', function(event) {
  $(event.target).closest(".center_div_comment").delay(1500).slideUp('slow');
})

/* Demo purposes only */
$(document).on('turbolinks:load', function() {

  //Count nr. of square classes
  var countSquare = $('.square').length;

  //For each Square found add BG image
  for (i = 0; i < countSquare; i++) {
    var firstImage = $('.square').eq([i]);
    var secondImage = $('.square2').eq([i]);

    var getImage = firstImage.attr('data-image');
    var getImage2 = secondImage.attr('data-image');

    firstImage.css('background-image', 'url(' + getImage + ')');
    secondImage.css('background-image', 'url(' + getImage2 + ')');
  }

});
