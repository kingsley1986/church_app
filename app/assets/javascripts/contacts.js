$(function(){
  $(".tab_cont").submit(function(event){
    event.preventDefault();
    $(".tab_cont").trigger('reset');
  });
});
