<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/" var="root"></c:url> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- DateTables CSS -->
    <link rel="stylesheet" type="text/css" href="${root }DataTables/datatables.min.css"/>
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/admin/main.css">
    <link rel="stylesheet" href="${root }css/admin/home.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    <title>Companion::관리자::대시보드</title>
</head>
<body>
<!-- .wrapper [start] -->
<div class="wrapper">
    <!-- Sidebar -->
   	<jsp:include page="../common/admin_sidebar.jsp"/>
	<!-- #content [start] -->
	<div id="content">
		<!-- nav [start] -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<!-- .container-fluid [start] -->
			<div class="container-fluid">
				<!-- menu toggle button [start] -->
			    <button type="button" id="sidebarCollapse" class="btn btn-jacaranda">
			        <i class="fas fa-align-left"></i>
			        <span>메뉴</span>
			    </button>
			    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
			        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			        aria-expanded="false" aria-label="Toggle navigation">
			        <i class="fas fa-align-justify"></i>
			    </button>
			    <!-- menu toggle button [end] -->
				<!-- top menu bar [start] -->
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			        <ul class="nav navbar-nav ml-auto">
			            <li class="nav-item">
			                <a class="nav-link" href="#">아이템1</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="#">아이템2</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="#">아이템3</a>
			            </li>
			        </ul>
			    </div>
			    <!-- top menu bar [end] -->
			</div>
			<!-- .container-fluid [end] -->
		</nav>
		<!-- nav [end] -->
		<!-- .section [start] -->
		<section class="section">
			<div class="main--title">
				<h1>대시보드</h1>
			</div>
				<ul>
					<li>오늘 매출액 : <fmt:formatNumber value="${todaySum.daily_sum}" pattern="###,###,###원"/></li>
					<li>이번달 매출액 : <fmt:formatNumber value="${monthSum.monthly_sum}" pattern="###,###,###원"/></li>
				</ul>
            <div class="row">
                <div class="card col-xl-5.5">
                    <div class="card-header">
                        <svg class="svg-inline--fa fa-chart-area fa-w-16 mr-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-area" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M500 384c6.6 0 12 5.4 12 12v40c0 6.6-5.4 12-12 12H12c-6.6 0-12-5.4-12-12V76c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v308h436zM372.7 159.5L288 216l-85.3-113.7c-5.1-6.8-15.5-6.3-19.9 1L96 248v104h384l-89.9-187.8c-3.2-6.5-11.4-8.7-17.4-4.7z"></path></svg>
                        <!-- <i class="fas fa-chart-area mr-1"></i> -->
                        "일별 매출"
                    </div>
                    <div class="card-body">
                        <canvas id="myAreaChart" width="500" height="240" style="display: block; width: 500px; height: 240px;" class="chartjs-render-monitor"></canvas>
                    </div>
                </div>
            	<div class="card col-xl-5.5">
					<div class="card-header">
						<svg class="svg-inline--fa fa-chart-bar fa-w-16 mr-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-bar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M332.8 320h38.4c6.4 0 12.8-6.4 12.8-12.8V172.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v134.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V76.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v230.4c0 6.4 6.4 12.8 12.8 12.8zm-288 0h38.4c6.4 0 12.8-6.4 12.8-12.8v-70.4c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v70.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V108.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v198.4c0 6.4 6.4 12.8 12.8 12.8zM496 384H64V80c0-8.84-7.16-16-16-16H16C7.16 64 0 71.16 0 80v336c0 17.67 14.33 32 32 32h464c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg>
						<!-- <i class="fas fa-chart-bar mr-1"></i> -->
						"월별 매출"
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="500" height="240" style="display: block; width: 500px; height: 240px;" class="chartjs-render-monitor"></canvas>
					</div>
				</div>
			</div>
		<div class="card">
            <div class="card-header"><svg class="svg-inline--fa fa-table fa-w-16 mr-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg><!-- <i class="fas fa-table mr-1"></i> -->상품 목록</div>
            <div class="card-body">
                <div class="table-responsive">
                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                        <div class="row">
                            <div style="margin: 0 auto; width: 97%;">
                                <table class="table table-bordered dataTable" id="dataTable"
                                   	role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0"
                                                aria-controls="dataTable" rowspan="1" colspan="1"
                                                aria-sort="ascending"
                                                aria-label="상품이름">상품 이름</th>
                                            <th class="sorting" tabindex="0"
                                            	aria-controls="dataTable" rowspan="1" colspan="1"
                                                aria-label="상품가격">가격</th>
                                            <th class="sorting" tabindex="0"
                                            	aria-controls="dataTable" rowspan="1" colspan="1"
                                                aria-label="상품재고">재고</th>
                                            <th class="sorting" tabindex="0"
                                            	aria-controls="dataTable" rowspan="1" colspan="1"
                                                aria-label="이번 달 판매량">이번 달 판매량</th>
                                            <th class="sorting" tabindex="0"
                                            	aria-controls="dataTable" rowspan="1" colspan="1"
                                                aria-label="총 누적 판매량">총 누적 판매량</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th rowspan="1" colspan="1">상품 이름</th>
                                            <th rowspan="1" colspan="1">가격</th>
                                            <th rowspan="1" colspan="1">재고</th>
                                            <th rowspan="1" colspan="1">이번 달 판매량</th>
                                            <th rowspan="1" colspan="1">총 누적 판매량</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach items="${list }" var="bean">
                                         <tr role="row" class="odd">
                                             <td class="sorting_1">${bean.product_name }</td>
                                             <td><fmt:formatNumber value="${bean.product_price }" pattern="###,###,###"/></td>
                                             <td><fmt:formatNumber value="${bean.product_stock }" pattern="###,###,###"/></td>
                                             <td><fmt:formatNumber value="${bean.month_cumulative_sales }" pattern="###,###,###"/></td>
                                             <td><fmt:formatNumber value="${bean.total_cumulative_sales }" pattern="###,###,###"/></td>
                                         </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
		<!-- .container-fluid [end] -->
		<!-- Footer  -->
		<jsp:include page="../common/footer.jsp"/>
	</div>
	<!-- #content [end] -->
</div>
<!-- .wrapper [end] -->

   	<!-- jQuery -->
    <script type="text/javascript" src="${root }DataTables/jQuery-3.3.1/jquery-3.3.1.js"></script>
    <!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>
    
    <!-- Chart JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <!-- Data Table JS -->
	<script type="text/javascript" src="${root }DataTables/datatables.min.js"></script>
    
    <!-- AreaChart -->
    <script type="text/javascript">
    // Area Chart 일별 매출
    var areaChart = function (){
	    var ctx = document.getElementById("myAreaChart");
	    var chartLabels=["<c:out value='${chartDate.today_6}'/>","<c:out value='${chartDate.today_5}'/>","<c:out value='${chartDate.today_4}'/>","<c:out value='${chartDate.today_3}'/>","<c:out value='${chartDate.today_2}'/>","<c:out value='${chartDate.today_1}'/>","<c:out value='${chartDate.today}'/>"];
	    var chartData=["<c:out value='${today_6Sum.daily_sum}'/>","<c:out value='${today_5Sum.daily_sum}'/>","<c:out value='${today_4Sum.daily_sum}'/>","<c:out value='${today_3Sum.daily_sum}'/>","<c:out value='${today_2Sum.daily_sum}'/>","<c:out value='${today_1Sum.daily_sum}'/>","<c:out value='${todaySum.daily_sum}'/>"];
	    var myLineChart = new Chart(ctx, {
	      type: 'line',
	      data: {
	        labels: chartLabels,
	        datasets: [{
	          label: "Sessions",
	          lineTension: 0.3,
	          backgroundColor: "rgba(2,117,216,0.2)",
	          borderColor: "rgba(2,117,216,1)",
	          pointRadius: 5,
	          pointBackgroundColor: "rgba(2,117,216,1)",
	          pointBorderColor: "rgba(255,255,255,0.8)",
	          pointHoverRadius: 5,
	          pointHoverBackgroundColor: "rgba(2,117,216,1)",
	          pointHitRadius: 50,
	          pointBorderWidth: 2,
	          data: chartData
	        }],
	      },
	      options: {
	        scales: {
	          xAxes: [{
	            time: {
	              unit: 'date'
	            },
	            gridLines: {
	              display: false
	            },
	            ticks: {
	              maxTicksLimit: 7
	            }
	          }],
	          yAxes: [{
	            ticks: {
	              min: 0,
	              max: 70000000,
	              maxTicksLimit: 10,
	              beginAtZero:true,
	              userCallback: function(value, index, values) {
	                  value = value.toString();
	                  value = value.split(/(?=(?:...)*$)/);
	                  value = value.join(',');
	                  return value;
	              }
	            },
	            gridLines: {
	              color: "rgba(0, 0, 0, .125)",
	            }
	          }],
	        },
	        legend: {
	          display: false
	        },
	        tooltips: {
	        	callbacks: {
	        		label : function(tooltipItem,data){
					        	var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					        	value = value.toString();
					        	value = value.split(/(?=(?:...)*$)/);
					        	value = value.join(',');
					        	return value;
	        				}
       			}
    		}
	      }
	    });
    };
    
 // Bar Chart 월별 매출
	var barChart = function() {
	    var ctx = document.getElementById("myBarChart");
	    var chartLabels=["<c:out value='${chartDate.month_6}'/>","<c:out value='${chartDate.month_5}'/>","<c:out value='${chartDate.month_4}'/>","<c:out value='${chartDate.month_3}'/>","<c:out value='${chartDate.month_2}'/>","<c:out value='${chartDate.month_1}'/>","<c:out value='${chartDate.month}'/>"];
	    var chartData=["<c:out value='${month_6Sum.monthly_sum}'/>","<c:out value='${month_5Sum.monthly_sum}'/>","<c:out value='${month_4Sum.monthly_sum}'/>","<c:out value='${month_3Sum.monthly_sum}'/>","<c:out value='${month_2Sum.monthly_sum}'/>","<c:out value='${month_1Sum.monthly_sum}'/>","<c:out value='${monthSum.monthly_sum}'/>"];
	    var myLineChart = new Chart(ctx, {
	      type: 'bar',
	      data: {
	        labels: chartLabels,
	        datasets: [{
	          label: "Revenue",
	          backgroundColor: "rgba(2,117,216,1)",
	          borderColor: "rgba(2,117,216,1)",
	          data: chartData
	        }],
	      },
	      options: {
	        scales: {
	          xAxes: [{
	            time: {
	              unit: 'month'
	            },
	            gridLines: {
	              display: false
	            },
	            ticks: {
	              maxTicksLimit: 7
	              
	            }
	          }],
	          yAxes: [{
	            ticks: {
	              min: 0,
	              max: 100000000,
	              maxTicksLimit: 10,
	              beginAtZero:true,
	              userCallback: function(value, index, values) {
	                  value = value.toString();
	                  value = value.split(/(?=(?:...)*$)/);
	                  value = value.join(',');
	                  return value;
	              }
	            },
	            gridLines: {
	              display: true
	            }
	          }],
	        },
	        legend: {
	          display: false
	        },
	        tooltips: {
	        	callbacks: {
	        		label : function(tooltipItem,data){
					        	var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					        	value = value.toString();
					        	value = value.split(/(?=(?:...)*$)/);
					        	value = value.join(',');
					        	return value;
	        				}
       			}
    		}
	      }
	    });
 	};
 	
 	$(document).ready(function() {
 		  $('#dataTable').DataTable({
 			 "language": {
 				"emptyTable": "데이터가 없습니다.",
 				"lengthMenu": "페이지당 _MENU_ 개씩 보기",
 				"info": "현재 _START_ - _END_ / _TOTAL_건",
 				"infoEmpty": "데이터 없음",
 				"infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
 				"search": "검색: ",
 				"zeroRecords": "일치하는 데이터가 없습니다.",
 				"loadingRecords": "로딩중...",
 				"processing":     "잠시만 기다려 주세요...",
 				"paginate": {
 					"next": "다음",
 					"previous": "이전"
 				}
 			}
		});
	});
    
    areaChart();
    barChart();
    </script>
    
</body>
</html>