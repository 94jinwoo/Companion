<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<c:if test="${param.prev }">
			<li class="page-item">
				<a class="page-link" aria-label="Previous" href="#" onClick="fn_prev('${pagination_p.page}', '${pagination_p.range}', '${pagination_p.rangeSize}', '${pagination_p.product_id}' )"><span aria-hidden="true">&laquo;</span></a>
			</li>
		</c:if>
		<c:forEach begin="${param.startPage}" end="${param.endPage}" var="idx">
			<li class="page-item <c:out value="${param.page == idx ? 'active': ''}"/>" >
				<a class="page-link" href=javascript:; onClick="fn_pagination('${idx}', '${pagination_p.range}', '${pagination_p.rangeSize}', '${pagination_p.product_id}' )">${idx}</a>
			</li>
		</c:forEach>
			<c:if test="${param.next}">
			<li class="page-item">
				<a class="page-link" aria-label="Next" href="#" onClick="fn_next('${pagination_p.page}', '${pagination_p.range}', '${pagination_p.rangeSize}', '${pagination_p.product_id}' )"><span aria-hidden="true">&raquo;</span></a>
			</li>
		</c:if>
	</ul>
</nav>
<script type="text/javascript">
 	//이전 버튼 이벤트
    function fn_prev(page, range, rangeSize, product_id) {
    		var page = ((range - 2) * rangeSize) + 1 + 4;
    		var range = range - 1;
    		var url = "${getList}";
      		url = url + "?product_id=" + product_id;
      		url = url + "&page=" + page;
    		url = url + "&range=" + range;
    		location.href = url;
    	}
      //페이지 번호 클릭
    	function fn_pagination(page, range, rangeSize, product_id) {
			var url = "${getList}";
      		url = url + "?product_id=" + product_id;
      		url = url + "&page=" + page;
    		url = url + "&range=" + range;
    		location.href = url;	
    	}
    	//다음 버튼 이벤트
    	function fn_next(page, range, rangeSize, product_id) {
    		var page = parseInt((range * rangeSize)) + 1;
    		var range = parseInt(range) + 1;
			var url = "${getList}";
      		url = url + "?product_id=" + product_id;
      		url = url + "&page=" + page;
    		url = url + "&range=" + range;
    		location.href = url;
    	}
</script>