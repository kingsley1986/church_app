document.addEventListener("turbolinks:load",function(){"use strict";$(".Modern-Slider").slick({autoplay:!0,speed:1e3,slidesToShow:1,slidesToScroll:1,pauseOnHover:!1,dots:!0,fade:!0,pauseOnDotsHover:!0,cssEase:"linear",draggable:!1,prevArrow:'<button class="PrevArrow"></button>',nextArrow:'<button class="NextArrow"></button>'}),$(".box-video").click(function(){$("iframe",this)[0].src+="&amp;autoplay=1",$(this).addClass("open")}),$(".owl-carousel").owlCarousel({loop:!0,margin:30,responsiveClass:!0,responsive:{0:{items:1,nav:!0},600:{items:2,nav:!1},1e3:{items:3,nav:!0,loop:!1}}})});