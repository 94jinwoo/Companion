<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>컴패니언::Companion</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/main.css">
    <link rel="stylesheet" href="${root }css/mypage/mypage.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
        integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
        crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
        integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
        crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
        
        <!-- Sidebar  -->
		<jsp:include page="../common/sidebar.jsp"/>

        <!-- Page Content  -->
        <div id="content">
            <div id="container">

	            <nav class="navbar navbar-expand-lg navbar-light bg-light">
	                <div class="container-fluid">
	
	                    <button type="button" id="sidebarCollapse" class="btn btn-info">
	                        <i class="fas fa-align-left"></i>
	                        <span>메뉴</span>
	                    </button>
	                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
	                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
	                        aria-expanded="false" aria-label="Toggle navigation">
	                        <i class="fas fa-align-justify"></i>
	                    </button>
	                    
	                     <div class="collapse navbar-collapse" id="navbarSupportedContent">
	                        <c:choose>
	                            <c:when test="${sessionScope.memberVo.member_id==null }">
	                                <script>
	                                	window.location.href="login";
	                                </script>
	                            </c:when>
	                            <c:otherwise>
	                                <ul class="nav navbar-nav ml-auto">
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypurchaselist">주문내역</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagereserve">예약조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mycart">장바구니</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagequestion">문의조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagechk">마이페이지</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }logout">로그아웃</a>
	                                    </li>
	                                </ul>
	                            </c:otherwise>
	                            
	                        </c:choose>
	                    </div>
	                </div>
	            </nav>
	            <div class="maincontent">
	            
					<h1>내 정보 수정</h1>
								<input type="hidden" name="id_chk" id="id_chk" value="${sessionScope.memberVo.member_id }">
								<input type="hidden" name="pw_chk" id="pw_chk" value="${sessionScope.memberVo.member_pw }">
								<input type="hidden" name="tel_chk" id="tel_chk" value="${sessionScope.memberVo.member_tel }">
								<input type="hidden" name="phone_chk" id="phone_chk" value="${sessionScope.memberVo.member_phone }">
								<input type="hidden" name="email_chk" id="email_chk" value="${sessionScope.memberVo.member_email }">
								<input type="hidden" name="addr1_chk" id="addr1_chk" value="${sessionScope.memberVo.member_addr1 }">
								<input type="hidden" name="addr2_chk" id="addr2_chk" value="${sessionScope.memberVo.member_addr2 }">
								<input type="hidden" name="addr3_chk" id="addr3_chk" value="${sessionScope.memberVo.member_addr3 }">
					<table>
						<thead></thead>
						<tbody>
						<tr>
							<th>이름</th>
							<td>${sessionScope.memberVo.member_name }</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="member_pw" id="member_pw" class="input--text" placeholder="현재 비밀번호 입력"></br>
								<input type="password" name="pw_change" id="pw_change" class="input--text" placeholder="변경 할 비밀번호 입력">
								<input type="password" name="pw_change_chk" id="pw_change_chk" class="input--text" placeholder="변경 할 비밀번호 재입력">
								
								<button type="button" id="pw_change_btn" class="cBtn">변경</button>
							</td>
						</tr>
						<tr>
							<th>일반전화</th>
							<td>
								<input type="text" name="tel_change" id="tel_change" class="input--text" value="${sessionScope.memberVo.member_tel }"/>
								<button type="button" id="tel_change_btn" class="cBtn">일반전화 변경</button>
							</td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td>
								<input type="text" name="phone_change" id="phone_change" class="input--text" value="${sessionScope.memberVo.member_phone }"/>
								<button type="button" id="phone_change_btn" class="cBtn">휴대전화 변경</button>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="email" name="email_change" id="email_change" class="input--text" value="${sessionScope.memberVo.member_email }">
								<button type="button" id="email_change_btn" class="cBtn">이메일 변경</button>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								
								<input type="text" name="addr1_change" id="addr1_change" placeholder="5글자 숫자" readonly="readonly" class="input--text" value="${sessionScope.memberVo.member_addr1 }"/>
								<button type="button" onclick="sample2_execDaumPostcode()" class="cBtn" value="우편번호 찾기">우편번호 찾기</button></br>
								
								<input type="text" name="addr2_change" id="addr2_change" placeholder="주소" readonly="readonly" class="input--text" value="${sessionScope.memberVo.member_addr2 }"/>
								
								<input type="text" name="addr3_change" id="addr3_change" placeholder="상세주소" class="input--text" value="${sessionScope.memberVo.member_addr3 }"/>
								
								<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
								
								<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
								</div>
									<button type="button" id="address_change_btn" class="cBtn">주소 변경</button>
							</td>
						</tr>
						</tbody>
					</table>
					<div class="btnbox">
	            	<button type="button" id="pw_change_btn" class="cBtn backBtn" onclick="history.back();">이전으로</button>
	            	</div>
	            </div>
			</div>
			
        <!-- Footer  -->
			<jsp:include page="../common/footer.jsp" />
			<!-- Footer end -->

		</div>
	</div>
	
	
	<!-- script start -->
	<script src="${root }js/jquery-1.12.4.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".input--text").on("click", function(){
				$(this).select();
			});
			
			
			
			// 비밀번호 변경기능
			$("#pw_change_btn").click(function(){
				var member_pw=$("#member_pw").val();
				var pw_chk=$("#pw_chk").val();
				var pw_change=$("#pw_change").val();
				var pw_change_chk=$("#pw_change_chk").val();
				var id_chk=$("#id_chk").val();
				var pwData={"pw_change" : pw_change, "id_chk" : id_chk};
				if(member_pw=="" || pw_change=="" || pw_change_chk==""){
					alert("비밀번호 3칸중 빈칸 있음.");
					return;
				}
				if(member_pw != pw_chk){
					alert("입력된 현재 비밀번호가 틀렸습니다.");
					return;
				}
				if(pw_change != pw_change_chk){
					alert("변경 비밀번호끼리 서로 다름.");
					return;
				}
				var checkPassword=verifyPassword(pw_change,{
					length : [8,20],
					lower : 1,
					numeric : 1,
					special : 1
				});
				if(checkPassword != true){
					alert("비밀번호 양식이 올바르지 않습니다.\n8자이상 / 영문.숫자.특수문자 조합");
					return;
				}
				$.ajax({
					type : "POST",
					url : "/companion/mypage/pwchange",
					data : pwData,
					success : function(result){
						if(result==1){
							alert("비밀번호 변경완료");
							location.reload();
						}else{
							alert("에러.");
						}
					}
				});
			});
			// 일반전화 변경기능
			$("#tel_change_btn").click(function(){
				var id_chk=$("#id_chk").val();
				var tel_chk=$("#tel_chk").val();
				var tel_change=$("#tel_change").val();
				var telData={"tel_change" : tel_change, "id_chk" : id_chk};
				if(tel_change=="") {
					alert("입력된 전화번호가 없습니다.");
					return;
				}
				if(tel_change==tel_chk){
					alert("변경된 사항이 없습니다.");
					return;
				}
				$.ajax({
					type : "POST",
					url : "/companion/mypage/telchange",
					data : telData,
					success : function(result){
						if(result==1){
							alert("일반전화 변경완료");
							location.reload();
						}else{
							alert("에러.");
						}
					}
				});
			});
			// 휴대전화 변경기능
			$("#phone_change_btn").click(function(){
				var id_chk=$("#id_chk").val();
				var phone_chk=$("#phone_chk").val();
				var phone_change=$("#phone_change").val();
				var phoneData={"phone_change" : phone_change, "id_chk" : id_chk};
				if(phone_change=="") {
					alert("입력된 전화번호가 없습니다.");
					return;
				}
				if(phone_change==tel_chk){
					alert("변경된 사항이 없습니다.");
					return;
				}
				$.ajax({
					type : "POST",
					url : "/companion/mypage/phonechange",
					data : phoneData,
					success : function(result){
						if(result==1){
							alert("휴대전화 변경완료");
							location.reload();
						}else{
							alert("에러.");
						}
					}
				});
			});
			// 이메일 변경기능
			$("#email_change_btn").click(function(){
				var id_chk=$("#id_chk").val();
				var email_chk=$("#email_chk").val();
				var email_change=$("#email_change").val();
				var emailData={"email_change" : email_change, "id_chk" : id_chk};
				if(email_change=="") {
					alert("입력된 이메일이 없습니다.");
					return;
				}
				if(email_change==email_chk){
					alert("변경된 사항이 없습니다.");
					return;
				}
				var checkEmail=verifyEmail(email_change);
				if(checkEmail=="no"){
					alert("이메일 양식이 올바르지 않습니다.");
					return;
				}
				$.ajax({
					type : "POST",
					url : "/companion/mypage/emailchange",
					data : emailData,
					success : function(result){
						if(result==1){
							alert("이메일 변경완료");
							location.reload();
						}else{
							alert("에러.");
						}
					}
				});
			});
			// 주소 변경기능
			$("#address_change_btn").click(function(){
				var id_chk=$("#id_chk").val();
				var addr1_chk=$("#addr1_chk").val();
				var addr2_chk=$("#addr2_chk").val();
				var addr3_chk=$("#addr3_chk").val();
				var addr1_change=$("#addr1_change").val();
				var addr2_change=$("#addr2_change").val();
				var addr3_change=$("#addr3_change").val();
				var addrData={"addr1_change" : addr1_change, "addr2_change" : addr2_change, "addr3_change" : addr3_change, "id_chk" : id_chk};
				if(addr1_change=="" || addr2_change=="" || addr3_change=="") {
					alert("입력된 주소가 없습니다.");
					return;
				}
				$.ajax({
					type : "POST",
					url : "/companion/mypage/addrchange",
					data : addrData,
					success : function(result){
						if(result==1){
							alert("주소 변경완료");
							location.reload();
						}else{
							alert("에러.");
						}
					}
				});
			});
			
		});
	
	</script>
	<!-- 주소 넣는 api -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	   
	 // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr1_change").value = data.zonecode;
                document.getElementById("addr2_change").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr3_change").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 400; //우편번호서비스가 들어갈 element의 width
        var height = 500; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 3; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth + 50) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth - 55) + 'px';
    }
    
	  //email validation 처리 함수
		function verifyEmail(member_email){
			var regExp=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(member_email.match(regExp) != null){
				return "ok";
			}else{
				return "no";
			}
		}
		
		//password validation 처리 함수
		function verifyPassword(pw,options){
			// default options (allows any password)
			 var o = {
			  lower:    0,
			  upper:    0,
			  alpha:    0, /* lower + upper */
			  numeric:  0,
			  special:  0,
			  length:   [0, Infinity],
			  custom:   [ /* regexes and/or functions */ ],
			  badWords: [],
			  badSequenceLength: 0,
			  noQwertySequences: false,
			  noSequential:      false
			 };
			 
			 for (var property in options)
			  o[property] = options[property];
			 
			 var re = {
			   lower:   /[a-z]/g,
			   upper:   /[A-Z]/g,
			   alpha:   /[A-Z]/gi,
			   numeric: /[0-9]/g,
			   special: /[\W_]/g
			  },
			  rule, i;
			 
			 // enforce min/max length
			 if (pw.length < o.length[0] || pw.length > o.length[1])
			  return false;
			 
			 // enforce lower/upper/alpha/numeric/special rules
			 for (rule in re) {
			  if ((pw.match(re[rule]) || []).length < o[rule])
			   return false;
			 }
			 
			 // enforce word ban (case insensitive)
			 for (i = 0; i < o.badWords.length; i++) {
			  if (pw.toLowerCase().indexOf(o.badWords[i].toLowerCase()) > -1)
			   return false;
			 }
			 
			 // enforce the no sequential, identical characters rule
			 if (o.noSequential && /([\S\s])\1/.test(pw))
			  return false;
			 
			 // enforce alphanumeric/qwerty sequence ban rules
			 if (o.badSequenceLength) {
			  var lower   = "abcdefghijklmnopqrstuvwxyz",
			   upper   = lower.toUpperCase(),
			   numbers = "0123456789",
			   qwerty  = "qwertyuiopasdfghjklzxcvbnm",
			   start   = o.badSequenceLength - 1,
			   seq     = "_" + pw.slice(0, start);
			  for (i = start; i < pw.length; i++) {
			   seq = seq.slice(1) + pw.charAt(i);
			   if (
			    lower.indexOf(seq)   > -1 ||
			    upper.indexOf(seq)   > -1 ||
			    numbers.indexOf(seq) > -1 ||
			    (o.noQwertySequences && qwerty.indexOf(seq) > -1)
			   ) {
			    return false;
			   }
			  }
			 }
			 
			 // enforce custom regex/function rules
			 for (i = 0; i < o.custom.length; i++) {
			  rule = o.custom[i];
			  if (rule instanceof RegExp) {
			   if (!rule.test(pw))
			    return false;
			  } else if (rule instanceof Function) {
			   if (!rule(pw))
			    return false;
			  }
			 }
			 
			 // great success!
			 return true;
			}
    
    </script>
    
    <!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>
    <!-- script end -->
</body>
</html>