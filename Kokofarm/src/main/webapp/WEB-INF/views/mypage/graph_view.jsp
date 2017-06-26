<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/detail.css">

<link href="/resources/jqplot/jquery.jqplot.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="/resources/jqplot/jquery.jqplot.min.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/jqplot/jquery.js"></script>
<script type="text/javascript"
	src="/resources/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="/resources/jqplot/jquery.jqplot.js"></script>

<script type="text/javascript" src="/resources/jqplot/excanvas.min.js"></script>
<script type="text/javascript"
	src="/resources/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript"
	src="/resources/jqplot/plugins/jqplot.DateAxisRenderer.js"></script>

<script type="text/javascript"
	src="/resources/jqplot/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="/resources/jqplot/plugins/jqplot.barRenderer.js"></script>

<script>
	$(document).ready(
			function() {
				var product1 = '${list.get(0).ORDERFINISH_PRODUCT_Name}';
				var count1 = '${list.get(0).sell_count}' * 10;

				var product2 = '${list.get(1).ORDERFINISH_PRODUCT_Name}';
				var count2 = '${list.get(1).sell_count}' * 10;

				var product3 = '${list.get(2).ORDERFINISH_PRODUCT_Name}';
				var count3 = '${list.get(2).sell_count}' * 10;

				var product4 = '${list.get(3).ORDERFINISH_PRODUCT_Name}';
				var count4 = '${list.get(3).sell_count}' * 10;

				var plot1 = $.jqplot('pie1', [ [ [ product1, count1 ],
						[ product2, count2 ], [ product3, count3 ],
						[ product4, count4 ] ] ], {
					gridPadding : {
						top : 0,
						bottom : 38,
						left : 0,
						right : 0
					},
					seriesDefaults : {
						renderer : $.jqplot.PieRenderer,
						trendline : {
							show : true
						},
						rendererOptions : {
							padding : 5,
							showDataLabels : true
						}
					},
					legend : {
						show : true,
						placement : 'outside',
						rendererOptions : {
							numberRows : 2
						},
						location : 's',
						marginTop : '20px'
					}
				});

				var line1 = [ [ '1월', '${gh.sum1}' ], [ '2월', '${gh.sum2}' ],
						[ '3월', '${gh.sum3}' ], [ '4월', '${gh.sum4}' ],
						[ '5월', '${gh.sum5}' ], [ '6월', '${gh.sum6}' ],
						[ '7월', '${gh.sum7}' ], [ '8월', '${gh.sum8}' ],
						[ '9월', '${gh.sum9}' ], [ '10월', '${gh.sum10}' ],
						[ '11월', '${gh.sum11}' ], [ '12월', '${gh.sum12}' ] ];
				$('#chart2').jqplot([ line1 ], {
					title : '${login.member_name}님의 2017년 월별 구매 합계',
					seriesDefaults : {
						renderer : $.jqplot.BarRenderer,
						rendererOptions : {
							varyBarColor : true
						},
						pointLabels : {
							show : true
						}
					},
					axes : {
						xaxis : {
							renderer : $.jqplot.CategoryAxisRenderer
						},
						yaxis : {
							label : "총 구매합계" //Y 좌표제목
							//,pad :5
							,
							padMax : 7
							//,padMin   : 0
							,
							max : '${max}',
							min : 0,
							numberTicks : 6,
							tickOptions : {
								formatString : "%'d원"
							}
						// 정수형으로 y축 tick 설정
						},
						legend : {
							show : true,
							location : 'e', // compass direction, nw, n, ne, e, se, s, sw, w.
							xoffset : 0, // pixel offset of the legend box from the x (or x2) axis.
							yoffset : 0, // pixel offset of the legend box from the y (or y2) axis.
							placement : 'outsideGrid'
						},
					}

				});
			});
</script>
<div class="container">
<ul class="breadcrumb">
    <li><a href="/"><i class="fa fa-home"></i></a></li>
    <li><a href="/mypage/graph">마이페이지/통계</a></li>
  </ul>
	<div class="row">
		<%@include file="./Mypage.jsp"%>
		<div id="content" class="col-sm-9">


			<div class="cpt_product_description" style="margin-bottom: 5%">
			
				</div>

				<table class="view_board_table" style="width: 800px;">
					<thead>
						<tr>
							<th>가장 많이 팔린 상품 통계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div id="pie1"
									style="width: 800px; height: 400px; margin-bottom: 70px"></div>
							</td>
						</tr>
					</tbody>
				</table>

				<table class="view_board_table" style="width: 800px;">
					<thead>
						<tr>
							<th>월별 총 구매액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div id="chart2" style="width: 800px; height: 400px;"></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<%@include file="../include/footer.jsp"%>
