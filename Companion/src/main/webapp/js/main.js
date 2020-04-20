//sidebar 메뉴바 접기
function sidebarCollapse() {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
}
// 뒤로가기 버튼
function historyBack() {
	$(".btn_back").on("click", function() {
		history.back();
	});
}

$(document).ready(function () {
    sidebarCollapse();
});

//right scrollbar 상단이동 버튼
var topBtn = $('#topBtn');
var delay = 500;
topBtn.on('click', function() {
  $('html, body').stop().animate({scrollTop: 0}, delay);
});


//해당항목 체크박스 전체선택
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    })
})