<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/css/detail.css">

<div class="container">
  <ul class="breadcrumb">
    <li><a href="index.html"><i class="fa fa-home"></i></a></li>
    <li><a href="/product/list_product">채소</a></li>
    <li><a href="/product/detail_product?product_no=${product.product_no}">${product.product_name}</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
      <div class="column-block">
        <div class="column-block">
        <div class="columnblock-title">과일(Fruit)</div>
        <div class="category_block">
        <ul class="box-category treeview-list treeview">
            <li><a href="/product/list_product?ca2=fs" class="activSub">과일</a>
              <ul>
                <li><a href="/product/list_product?ca3=fs_1" >딸기</a></li>
                <li><a href="/product/list_product?ca3=fs_2" >한라봉</a></li>
                <li><a href="/product/list_product?ca3=fs_3" >수박</a></li>
                <li><a href="/product/list_product?ca3=fs_4" >참외</a></li>
                <li><a href="/product/list_product?ca3=fs_5" >포도</a></li>
                <li><a href="/product/list_product?ca3=fs_6" >복숭아</a></li>
                <li><a href="/product/list_product?ca3=fs_7" >배</a></li>
                <li><a href="/product/list_product?ca3=fs_8" >사과</a></li>
                <li><a href="/product/list_product?ca3=fs_9" >귤</a></li>
                <li><a href="/product/list_product?ca3=fs_10" >바나나</a></li>
                <li><a href="/product/list_product?ca3=fs_11" >복분자</a></li>
                <li><a href="/product/list_product?ca3=fs_12" >블루베리</a></li>
                <li><a href="/product/list_product?ca3=fs_13" >기타</a></li>
               </ul>
            </li>
          </ul>
          </div>
        
          <div class="columnblock-title">채소(Vegetable)</div>
          <div class="category_block">
          <ul class="box-category treeview-list treeview">
            <li><a href="/product/list_product?ca2=vs" class="activSub">쌈/야채</a>
              <ul>
                <li><a href="/product/list_product?ca3=vs_1" >상추/깻잎</a></li>
                <li><a href="/product/list_product?ca3=vs_2" >치커리/케일</a></li>
                <li><a href="/product/list_product?ca3=vs_3" >쑥갓/청겨자</a></li>
              </ul>
            </li>
            <li><a href="/product/list_product?ca2=vf" class="activSub">열매채소</a>
              <ul>
                <li><a href="/product/list_product?ca3=vf_1" >가지/오이</a></li>
                <li><a href="/product/list_product?ca3=vf_2" >고추/파프리카</a></li>
                <li><a href="/product/list_product?ca3=vf_3" >옥수수/호박</a></li>
              </ul>
            </li>
            <li><a href="/product/list_product?ca2=vr" class="activSub">뿌리채소</a>
              <ul>
	                <li><a href="/product/list_product?ca3=vr_1" >양파/당근</a></li>
	                <li><a href="/product/list_product?ca3=vr_2" >무/파</a></li>
	                <li><a href="/product/list_product?ca3=vr_3" >생각/마늘</a></li>
	                <li><a href="/product/list_product?ca3=vr_4" >고구마/감자</a></li>
                  </ul>
            </li>
          </ul>
        </div>
        </div>
        <!-- <h3 class="productblock-title">Bestsellers</h3> -->
        <div class="row bestseller-grid product-grid" style="display: none">
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
        <!-- <h3 class="productblock-title">Latest</h3> -->
        <div class="row latest-grid product-grid" style="display: none">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock">
              <a href="#">
              <img src="/resources/files/attach/${product.product_mainimage}" alt="" class="img-responsive" style="width: 460; height: auto;"/>
              </a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name">
                <a href="#" title="lorem ippsum dolor dummy">Clothing</a>
                </h4>
                <p class="price product-price">$122.00<span class="price-tax">Ex Tax: $100.00</span></p>
                <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"><a href="#"><img src="image/product/2product50x59.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /></a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name">
                <a href="#" title="lorem ippsum dolor dummy">Clothing</a>
                </h4>
                <p class="price product-price">$122.00<span class="price-tax">Ex Tax: $100.00</span></p>
                <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"><a href="#"><img src="image/product/3product50x59.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /></a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name">
                <a href="#" title="lorem ippsum dolor dummy">Clothing</a>
                </h4>
                <p class="price product-price">$122.00<span class="price-tax">Ex Tax: $100.00</span></p>
                <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"><a href="#"><img src="image/product/2product50x59.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" /></a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn" >Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name">
                <a href="#" title="lorem ippsum dolor dummy">Clothing</a>
                </h4>
                <p class="price product-price">$122.00<span class="price-tax">Ex Tax: $100.00</span></p>
                <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>
        <!-- <h3 class="productblock-title">Specials</h3> -->
        <div class="row special-grid product-grid" style="display: none">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"><img src="image/product/5product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="#" title="lorem ippsum dolor dummy">Clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
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
              <div class="image product-imageblock"> <a href="#"><img src="image/product/6product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="#" title="lorem ippsum dolor dummy">Clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
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
              <div class="image product-imageblock"> <a href="#"><img src="image/product/7product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="#" title="lorem ippsum dolor dummy">Clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
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
              <div class="image product-imageblock"> <a href="#"><img src="image/product/6product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="#" title="lorem ippsum dolor dummy">Clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
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
    <div id="content" class="col-sm-9">
      <div class="row">
        <div class="col-sm-6">
          <div class="thumbnails">
            <div><img src="/resources/files/attach/${product.product_mainimage}" alt="${prouct.product_mainimage}" width="450"/></div>
          </div>
        </div>
        
        <div class="col-sm-6">
          <h1 class="productpage-title">${product.product_name} </h1>
          <div class="rating product"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span> <span class="review-count"> <a href="#" onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">1 reviews</a> / <a href="#" onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">Write a review</a></span>
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" ></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <!-- AddThis Button END -->
          </div>
          <ul class="list-unstyled productinfo-details-top">
            <li>
           
              <h2 class="productpage-price"><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</h2>
            </li>
            <li><span class="productinfo-tax"> <sub>(${product.product_unit}${product.unit}당)</sub></span></li>
          </ul>
          <hr>
          <ul class="list-unstyled product_info">
            <li>
              <label>생산지:</label>
              <span>${product.product_area}</span></li>
            <li>
              <label>생산자:</label>
    			<span>  <a href="#">${product.producer}</a></span></li>
              <%-- <span>  <a href="#">${login.member_name}</a></span></li> --%>
            <li>
            <li>
              <label>규격:</label>
              <span> ${product.product_unit}${product.unit}</span></li>
            <li>
              <label>수확일:</label>
              <span> <fmt:formatDate value="${product.product_harvestdate}"
					pattern="yyyy년MM월dd일" /></span>
			</li>
          </ul>
					<button type="button" onclick="eadown()"; ><img src="/resources/image/minu.bt.png"  width="20px;"></button>
					<input id="ea" name="ea" value="1" readonly="readonly" type="text" size="1"
						style="text-align: center;">
					<button type="button" onclick="eaup()"><img src="/resources/image/plus_bt.png"  width="20px;"></button>
			
          <hr>
          <p class="product-desc">
           	<b>제품설명</b><br>
          ${product.s_contents}
          </p>
          <div id="product">
            <div class="form-group">
              <input type="hidden" name="product_id" value="48" />
              <div class="btn-group">
                <!-- <button type="button" data-toggle="tooltip" class="btn btn-default wishlist" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button> -->
                <button type="button" id="button-cart" data-loading-text="Loading..." class="btn btn-primary btn-lg btn-block addtocart" onclick="gocart('${product.product_no}')">Add to Cart</button>
                <button type="button" id="button-inquiry" data-loading-text="Loading..." class="btn btn-primary btn-lg btn-block addtocart" onclick="inquiry('${product.product_name}','${product.product_no}','${product.seller_no}')">1:1문의글쓰기</button>
               <!--  <button type="button" data-toggle="tooltip" class="btn btn-default compare" title="Compare this Product" ><i class="fa fa-exchange"></i></button> -->
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="productinfo-tab">
      <div class="nav">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-description" data-toggle="tab">상품상세정보</a></li>
          <li><a href="#tab-review" data-toggle="tab">Reviews(${reply_count})</a></li>
        </ul>
        </div>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-description">
            <div class="cpt_product_description ">
              <div>
                ${product.contents}
              </div>
            </div> 
            
            <hr><br>
            <div>
				   <h2>배송정보</h2>
				     <div class="content_box">
						<div class="deli_img">
							<img src="/resources/image/deli_content.png" alt="" style="margin-bottom: 20px">
						</div>
						<div class="deli_inner">
							<div class="deli_inner_L">
								<h5>배송관련 안내</h5>
								<table class="deli_inner_table">
									<caption>배송정보 배송관련 테이블</caption>
									<tbody>
										<tr>
											<th>배송비<br>안내</th>
											<td>
												<p>4만원 이상 주문 시 <span>무료배송</span>
												</p>
												<p>4만원 미만 주문 시 <span>2,500 원</span> 
												</p>
											</td>
										</tr>
										<tr>
											<th>주문마감<br> 및  <br>배송일<br>안내
											</th>
											<td class="pd">
												<div>
													<p class="fir">
														<span>묶음배송</span> (생산자 직거래 상품을 소포장 단위로 묶음 배송)
													</p>
													<p>전국 전 지역</p>
													<p>- 주중(월~금) 자정까지 결제 시 다음날 배송 완료</p>
													<p class="last">- 주말(토,일) 결제 시 월요일 배송 완료</p>
													<p class="last">
														* 금요일의 경우, 자정마감 지역 중 <span style="font-family: YG77">경기와
															인천</span> 은 <br>&nbsp;&nbsp;&nbsp;토요일 도착 주문마감시간이 자정까지이며, <br>&nbsp;&nbsp;&nbsp;그 외 지역의
														주문마감시간은 오후 4시까지 입니다.
													</p>
													<p>일부 제한 지역</p>
													<p>- 주중(월~금) 오후 4시까지 결제 시 다음날 배송 완료</p>
													<p>- 금요일 오후 4시~주말(토,일) 결제 시 화요일 배송 완료</p>
													<p>
														<a href="/shop/board/view.php?id=notice&no=308">※ 제한 지역
															확인하러 가기</a>
													</p>
												</div>
												<div class="last">
													<p class="fir">
														<span>개별배송</span> (생산자 직접 배송)
													</p>
													<p>오전9시 이전 결제 시 당일 수확 후 발송(1일~2일 소요 예정)</p>
													<p>단, 정확한 배송일은 상품 상세 설명의 '발송일'필수 확인 요망</p>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						
							<div class="deli_inner_R">
								<h5>교환/환불 안내</h5>
								<table class="deli_inner_table">
									<caption>배송정보 교환/환불 테이블</caption>
									<tbody>
										<tr>
											<th>신선식품<br>일부<br>이상 시</th>
											<td><span>문제가 생긴만큼 환불</span> 해 드립니다.</td>
										</tr>
										<tr>
											<th>신선식품<br>전체<br>이상 시</th>
											<td><span> <em>100%</em> 환불
											</span> 해 드리거나 <span>재배송</span> 을 해드립니다.</td>
										</tr>
										<tr>
											<th>고객센터<br> 안내</th>
											<td class="pd">
												<div class="run_time">
													<strong class="num"> <img src="/resources/image/main_ico_csc_g.png" alt="">
														1644-4339
													</strong>
													<p>
														<span class="nor">평일</span> - 10:00 ~ 18:00
													</p>
													<p class="cle">점심시간 12:30 ~ 13:30</p>
													<p>
														<span class="nor">토요일</span> - 10:00 ~ 13:00
													</p>
												</div>
												<div class="last">
													<p class="last">
														• 상품 문제가 있다면 신선식품의 특성상 반드시 1~2일 이내 <span class="cle">연락을
															부탁드립니다.</span>
													</p>
													<p class="last">
														• 문제가 있는 상품의 사진을 찍어 주시면 저희가 상품 상태를 <span class="cle"> 쉽게
															확인하여 빠른 처리 도와드립니다.</span>
													</p>
													<p class="word_wrap">• 단순 변심에 의한 교환/ 환불 배송비 안내</p>
													<p class="word_wrap">- 교환 : 왕복배송비(5,000원) 박스 동봉 후 발송</p>
													<p class="word_wrap">- 환불 : 환불 상품 및 쿠폰 적용 금액 제외한 금액 기준으로
														차등적용</p>
													<p class="word_wrap">4만원 이상 : 3,000원</p>
													<p class="last word_wrap">4만원 미만 : 5,000원</p>
													<p class="last">
														• 단, 포장이 훼손되어 상품 가치가 현저히 상실된 경우 <span class="cle">반품지원이
															어려울 수 있습니다. 참고 부탁드립니다.</span>
													</p>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="deli_inner_T">
								<h6>주문상태 별 주문취소 가능 여부 안내</h6>
								<p>* 주문접수/입금확인 : 주문내역에서 사용자가 직접 취소 가능</p>
								<p>* 수확중(배송준비중) : 배송 시작 단계로 취소 불가</p>
								<p>* 자세한 상담은 고객센터(1644-4339),카카오톡(ID:헬로네이처)을 이용해주세요.</p>
							</div>
						</div>
					</div>
            </div>
            
            </div><!-- cpt_container_end -->
            	
         
	
<!-- 댓글 -->

          <div class="tab-pane" id="tab-review">
            <c:if test="${login.member_id ne null}">
            <form class="form-horizontal" id="commentForm">
            <input type="hidden" name="product_no" id="product_no" value="${product.product_no}" ></input>
              <div id="review"></div>
              <h2>댓글(Review)</h2>
              <div class="form-group required">
              <label class="control-label" for="input-review">아이디</label>
                <div class="col-sm-12">${login.member_id}
              <input type="hidden" class="control-label" id="member_id" name="member_id" value="${login.member_id}" readonly="readonly"/>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">댓글내용</label>
                  <textarea rows="5" name="reply_content" id="reply_content" class="form-control"></textarea>
                  <div class="help-block"><span class="text-danger">Note:</span>로그인시 작성가능합니다.</div>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label">평점</label>
                  &nbsp;&nbsp;&nbsp; Bad&nbsp;
                  <input type="radio" name="reply_rating"  id="reply_rating" value="1" />
                  &nbsp;
                  <input type="radio" name="reply_rating"  id="reply_rating"  value="2" />
                  &nbsp;
                  <input type="radio" name="reply_rating" id="reply_rating" value="3"  checked="checked"/>
                  &nbsp;  
                  <input type="radio" name="reply_rating" id="reply_rating" value="4" />
                  &nbsp;
                  <input type="radio" name="reply_rating" id="reply_rating" value="5" />
                  &nbsp;Good</div>
              </div>
            
              <div class="buttons clearfix">
                <div class="pull-right">
                  <button type="button" id="button-review" data-loading-text="Loading..." class="btn btn-primary" onclick="InsertPost('${product.product_no}')">댓글완료</button>
                </div>
              </div>
            </form>
            </c:if>
            
            <c:if test="${login.member_id == null}">
            <form class="form-horizontal" id="commentForm-login">
              <div id="review"></div>
              <h2>댓글(Review)</h2>
              <div class="form-group required">
              <label class="control-label" for="input-review">아이디</label>
                <div class="col-sm-12"><input type="text" disabled="disabled"></div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">댓글내용</label>
                  <textarea rows="5" name="reply_content" id="reply_content" class="form-control" disabled="disabled"></textarea>
                  <div class="help-block"><span class="text-danger">Note:</span>로그인시 작성가능합니다.</div>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label">평점</label>
                  &nbsp;&nbsp;&nbsp; Bad&nbsp;
                  <input type="radio" name="reply_rating"  id="reply_rating" value="1" />
                  &nbsp;
                  <input type="radio" name="reply_rating"  id="reply_rating"  value="2" />
                  &nbsp;
                  <input type="radio" name="reply_rating" id="reply_rating" value="3"  checked="checked"/>
                  &nbsp;  
                  <input type="radio" name="reply_rating" id="reply_rating" value="4" />
                  &nbsp;
                  <input type="radio" name="reply_rating" id="reply_rating" value="5" />
                  &nbsp;Good</div>
              </div>
              
              <div class="buttons clearfix">
                <div class="pull-right">
                  <button type="button" id="button-review" data-loading-text="Loading..." class="btn btn-primary" >댓글완료</button>
                </div>
              </div>
            </form>
              </c:if>
          </div>
          </div>
        </div>
        
        <h3 class="productblock-title">Review</h3>
<label>상품구매 후기</label>
 <div class="board_comment" id="commentListArea">  
	<table class="view_board_table">
				<colgroup>
					<col>
					<col>
					<col width="40%">
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>만족도</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>&nbsp;&nbsp;</th>
					</tr>
				</thead>
				<tbody>	
				<c:if test="${not empty replylist}">
					<c:forEach var="replylist" items="${replylist}" varStatus="status">
					<input type="hidden" value="${replylist.reply_no}" id="re_no" class="re_no">
					<tr class="tit_tr user_tit_tr">
						<td>${status.count}</td>
						<td style="text-align:left; ">
							<div class="grade_box" style="margin-left: 20px;">
							<c:set var="star" value="${replylist.reply_rating}" ></c:set>
							<c:forEach begin="1" end="${star}">
							<span class="full" style="font-size: 20px ">&nbsp;&nbsp;</span>
							</c:forEach>
							</div>
						</td>
						<td class="tit_td" >${replylist.reply_content}</td>
						<c:set var="m_id" value="${replylist.member_id}"></c:set>
						<td>${fn:substring(m_id,0,3)}****</td>
						<td>
							<span class="write_date"><fmt:formatDate value="${replylist.reply_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</td>
				
				<c:set var="member_id" value="${login.member_id}"></c:set>
					<c:if test="${replylist.member_id eq member_id}">
					 	<td colspan="2"><button id="deleteReply" value="${replylist.reply_no}" onclick="deleteReply('${replylist.reply_no}')">삭제</button>
					 	<button id="updateReply" class="updateReply" value="${status.count}" onclick="updateReply('${replylist.reply_no}')">수정</button></td>
					</c:if> 
					</tr>
					<tr>
					</tr>
					</c:forEach>
				</c:if>
					<!-- admin -->
				</tbody>
			</table>
			
			</div>
      </div>
    </div>
  </div>

<script type="text/javascript">

$(function(){
	var doubleSubmitFlag = true;
	$(".updateReply").on("click", function(){
		 if(doubleSubmitFlag){
				var index =$(this).attr("value");
				var reply_content = $(".tit_td").eq(index-1).html();
				var re_no = $(".re_no").eq(index-1).attr("value");
				alert(re_no);
				$(".tit_td").eq(index-1).html('<input type="text" id="reply_contents" value="'+ reply_content+'" size="50"/><button id="update_Re" value="'+re_no+'" onclick="update_Re()">수정완료</button> ');
				doubleSubmitFlag = false;
		    }else{
		        return false;
		    }
	});
	})

	function update_Re() {
		var reply_content = $("#reply_contents").val();
		var reply_no = $("#update_Re").attr("value");
		
		if(reply_content == ""){
			alert("댓글내용을 입력해주세요");
			return false;
		}
		
		$.ajax({
			type : "get",
			url : "/updateReply",
			data : {
				"reply_no" : reply_no,
				"reply_content" : reply_content
			},
			success : function(data) {
				location.reload();
				alert("댓글수정");
				return false;
			},
			error : function(data) {
				console.log('Error:', data);
				alert("오류");
			}
		})
	}

	function InsertPost() {
	     var param = $("#commentForm").serialize();
	     var reply_content = $("#reply_content").val();
	 	
	     if(reply_content == ""){
			alert("댓글내용을 입력해주세요");
			return false;
		}else{
			 $.ajax({
					type : "post",
					url : "/Insert_Post",
					data : param,
				    dataType : "html",
					success : function(data) {
						alert("성공");
						 location.reload();
					},
					error : function(data) {
						console.log('Error:', data);
						alert("오류");
					}
				})
		}
	}
	
	function deleteReply(reply_no) {
		alert(reply_no);
		
		$.ajax({
			type : "get",
			url : "/deleteReply",
			data : {
				"reply_no" : reply_no
			},
			success : function(data) {
				location.reload();
				alert("댓글이 삭제되었습니다.");
				return false;
			},
			error : function(data) {
				console.log('Error:', data);
				alert("오류");
			}
		})
	};

	 function eaup() {
			var price = $('#price').val();
			
			var num = parseInt($("#ea").val());
			var ea = num + 1;
			$("#ea").val(ea);
			$("#aa").text(price * ea + "원");
		}

		function eadown() {
			
			var price = $('#price').val();
			var num = $("#ea").val();
			var ea = parseInt(num);
			
			if (ea <= 1) {
				alert("더이상 수량을 줄일수없습니다.");
				$("#aa").text(price * ea + "원");
				
			} else {
				$("#ea").val(ea - 1);
				$("#aa").text(price * (ea-1) + "원");
			}
		}
		
		function gocart(product_no){
			alert(product_no);
			var num = parseInt($("#ea").val());
			alert(num);
			location.href="/cart/cart_detail?num=" + num + "&product_no="+ product_no;
		}
		
		
		function inquiry(product_name, product_no, seller_no) {
			var member_id = $("#member_id").val();
			if(member_id == null){
				alert("로그인시 작성가능합니다.");
			}else{
				window.open("/mypage/Insert_inquiry?product_name=" + product_name + "&product_no=" + product_no + "&seller_no=" + seller_no, "", "width=600,height=500");
			}
		}

		$("#commentForm-login").click(function(){
			alert("로그인이 하셔야 작성 가능합니다.");
			return false;
		})
 
</script>

  <%@include file="../include/footer.jsp"%>
