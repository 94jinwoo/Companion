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
    <link rel="stylesheet" href="${root }css/mypage/mycart.css">


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
	                                        <a class="nav-link active" href="${root }mycart">장바구니</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagequestion">문의조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagechk">나의정보</a>
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
	            <!-- .categories start -->
	            <div class="categories">
                <a href="#homeSubmenu">
                	<i class="fas fa-shopping-cart"></i>
              		      장바구니
                </a>
                <hr class="mb-4">
            	</div>
            	<!-- .categories start -->
            	
	            <section class="section">
                <!-- .title-group start-->
                <div class="title-group clearfix">
                    <h1 class="main--title float--left">장바구니</h1>
                    <ul class="route float--right">
                        <li class="active">
                            01 장바구니
                            <span>></span>
                        </li> 
                        <li>
                            02 주문서작성/결제
                            <span>></span>
                        </li> 
                        <li>03 주문완료</li> 
                    </ul>
                </div><!-- .title-group end-->
                <!-- 장바구니 담긴 상품 테이블 -->
                <table class="table table_layout">
                <colgroup>
        		<col class="col1">
        		<col class="col2">
        		<col class="col3">
        		<col class="col4">
        		<col class="col5">
        		<col class="col6">
    			</colgroup>
                    <tr>
                        <th scope="row"><input type="checkbox" name="allCheck" id="allCheck"/></th>
                        <th scope="row">상품 이름</th>
                        <th scope="row">옵션</th>
                        <th scope="row">수량</th>
                        <th scope="row">상품금액</th>
                        <th scope="row">합계금액</th>
                    </tr>
                   <form name="cartOrder" method="post" autocomplete="off" modelAttribute="cartOrderList">
<%int i=0; %>
<c:forEach items="${cartList }" var="bean">
                    <tr>
                        <td><input type="checkbox" name="list[<%=i %>]" class="oneCheck" data-cartNum="${bean.cart_id }" value="${bean.cart_id }" onclick="checkSum()"></td>
						<input type="hidden" id="price${bean.cart_id }" value="${bean.product_price }" >
						<input type="hidden" id="quantity${bean.cart_id }" value="${bean.cart_quantity }" >
                       	<% i+=1; %>
                        <td class="imgTbox">
	                        <div class="imgBox">
	                        	<a href="${root }order/productDetail?idx=${bean.product_id }" style="text-decoration:none">
	                        		<img id="proImg" src="${bean.product_thumb }" alt="Img"/>
	                        	</a>
	                        </div>
	                        <a href="${root }order/productDetail?idx=${bean.product_id }" style="text-decoration:none">
		                        ${bean.product_name }
		                    </a>
                        </td>
	                    <td>${bean.cart_option }<br/>
	                    	<div class="opBox">
	                    	<select style="width:100px; height:34px;" name="selectOption" id="selectOption${bean.cart_id }" class="form-control" onchange="changeOption(${bean.cart_id })">
	                    		<option value="" selected disabled>옵션변경</option>
	                    		<option value="${bean.product_option1 }">${bean.product_option1 }</option>
	                    		<option value="${bean.product_option2 }">${bean.product_option2 }</option>
	                    		<option value="${bean.product_option3 }">${bean.product_option3 }</option>
	                    		<option value="${bean.product_option4 }">${bean.product_option4 }</option>
	                    		<option value="${bean.product_option5 }">${bean.product_option5 }</option>
	                    	</select>
	                    	<input type="hidden" id="originalOption${bean.cart_id }" value="${bean.cart_option }">
	                    	<input type="hidden" id="updateOption${bean.cart_id }" value="">
	                    	<button type="button" class="Cbtn" onclick="updateOption(${bean.cart_id })">변경</button>
	                    	</div>
	                    </td>
                        <td>${bean.cart_quantity }<br/>
                        	<div class="opBox2">
                        	<select style="width:70px;height:34px;" name="selectQuantity" id="selectQuantity${bean.cart_id }" class="form-control" onchange="changeQuantity(${bean.cart_id })">
                        		<option value="" select disabled>수량을 선택</option>
                        		<option value="1">1</option>
                        		<option value="2">2</option>
                        		<option value="3">3</option>
                        		<option value="4">4</option>
                        		<option value="5">5</option>
                        		<option value="6">6</option>
                        		<option value="7">7</option>
                        		<option value="8">8</option>
                        		<option value="9">9</option>
                        		<option value="10">10</option>
                        	</select>
                        	<button type="button" class="Cbtn" onclick="updateQuantity(${bean.cart_id })">변경</button>
                        	</td>
                        	<input type="hidden" id="originalQuantity${bean.cart_id }" value="${bean.cart_quantity }">
                        	<input type="hidden" id="updateQuantity${bean.cart_id }" value="" >
                        	</div>
                        <td>${bean.product_price }원</td>
                        <td>${bean.product_price*bean.cart_quantity }원</td>
</c:forEach>
                   </form>
                    </tr>
                </table>
                <!-- table end -->
                <a href="${root }order/productMain?c=100"><span><< 쇼핑계속하기</span></a>
                <!-- 주문금액 합계 start -->
                <div class="coast clearfix">
                    <ul class="coast-group float--right">
                        <li>총<strong><span id="selectCheckNum"></span></strong>개의 상품금액<br/>
                        	<strong><span id="selectCheckPrice"></span></strong>원
                        </li>
                        <li><i class="fas fa-plus"></i></li>
                        <li>배송비<br/><strong>2,500원</strong></li>
                        <li><i class="fas fa-equals"></i></li>
                        <li>합계<br/><strong><span id="totalPrice"></span></strong>원</li>
                    </ul>
                </div>
                <!-- 주문금액 합계 end-->
                <!-- 버튼그룹 start-->
                <div class="btn--group clearfix">
                    <div class="selectP float--left">
                        <button type="button" id="selectDelete_btn">선택 상품 삭제</button>
                    </div>
                    <div class="orderP float--right">
                        <button id="choiceProduct" class="btn-order">선택 상품 주문</button>
                    </div>
                </div>
                <!-- 버튼그룹 end-->
                <div class="chk-non">
                    <i class="fas fa-exclamation-circle"></i>
                </div>
            </section>      
			<!-- section end -->
		</div>
		<!-- #container end -->
		<!-- Footer  -->
			<jsp:include page="../common/footer.jsp"/>
		<!-- Footer end -->
	</div>
	<!-- #content end -->
</div>
<!-- .wrapper end  -->


<!-- jQuery -->
<script src="${root}js/jquery-1.12.4.js"></script>
<!-- jQuery-UI -->
<script src="${root }js/jquery-ui.js"></script>
<!-- Popper.JS -->
<script src="${root}js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root}js/bootstrap/bootstrap.js"></script>
<!-- MAIN JS -->
<script src="${root }js/main.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		/* 초기화면. 가격 및 개수 표시 */
		$("#selectCheckNum").html(0);
		$("#selectCheckPrice").html(0);
		$("#totalPrice").html(2500);
		
		/* 전체선택 */
		$("#allCheck").click(function(){
			var chk=$("#allCheck").prop("checked");
			if(chk){
				$(".oneCheck").prop("checked",true);
			}else{
				$(".oneCheck").prop("checked",false);
			}
			
			var checkArr=new Array();
			var cart_id="";
			var price="";
			var quantity="";
			$("input[class='oneCheck']:checked").each(function(){
				cart_id=$(this).attr("value");
				price=$("#price"+cart_id).val();
				quantity=$("#quantity"+cart_id).val();
				checkArr.push(parseInt(price)*parseInt(quantity));
			});
			var sum=0;
			var count=checkArr.length;
			for(var i=0; i<count; i++){
				sum+=parseInt(checkArr[i]);
			}
			$("#selectCheckNum").html(count);
			$("#selectCheckPrice").html(sum);
			$("#totalPrice").html(sum+2500);
		});

		/* 개별선택시 전체선택 해제 */
		$(".oneCheck").click(function(){
			$("#allCheck").prop("checked",false);
		});

		/* 선택 상품 삭제 */
		$("#selectDelete_btn").click(function(){
			var confirm_val=confirm("정말 삭제하시겠습니까??");
			
			if(confirm_val){
				var checkArr=new Array();
				$("input[class='oneCheck']:checked").each(function(){
					checkArr.push($(this).attr("data-cartNum"));
				});
				if(checkArr.length==0){
					alert("선택된 상품이 없습니다. 확인 후 다시 실행해 주시기 바랍니다.");
				}
				$.ajax({
					type : "POST",
					url : "/companion/mypage/selectDeleteCart",
					data : {check : checkArr},
					success : function(result){
						if(result==0){
							alert("삭제실패");
						}else{
							alert("삭제완료");
							location.reload();
						}
					}
				});
			}
		});
		
		
		
	});
	
		/* 선택 금액 합계 표시  & 개수 표시*/
		function checkSum(){
			var checkArr=new Array();
			var cart_id="";
			var price="";
			var quantity="";
			$("input[class='oneCheck']:checked").each(function(){
				cart_id=$(this).attr("value");
				price=$("#price"+cart_id).val();
				quantity=$("#quantity"+cart_id).val();
				checkArr.push(parseInt(price)*parseInt(quantity));
			});
			var sum=0;
			var count=checkArr.length;
			for(var i=0; i<count; i++){
				sum+=parseInt(checkArr[i]);
			}
			$("#selectCheckNum").html(count);
			$("#selectCheckPrice").html(sum);
			$("#totalPrice").html(sum+2500);
		}
	
		/* 옵션 선택 */
		function changeOption(cart_id){
			var changeOptionValue=document.getElementById("selectOption"+cart_id);
			
			var selectValue=changeOptionValue.options[changeOptionValue.selectedIndex].text;
			document.getElementById("updateOption"+cart_id).value=selectValue;
		}
		
		/* 변경 옵션 저장 */
		function updateOption(cart_id){
			var updateOptionValue=document.getElementById("updateOption"+cart_id).value;
			var originalOptionValue=document.getElementById("originalOption"+cart_id).value;
			if(updateOptionValue==""){
				alert("선택된 옵션이 없습니다.\n확인 후 다시 시도해 주시기 바랍니다.");
				return;
			}
			if(updateOptionValue==originalOptionValue){
				alert("변경된 사항이 없습니다.\n확인 후 다시 시도해 주시기 바랍니다.");
				return;
			}
			$.ajax({
				type : "POST",
				url : "/companion/mypage/cartChangeOption",
				data : {change_option : updateOptionValue,cart_id : cart_id},
				success : function(result){
					if(result==0){
						alert("변경실패");
						return;
					}else{
						alert("변경성공");
						document.getElementById("originalOption"+cart_id).value=updateOptionValue;
						location.reload();
					}
				}
			});
		}
		
		/* 수량 선택 */
		function changeQuantity(cart_id){
			var updateQuantity=document.getElementById("selectQuantity"+cart_id);
			var selectValue=updateQuantity.options[updateQuantity.selectedIndex].text;
			document.getElementById("updateQuantity"+cart_id).value=selectValue;
		}
		
		/* 변경 수량 저장 */
		function updateQuantity(cart_id){
			var updateQuantityValue=document.getElementById("updateQuantity"+cart_id).value;
			var originalQuantityValue=document.getElementById("originalQuantity"+cart_id).value;
			if(updateQuantityValue==""){
				alert("선택된 수량이 없습니다.\n확인 후 다시 시도해 주시기 바랍니다.");
				return;
			}
			if(updateQuantityValue==originalQuantityValue){
				alert("변경된 사항이 없습니다.\n확인 후 다시 시도해 주시기 바랍니다.");
				return;
			}
			$.ajax({
				type : "POST",
				url : "/companion/mypage/cartChangeQuantity",
				data : {change_quantity : updateQuantityValue,cart_id : cart_id},
				success : function(result){
					if(result==0){
						alert("변경실패");
						return;
					}else{
						alert("변경성공");
						document.getElementById("originalQuantity"+cart_id).value=updateQuantityValue;
						location.reload();
					}
				}
			});d
		}
		
		/* 선택 사항 결제 */
		$("#choiceProduct").click(function(){
			if($("#selectCheckNum").html()==0){
				alert("선택한 상품이 없습니다.\n확인 후 다시 시도해 주시기 바랍니다.");
				return;
			}
			document.cartOrder.submit();
		});
		
		/* 전체 결제 */
		$("#choiceAllProduct").click(function(){
			if($("#selectCheckNum").html()==0){
				alert("선택한 상품이 없습니다.\n확인 후 다시 시도해 주시기 바랍니다.");
				return;
			}
			$(".oneCheck").prop("checked",true);
			document.cartOrder.submit();			
		});
</script>
</body>
</html>






























