$(function(){
  $(".contactForm").on("submit", function(event){
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),

    success: function(response) {
        if (response == "success")
        alert("")
        else
        $(".message-class").html("<span class='text-error marginl10' ><b>Not sent, please fill in the correct details..</b></span>")
    }
    });
    event.preventDefault();
    $(".contactForm").trigger('reset');

  });
})
