<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<style>
	.frame{
		border : 1px solid red;
		height: 600px;
		width: 700px;
	}

</style>

<script type="text/javascript">
	$(function(){
		alert("되나?");
		
		var test = $("#test").contents().find('#action_time_price').html();
		alert(test);
	})
	
	
</script>
<div class="frame">
	<iframe id="test" src="Http://localhost:5100" width="100%" height="100%"></iframe>
</div>

<%@include file="../include/footer.jsp"%>