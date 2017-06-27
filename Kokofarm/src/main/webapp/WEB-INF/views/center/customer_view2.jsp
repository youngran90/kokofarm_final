<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>코코팜::고객센터</title>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/detail.css">
<link rel="stylesheet" href="/resources/tenderpay/css/tenderpay.css">
<style>
	#admin_button{
		border: none;
		background: #F28D33;
		text-align: center;
		color: #FFFFFF;
		width: 80px;
		height: 40px;
		position: relative;
		left: 1100px;
		top: -42px;
	}
</style>
<script>
	$(function(){
		$('#faq_list').hide();
		
		var admin_id = '${login.member_id}'
		/* alert(admin_id); */
		
		if(admin_id=='kosta'){
			/* alert("관리자맞아!"); */
			$('#admin_button').show();
		}else{
			$('#admin_button').hide();
		}
		
	})
	
	function move_admin(){
		window.location.href="admin_view";
	}
	
	function move_notice(){
		$('#faq_list').hide();
		$('#notice_table').show();
		
	}
	
	function move_faq(){
		$('#notice_table').hide();
		$('#faq_list').show();
	}
	
	
</script>

<div class="container">
  <ul class="breadcrumb">
    <li style="margin-left: 15px;"><a href="http://localhost:8081"><i class="fa fa-home"></i></a></li>
    <li><a href="/center/customer_view">고객센터</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
   		<div class="column-block">
        <div class="column-block">
          <div class="columnblock-title">고객센터</div>
          <div class="category_block">
            <ul class="box-category treeview-list treeview">
              <li><a href="../center/customer_view" class="activSub">공지사항</a>
              <li><a href="../center/customer_view2" class="activSub">자주묻는질문</a>
                <!-- <ul>
                  <li><a href="#">PC</a></li>
                  <li><a href="#">MAC</a></li>
                </ul> -->
              </li>
              <!-- <li><a href="#" class="activSub"></a>
                <ul>
                  <li><a href="#">Macs</a></li>
                  <li><a href="#">Windows</a></li>
                </ul>
              </li> -->
              <!-- <li><a href="#" class="activSub">Components</a>
                <ul>
                  <li><a href="#">Mice and Trackballs</a></li>
                  <li><a href="#" class="activSub" >Monitors</a>
                    <ul>
                      <li><a href="#"  >test 1</a></li>
                      <li><a href="#"  >test 2</a></li>
                    </ul>
                  </li>
                  <li><a href="#">Windows</a></li>
                </ul>
              </li>
              <li><a href="#">Tablets</a></li>
              <li><a href="#">Software</a></li>
              <li><a href="#">Phones & PDAs</a></li>
              <li><a href="#">Cameras</a></li>
              <li><a href="#">MP3 Players</a></li> -->
            </ul>
          </div>
        </div>
    <!-- <div id="column-left" class="col-sm-3 hidden-xs column-left"> -->
      <!-- <div class="column-block"> -->
        
        <!-- <h3 class="productblock-title" style="display: none;">Bestsellers</h3>
        <div class="row bestseller-grid product-grid" style="display: none;">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/2product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
                <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/3product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
                <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/4product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
                <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div> -->
      <!-- </div> -->
    </div>
    </div>
    </div>
    <div class="col-sm-9" id="content" style="postion:relativce; left:230px;">
    	 <!-- <div class="nav" style="position: relative; left:230px; top:-122px;">
			<ul class="nav nav-tabs">
				<li class="active"><a onclick="move_notice()">공지사항</a></li>
				<li class="active"><a id="faq" href="#" onclick="move_faq()">FAQ</a></li>	
			</ul>
		</div> -->
     	<div class="tab-pane active" id="tab-auctionview" style="position:relative; top:-153px;">
	        <div class="cpt_product_description ">
	        				<h3 style="font-weight: bold; margin-bottom: 20px;">FAQ</h3>
	        				<input type="button" class="active" id="admin_button" value="등록하기" onclick="move_admin()"
	        				style="position:relativce; left:860px;">
								<div style="width: 940px;"> 
								<table class="view_board_table" id="notice_table">
									<colgroup>
									<col width="50">
									<col width="250">
									<col width="150">
									<col width="50">
									</colgroup>
									<thead>
										<tr>
											<th>글번호</th>
											<th>글제목</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="CenterVO" items="${list_faq}" varStatus="status">
										    <c:set var="index" value="1"></c:set>
										    
											<tr  class="tit_tr user_tit_tr">
												<td>${CenterVO.cno}</td>
												<td><a href="/center/detail_faq?cno=${CenterVO.cno}">${CenterVO.c_title}</a></td>
												<td>${CenterVO.c_regdate}</td>
												<td>${CenterVO.c_viewcnt}</td>
											</tr>
										</c:forEach>
								</table>
							</div>
	
	
						</div>
	
						<div>
							<!--  tab1 -->
						</div>
	
					</div>
					
		<div class="tab-pane active" id="tab-auctionview" style="margin-top: 30px;">
	        <div class="cpt_product_description ">
								<div style="width: 1100px; position: relative; left: -100px;">
								<table class="view_board_table" id="faq_list">
									<colgroup>
									<col width="50">
									<col width="250">
									<col width="150">
									</colgroup>
									<thead>
										<tr>
											<th>글번호</th>
											<th>글제목</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="CenterVO" items="${list_faq}" varStatus="status">
										    <c:set var="index" value="1"></c:set>
										    
											<tr class="tit_tr user_tit_tr">
												<td>${CenterVO.cno}</td>
												<td>${CenterVO.c_title}</td>
												<td>${CenterVO.c_regdate}</td>
											</tr>
										</c:forEach>
								</table>
							</div>
	
	
						</div>
	
						<div>
							<!--  tab1 -->
						</div>
	
					</div>			
    </div>
  </div>



<%@include file="../include/footer.jsp" %>