$(".messages").on(".message ","ajax:success",function(){$(this).closest(".message").remove()}),$(document).on("click",".specific_service",function(){$(".cd-popup").addClass("is-visible")}),$(document).on("turbolinks:load",function(){var a=41,l="...",i="Read more",s="Read less";$(".textControl").each(function(){var s=$(this).html();if(s.length>a){var e=s.substr(0,a),t=s.substr(a,s.length-a),n=e+'<span class="moreellipses">'+l+'&nbsp;</span><span class="morecontent"><span>'+t+'</span>&nbsp;&nbsp;<a href="" class="morelink">'+i+"</a></span>";$(this).html(n)}}),$(".morelink").click(function(){return $(this).hasClass("less")?($(this).removeClass("less"),$(this).html(i)):($(this).addClass("less"),$(this).html(s)),$(this).parent().prev().toggle(),$(this).prev().toggle(),!1})});