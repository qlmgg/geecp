
$(window).scroll(function(){
    if($(window).scrollTop()>78){
        $('.right_side').addClass('hasscroll');
    }else{
        $('.right_side').removeClass('hasscroll');
    }
})