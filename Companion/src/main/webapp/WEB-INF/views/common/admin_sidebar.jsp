<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
	<!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
            	<a href="${root }admin/admin_home">
	                <h3>Companion Admin</h3>
	                <strong>Comp.<br/>Admin</strong>
            	</a>
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="#shopSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-shopping-cart"></i>
                        쇼핑몰 관리
                    </a>
                    <ul class="collapse list-unstyled" id="shopSubmenu">
                        <li>
                            <a href="${root}admin/product_list">
                            	<i class="fas fa-angle-right"></i>
                            	상품관리
                            </a>
                        </li>
                        <li>
                            <a href="${root }admin/order_list">
                            	<i class="fas fa-angle-right"></i>
                            	주문관리
                            </a>
                        </li>
                    </ul>
                 </li>
                 <li>
                    <a href="#hotelSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
						<i class="fas fa-building"></i>
                       호텔 관리
                    </a>
                    <ul class="collapse list-unstyled" id="hotelSubmenu">
                        <li>
                            <a href="${root }admin/reservation_list">
                            	<i class="fas fa-angle-right"></i>
                            	예약관리
                            </a>
                        </li>
                    </ul>
                 </li>
                 <li>   
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-address-card"></i>
                        회원 관리
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="${root }admin/member_list">
                            	<i class="fas fa-angle-right"></i>
                            	회원목록
                            </a>
							<a href="${root }admin/review_list">
                            	<i class="fas fa-angle-right"></i>
                            	후기
                            </a>
                            <a href="${root }admin/question_list">
                            	<i class="fas fa-angle-right"></i>
                            	Q&A
                            </a>                        
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-clipboard-list"></i>
                        게시판 관리
                    </a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="${root }admin/notice_list">
                            	<i class="fas fa-angle-right"></i>
                            	공지사항
                            </a>
                            <a href="${root }admin/event_list">
                            	<i class="fas fa-angle-right"></i>
                            	이벤트
                            </a>
                            <a href="${root }admin/faq_list">
                            	<i class="fas fa-angle-right"></i>
                            	FAQ
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            
                 <c:choose>
                     <c:when test="${sessionScope.memberVo.member_id==null }">
                         <ul class="list-unstyled conn">
                             <li>
                                 <a href="${root }login" class="nav-link">로그인</a>
                             </li>
                             <li>
                                 <a href="${root }login/memberadd" class="nav-link">회원가입</a>		
                             </li>
                         </ul>
                     </c:when>
                     <c:otherwise>
                         <ul class="list-unstyled conn">
                             <p><strong>${sessionScope.memberVo.member_name }</strong>님이<br/>로그인 중입니다.</p>
                             <li>
                                 <a href="${root }" class="nav-link">홈페이지로</a>
                             </li>
                             <li>
                                 <a href="${root }logout" class="nav-link">로그아웃</a>
                             </li>
                         </ul>
                     </c:otherwise>
                 </c:choose>
        </nav>
