<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>jQplot</title>

<link href="/resources/jqplot/jquery.jqplot.css" rel="stylesheet"	type="text/css" />
<link rel="stylesheet" type="text/css"	href="/resources/jqplot/jquery.jqplot.min.css">
<script type="text/javascript"	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/jqplot/jquery.js"></script>
<script type="text/javascript"	src="/resources/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="/resources/jqplot/jquery.jqplot.js"></script>

<script type="text/javascript" src="/resources/jqplot/excanvas.min.js"></script>
<script type="text/javascript"	src="/resources/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript"	src="/resources/jqplot/plugins/jqplot.DateAxisRenderer.js"></script>

<script type="text/javascript"	src="/resources/jqplot/plugins/jqplot.pieRenderer.js"></script>

</head>
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

				var product5 = '${list.get(4).ORDERFINISH_PRODUCT_Name}';
				var count5 = '${list.get(4).sell_count}' * 10;

				var plot1 = $.jqplot('pie1', [ [ [ product1, count1 ],
						[ product2, count2 ], [ product3, count3 ],
						[ product4, count4 ], [ product5, count5 ] ] ], {
					gridPadding : {
						top : 0,
						bottom : 38,
						left : 0,
						right : 0
					},
					seriesDefaults : {
						renderer : $.jqplot.PieRenderer,
						trendline : {
							show : false
						},
						rendererOptions : {
							padding : 8,
							showDataLabels : true
						}
					},
					legend : {
						show : true,
						placement : 'outside',
						rendererOptions : {
							numberRows : 1
						},
						location : 's',
						marginTop : '15px'
					}
				});
			});
</script>
</head>
<body>
	<section class="sub_top_section">
	<h2 class="cate_title">
		<span>1:1문의&nbsp;&nbsp;</span>
	</h2>
	</section>
	<table class="view_board_table">
		
		</table>
		<div id="pie1" style="width: 700px; height: 500px;"></div>
</body>
</html>


