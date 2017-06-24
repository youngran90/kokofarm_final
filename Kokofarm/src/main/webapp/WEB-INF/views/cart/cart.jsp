  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp"%>
<% 
	session.getAttribute("login");
%>
<link rel="stylesheet" href="/resources/cart/css/cart.css">
<script src="/resources/cart/js/cart.js"></script>

<div class="container">
  <ul class="breadcrumb">
    <li><a href="/"><i class="fa fa-home"></i></a></li>
	<li><a href="/product/list_product"><i class="fa fa-list_product"></i>물품 리스트</a></li>    
    <li><a href="#">장바구니</a></li>
  </ul>
 	<section id="top_img_box" name="top_img_box">
		<img src="/../../resources/cart/image/ord_top_con_step1.jpg" alt="top_img_box" width="1160px">
	</section>

  <div class="row">
  <!-- 왼쪽 탭 메뉴 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <div id="column-left" class="col-sm-3 hidden-xs column-left" style="display: none;">
      <div class="column-block">
        <div class="column-block">
          <div class="columnblock-title">Categories</div>
          <div class="category_block">
            <ul class="box-category treeview-list treeview">
              <li><a href="#" class="activSub">Desktops</a>
                <ul>
                  <li><a href="#">PC</a></li>
                  <li><a href="#">MAC</a></li>
                </ul>
              </li>
              <li><a href="#" class="activSub">Laptops &amp; Notebooks</a>
                <ul>
                  <li><a href="#">Macs</a></li>
                  <li><a href="#">Windows</a></li>
                </ul>
              </li>
              <li><a href="#" class="activSub">Components</a>
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
              <li><a href="#">MP3 Players</a></li>
            </ul>
          </div>
        </div>
        <div style="display: none;">
        <h3 class="productblock-title">Bestsellers</h3>
        <div class="row bestseller-grid product-grid">
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
        </div>
        </div>
        
      </div>
    </div>
   <!-- 왼쪽 탭 메뉴 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
   
    <div class="col-sm-9" id="content" style="width: 1180px;">
 
      	<section id="crat_total_amount" name="crat_total_amount">
				<div class="cart_amount" name="cart_amount">
					<span id="cart_amount_title">장바구니 상품&nbsp;<em id="cart_amount_count" name="cart_amount_count"></em>&nbsp;건</span>
				</div>	
		</section>
		
		<div id="all_delete">
			<a id="deleteall" href="#"><img id="all_del" alt="all_del" src="/../../resources/cart/image/btn_cart_del.gif" style="vertical-align:middle; margin-right: 8px">선택 상품 삭제</a>
		</div>
	
        <div class="table-responsive">
          <table class="table table-bordered" style="width:1160px">
            <thead>
              <tr>
              	<th class="text-center" width="50"><button id="all" name="all"></button></th>
                <th class="text-center" width="350" colspan="2">상품명</td>
                <th class="text-center">배송비</th>
                <th class="text-right">가격</th>
                <th class="text-center" width="200">수량</th>
                <th class="text-center">주문 금액</th>
              </tr>
            </thead>
            <tbody>
		<form enctype="multipart/form-data" method="post" action="/cart/orderproduct" id="cartForm">
        <c:forEach var="cart_list" items="${listcart }" varStatus="status">
           <td style="display: none;"><em class="${status.count}p_amount" id="p_amount">${cart_list.product_total}</em></td><!-- 재고 -->
		   <td style="display: none;"><input type="checkbox" id="dp" name="order_delivery_price" value="0" class="${status.count }dp"></td> <!-- 배송비 값 submit -->
           <td style="display: none;"><input type="checkbox" id="tp" name="order_total_price" value="0" class="${status.count }tp"></td> <!-- 금액 값 submit -->
		   <td style="display: none;"><input type="checkbox" class="${status.count}opa" id="order_product_amount" name="order_product_amount" value="${cart_list.product_unit }" ></td>
           <td style="display: none;"><input type="checkbox" id="pn" name="order_product_name" value="${cart_list.product_name}" class="${status.count}pn"></td> <!-- 품명 submit -->   
		   <td style="display: none;"><input type="checkbox" id="pp" name="order_product_price" value="${cart_list.product_price}" class="${status.count}pp"></td> <!-- 품명 submit -->
              <tr>
              	<td class="text-center">
              		<input type="checkbox" id="${status.count }ac" name="product_no" value ="${cart_list.product_no }">
              	</td>
                <td class="text-left">
	                <a href="/product/detail_product?product_no=${cart_list.product_no} "><img class="img-thumbnail" title="${cart_list.product_name }" alt="${cart_list.product_name }" src="/resources/files/attach/${cart_list.product_mainimage} "></a>
	             	<a href="/product/detail_product?product_no=${cart_list.product_no} " id="product_name" class="${status.count}name">${cart_list.product_name }</a>
                </td>
                <td>
                	<input type="button" name="delete" onclick="location.href='delete?product_no=${cart_list.product_no }'">
                </td>
                <td class="text-center"><em class="delivery_price" id="${status.count }dp">2500</em><b id="${status.count }dp_unit">원</b>
                </td>
                <td class="text-right"><em class="product_price" id="${status.count }pp">${cart_list.product_price }</em><b>원</b></td>
                <td class="text-center">
                	<div class="pro_cnt_box">
                		<div class="amount_box">
                			<input type="text" class="${status.count}pa" id="product_amount" name="product_amount" value="${cart_list.product_unit }" size="2" min="1" max="0" style="text-align: center;">
                		</div>
                		<div class="cnt_box">
	                		<div cl	ass="cnt_top_box">
	                			<button class="amount_up" type="button" value="${status.count}bu" id="${status.count}bu"></button>
	                		</div>
	                		<div class="cnt_down_box">
	                			<button class="amount_down" type="button" value="${status.count}bd" id="${status.count}bd"></button>
	                		</div>
                		</div>
                	</div>
                	<button class="change" id="${status.count}bc" type="button" value="${status.count }bc" alt="수량변경" ></button>
                	
                	<div class="input-group btn-block"></div>
                </td>
                <td class="text-center"><em class="total_price" id="${status.count }tp">0</em><b>원</b></td>
              </tr>
              </c:forEach>
              </form>
            </tbody>
          </table>
        </div>
      
      <div class="result_info_box">
      	<div class="inbox">
      		<div class="price_info"><em class="result_price"></em><b>원</b></div>
      		<div class="delivery_info"><em class="result_delivery"></em><b>원</b></div>
      		<div class="total_info"><em class="result_total"></em><b>원</b></div>
      	</div>
      </div>
      
      <div class="buttons">
        <div class="pull-right"><a class="btn btn-primary" href="#" id="btn_sub" style="width: 208px; height: 54px; padding: 23px 46px; font-size: 18px;">결제하기</a></div>
      </div>
      
    <section class="info_section">
    	<div class="relevant_title">
      		<h2 class="relevant_prod_tit">품절관련 안내</h2>
	    </div>
	    
	    <div class="relevant_box">
	      			<p>코코팜에서 판매되는 상품들은 친환경 신선제품의 특성 상 산지 및 생산자 사정에 따라서 주문 이후 <b>갑작스런 품절이나 지연배송이 발생할 수 있습니다.</b></p>
	      			<p>주문이후 갑작스런 품절이나 지연배송이 발생할 경우, 추후 따로 해당 부분과 관련해서 연락을 드리니 참고 부탁드립니다.</p>
	    </div>
       	
      	<div calss="delivery_title" >
      		<h4 class="deli_guide_tit">배송관련 안내사항</h4>
      	</div>
      	
      	<div class="delivery_box">
      		<div class="delivery_area">
	      		<div id="delivery_1">
	      			<img src="/../../resources/cart/image/cart_banner2.png">
	      			<h2>개별 배송 안내</h2>
	      				<p>오전 9시 이전 결제완료 시 당일 수확 후 발송</p>
	      				<p>단, 정확한 배송일 은 상품 설명의 발송일 확인</p>
	      		</div>
	      		<div id="delivery_2">
	      			<img src="/../../resources/cart/image/cart_banner3.png">
	      			<h2>배송비 안내</h2>
	      			<p>5만원 이상주문시 무료배송 / 5만원 이하주문시 2,500원</p>
	      			<p style="font-size: 10px">* 전체 주문금액 기준</p>
	      		</div>
      		</div>
      	</div>
    </section>
    </div>
  </div>
</div>
<%@include file="../include/footer.jsp"%>