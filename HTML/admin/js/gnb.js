 // aside 리스트 하위항목 숨기기 및 보이기 기능
 $(function(){
    $(document).on('click', '#gnb > li', function(){
        $('#gnb > li').not($(this)).children('ol').slideUp(200);
        $(this).children('ol').slideDown(200);

    });
})