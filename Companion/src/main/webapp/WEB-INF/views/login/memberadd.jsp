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
    <link rel="stylesheet" href="${root }css/login/join.css">

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
	                                <ul class="nav navbar-nav ml-auto">
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }login">로그인</a>
	                                    </li>
	                                    <li class="nav-item active">
	                                        <a class="nav-link" href="${root }login/memberadd">회원가입</a>		
	                                    </li>
	                                </ul>
	                            </c:when>
	                            <c:otherwise>
	                                <script>
	                                	window.history.back();
	                                </script>
	                            </c:otherwise>
	                            
	                        </c:choose>
	                    </div>
	                </div>
	            </nav>
	            
	            
				<section class="section">
				<!--  test  sdflkjskdlfdklsjf -->
				<form name="memberadd" method="post" autocomplete="off" class="form-join needs-validation" novalidate>
                <h1 class="h3 mb-3 font-weight-normal">회원가입</h1>
                <!-- ID -->
                <div class="mb-3">
                    <label for="member_id">*아이디</label>
                    <div class="address-box clear-fix">
                    <input type="text" class="form-control" name="member_id" id="member_id" placeholder="8자 이상,영어,숫자" required>
                    <input type="button" class="adressbtn" id="id_chk_btn" value="중복확인">
                    </div>
					<!-- 아이디 체크여부  //1 안함  2 함//-->
					<input type="hidden" name="id_chk_value" id="id_chk_value" value="1">
                </div>
                
                <!-- Password -->
                <div class="mb-3">
                    <label for="member_pw">*비밀번호</label>
                    <input type="password" class="form-control" name="member_pw" id="member_pw" placeholder="8자이상, 영어, 숫자, 특수문자" required>
                </div>
                <!-- Password Confirmation -->
                <div class="mb-3">
                    <label for="member_pw_chk">*비밀번호확인</label>
                    <input type="password" class="form-control" id="member_pw_chk" placeholder="위 비밀번호와 동일하게 입력" required>
                </div>
                
                <!-- Name -->
                <div class="mb-3">
                    <label for="member_name">*이름</label>
                    <input type="text" class="form-control" name="member_name" id="member_name" placeholder="공백없이 실명 입력" required>
                </div>
                
                <!-- tel -->
                <div class="mb-3">
                    <label for="member_tel">집전화번호</label>
                    <input type="text" class="form-control" name="member_tel" id="member_tel" placeholder="'-' 없이 숫자만 입력">
                </div>
                
                <!-- phone -->
                <div class="mb-3">
                    <label for="member_phone">*휴대폰번호</label>
                        <input type="text" class="form-control" name="member_phone" id="member_phone" placeholder="'-' 없이 숫자만 입력" required>
                </div>
                
                <!-- Email -->
                <c:choose>
	            	<c:when test="${k_email!=null }">
	            	<!-- 카톡 로그인을 통해서 왔을때 -->
	            	 <div class="mb-3">
						<label for="member_email">*E-MAIL</label>
						<input type="email" name="member_email" id="member_email" class="form-control" value="${k_email }" readonly="readonly">
					<!-- 이메일 중복확인,인증은 한 것으로 처리 -->
						<input type="hidden" name="email_chk_value" id="email_chk_value" value="2">
						<!-- 이메일 인증여부 //1안함 2함// -->
						<input type="hidden" name="email_overlap_chk_value" id="email_overlap_chk_value" value="2">
						<!-- 이메일 중복확인여부 //1 안함 2 함 // -->
						</div>
	            	</c:when>
	            	<c:otherwise>
	            	<!-- 그냥 회원가입으로 왔을 떄 -->
	            	
	            	 <div class="mb-3">
						<label for="member_email">*E-MAIL</label>
						<div class="address-box clear-fix">
							<input type="email" name="member_email" id="member_email" class="form-control" placeholder="이메일 형식에 맞춰 입력">
							<input type="button" id="email_overlap_chk" class="adressbtn" value="중복확인">
						</div>
						<button type="button" id="email_chk_btn" class="adressbtn">인증번호받기</button></br>
						
						<p name="email_chk_panel" id="email_chk_panel"  class="address-box clear-fix" style="display:none">
							<input type="text" name="member_email_chk" id="member_email_chk" class="form-control" placeholder="받으신 인증번호를 입력해 주세요.">
							<input type="button" class="adressbtn" id="email_chk_btn2" value="확인">
						</p>
						<input type="hidden" name="email_random_msg" id="email_random_msg" value="">
						<input type="hidden" name="email_chk_value" id="email_chk_value" value="1">
						<!-- 이메일 인증여부 //1안함 2함// -->
						<input type="hidden" name="email_overlap_chk_value" id="email_overlap_chk_value" value="1">
						<!-- 이메일 중복확인여부 //1 안함 2 함 // -->
						</div>
	            	</c:otherwise>
	            </c:choose>
	            
                <!-- address -->
                <div class="mb-3">
                    <label for="address">*주소</label>
                    <div class="address-box clear-fix">
                        <input type="text" class="form-control" name="member_addr1" id="sample2_postcode" placeholder="우편번호">
                        <input type="button" class="adressbtn" id="postSearch" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"></br>
                    </div>
                    <input type="text" class="form-control" name="member_addr2" id="sample2_address" placeholder="주소">
                    <input type="text" class="form-control" name="member_addr3" id="sample2_detailAddress" placeholder="상세주소">
                    <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
                </div>
            
            	<input type="hidden" name="member_grade" id="member_grade" value="2">
            	
                <!-- 약관동의 체크박스 -->
                <hr class="mb-4">
                 
                <div class="custom-control custom-checkbox">
		          <input type="checkbox" class="custom-control-input" id="agree_check1">
		          <label class="custom-control-label" for="agree_check1">개인정보 수집 및 이용에 동의합니다. (필수)</label>
	        	</div>
		        <div class="custom-control custom-checkbox">
		          <input type="checkbox" class="custom-control-input" id="agree_check2">
		          <label class="custom-control-label" for="agree_check2">이용약관에 동의합니다. (필수)</label>
		        </div>
                <hr class="mb-4">
               
                <button class="btn btn-lg btn-outline-primary btn-block" type="button" id="memberadd_btn">회원가입</button>
                <!-- Divider Text -->
                <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-3">
                    <div class="border-bottom w-100 ml-6"></div>
                    <div class="border-bottom w-100 mr-6"></div>
                </div>
            
            	<button class="btn btn-lg btn-outline-secondary btn-block" type="button" onclick="history.back();">뒤로</button>
                <!-- <button class="btn btn-lg btn-warning btn-block" type="submit">
                    <i class="fas fa-comment"></i>&nbsp;&nbsp;&nbsp;카카오톡 로그인
                </button> -->
           <!--      <button type="button" onclick="history.back();" class="mainBtn">뒤로</button> -->
            
            </form>	
					
				</section>
			</div>
			
        <!-- Footer  -->
		<jsp:include page="../common/footer.jsp" />
		<!-- Footer end -->

		</div>
	</div>
	
	<script src="${root }js/jquery-1.12.4.js"></script>
    <!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>
    <!-- script end -->
	<!-- script start -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	   
	$(document).on('click','#postSearch',function(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
	                document.getElementById('sample2_postcode').value = data.zonecode;
	                document.getElementById("sample2_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample2_detailAddress").focus();
	            }
	        }).open();
	}); 
	
	</script>
	
	<script type="text/javascript">
	
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
		
		$(document).ready(function(){
			$("#memberadd_btn").click(function(){
				var member_id=$("#member_id").val();
				var member_pw=$("#member_pw").val();
				var member_pw_chk=$("#member_pw_chk").val();
				var member_name=$("#member_name").val();
				var member_phone=$("#member_phone").val();
				var regPhone = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g; 
		   		 
				var member_email=$("#member_email").val();
				var member_addr1=$("#sample2_postcode").val();
				var member_addr2=$("#sample2_address").val();
				var member_addr3=$("#sample2_detailAddress").val();
				var id_chk_value=$("#id_chk_value").val();
				var email_overlap_chk_value=$("#email_overlap_chk_value").val();
				if(member_pw!=member_pw_chk){
					alert("비밀번호가 서로 일치하지 않습니다. 확인해 주세요.");
					return;
				}
				if(member_id=="" || member_pw=="" || member_pw_chk=="" || member_name=="" || member_phone=="" || member_email=="" || member_addr1=="" || member_addr2=="" || member_addr3==""){
					alert("필수 사항을 입력해 주세요.");
					return;
				}
				if(id_chk_value=="1"){
					alert("아이디 중복확인을 해주세요.");
					return;
				}
				if(email_overlap_chk_value=="1"){
					alert("이메일 중복확인을 해주세요.");
					return;
				}
				var checkPassword=verifyPassword(member_pw,{
					length : [8,20],
					lower : 1,
					numeric : 1,
					special : 1
				});
				if(checkPassword != true){
					alert("비밀번호 양식이 올바르지 않습니다.\n8자이상 / 영문.숫자.특수문자 조합");
					return;
				}
				
				if(!regPhone.test(member_phone)){
			   		  alert('잘못된 휴대폰 번호입니다.\n-를 뺴고 입력해 주세요.');
			   		  return;    
			   	}
			 	if($("#agree_check1").is(":checked")==false){
					alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return;
				}
				if($("#agree_check2").is(":checked")==false){
					alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return;
				} 
				document.memberadd.submit();
			});
			
			/* id 중복체크버튼 */
			$("#id_chk_btn").click(function(){
				document.getElementById("id_chk_value").value="1";
				var member_id=$("#member_id").val();
				var userData={"member_id" : member_id};
				if(member_id==""){
					alert("아이디를 입력해 주시기 바랍니다.");
					return;
				}
				var checkID=member_id.match(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*");
				var checkID2=verifyPassword(member_id,{
					length : [8,20],
					alpha : 1,
					numeric : 1
				});
				if(checkID || (!checkID2)){
					alert('아이디 양식이 올바르지 않습니다.\n8자이상 / 영문,숫자 조합');
					return;
				}
				$.ajax({
						type : "POST",
						url : "/companion/login/idchk",
						data : userData,
						dataType : "json",
						success : function(result){
							if(result==0){
								alert("사용이 가능한 아이디입니다.");
							}else if(result==1){
								alert("이미 사용중인 아이디입니다.\n다른 아이디를 사용해 주세요.");
								return;
							}
						}
						
					});
					document.getElementById("id_chk_value").value="2";
			});
			
			/* email 중복체크버튼 */
			$("#email_overlap_chk").click(function(){
				document.getElementById("email_overlap_chk_value").value="1";
				var member_email=$("#member_email").val();
				var userData={"member_email" : member_email};
				if(member_email==""){
					alert("이메일을 입력해 주시기 바랍니다.");
					return;
				}else{
					$.ajax({
						type : "POST",
						url : "/companion/login/emailoverlapchk",
						data : userData,
						dataType : "json",
						success : function(result){
							if(result==0){
								alert("사용이 가능한 이메일입니다.");
							}else if(result==1){
								alert("이미 사용중인 이메일입니다.\n다른 이메일을 사용해 주세요.")
								return;
							}
						}
					
					});
					document.getElementById("email_overlap_chk_value").value="2";
				}
			});
			
			/* email 인증버튼 */
			$("#email_chk_btn").click(function(){
				document.getElementById("email_chk_value").value="1";
				$('#email_chk_panel').show();
				var member_email=$("#member_email").val();
				var userData={"member_email" : member_email};
				var checkEmail=verifyEmail(member_email);
				var email_overlap_chk_value=$("#email_overlap_chk_value").val();
				if(email_overlap_chk_value=="1"){
					alert("이메일 중복확인을 먼저 해주시기 바랍니다.");
					return;
				}else if(checkEmail=="no"){
					alert("이메일 양식이 올바르지 않습니다.");
					return;
				}else{
					$.ajax({
						type : "POST",
						url : "/companion/login/emailchk",
						data : userData,
						dataType : "json",
						success : function(randomMsg){
							if(randomMsg==null){
								alert("전송실패");
								return;
							}else{
								alert("전송완료");
								document.getElementById("email_random_msg").value=randomMsg;
							}
						}
					});
				}
			});
			
			/* email 인증 번호확인버튼 */
			$("#email_chk_btn2").click(function(){
				var email_random_msg=$("#email_random_msg").val();
				var member_email_chk=$("#member_email_chk").val();
				var email_chk_value=$("#email_chk_value").val();
				if(member_email_chk==""){
					alert("인증번호를 입력해 주세요.");
					return;
				}else if(member_email_chk!=email_random_msg){
					alert("인증번호가 일치하지 않습니다.");
					return;
				}else{
					alert("이메일 인증 완료");
					document.getElementById("email_chk_value").value="2";
				}
				
			});
			
		});
	</script>
	
    
</body>
</html>