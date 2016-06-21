$(document).ready(function(){
    $(window).bind('scroll',function(e){
        parallaxScroll();
    });
    function parallaxScroll(){
        var scrolledY = $(window).scrollTop();
        $('.title').css({
            top : (scrolledY * 0.53),
            opacity : 1-(scrolledY/266)
        });
        $('.country').css({
            top : (scrolledY * 0.53),
            opacity : 1-(scrolledY/266)
        });
    }
});
