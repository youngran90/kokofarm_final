<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@include file="../include/header.jsp"%>
 
 <script type="text/javascript">

  var time=${visitingTime};
   
   function timer(){ 
	   if(time<=0){
		   clearInterval(tid);
		   document.getElementById('tend_time').innerHTML="0일0시간0분0초";
	   } 
	   m= Math.floor(time/(24*60*60))+"일"+Math.floor((time%(24*60*60)/(60*60)))+"시간"+Math.floor(((time%3600)/60))+"분"+time%60+"초";
	   document.getElementById('tend_time').innerHTML=m;
	   time--;
	   
   } 
 
 $(function(){
	 tid=setInterval(timer,1000); 
 
 })
</script>
<div class="container">
  <ul class="breadcrumb">
    <li><a href="index.html"><i class="fa fa-home"></i></a></li>
    <li><a href="category.html">Desktops</a></li>
    <li><a href="#">lorem ippsum dolor dummy</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
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
        <h3 class="productblock-title">Latest</h3>
        <div class="row latest-grid product-grid">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock">
              <a href="#">
              <img src="image/product/1product50x59.jpg" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive" />
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
        <h3 class="productblock-title">Specials</h3>
        <div class="row special-grid product-grid">
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
          <!-- 이미지 부분 -->
            <div><a class="thumbnail" href="image/product/product8.jpg" title="lorem ippsum dolor dummy"><img src="../../resources/image/product/product1.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
            <div id="product-thumbnail" class="owl-carousel">
              <!-- <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product1.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-1-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product2.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-2-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product3.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-3-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product4.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-4-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product5.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-5-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product6.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-6-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div>
              <div class="item">
                <div class="image-additional"><a class="thumbnail  " href="image/product/product7.jpg" title="lorem ippsum dolor dummy"> <img src="image/product/pro-7-220x294.jpg" title="lorem ippsum dolor dummy" alt="lorem ippsum dolor dummy" /></a></div>
              </div> -->
            </div>
          </div>
        </div>
        
        
        <!-- 여기서부터 상품상세 -->
        <form action="tenderform" method="post">
        <div class="col-sm-6">
          <h1 class="productpage-title">${auction.auction_name}</h1>
          <div class="rating product"> 
            <span class="fa fa-stack">
               <i class="fa fa-star fa-stack-1x"></i>
               <i class="fa fa-star-o fa-stack-1x"></i>
            </span> 
            <span class="fa fa-stack">
              <i class="fa fa-star fa-stack-1x"></i>
              <i class="fa fa-star-o fa-stack-1x"></i>
            </span>
            <span class="fa fa-stack">
              <i class="fa fa-star fa-stack-1x"></i>
              <i class="fa fa-star-o fa-stack-1x"></i>
            </span> 
            <span class="fa fa-stack">
              <i class="fa fa-star-o fa-stack-1x"></i>
            </span> 
            <span class="fa fa-stack">
              <i class="fa fa-star-o fa-stack-1x"></i>
            </span> 
            <span class="review-count">
              <a href="#" onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">1 reviews</a> / <a href="#" onClick="$('a[href=\'#tab-review\']').trigger('click'); return false;">Write a review</a>
            </span>
            <hr>
            <!-- AddThis Button BEGIN -->
           <div class="addthis_toolbox addthis_default_style">
              <a class="addthis_button_facebook_like"></a>
              <a class="addthis_button_tweet"></a>
              <a class="addthis_button_pinterest_pinit"></a>
              <a class="addthis_counter addthis_pill_style"></a>
            </div>
            <!-- AddThis Button END -->
          </div>
          <ul class="list-unstyled productinfo-details-top">
            <li>
              <h2 class="productpage-price"></h2>
            </li>
            <li><span class="productinfo-tax"></span></li>
          </ul>
           <!-- <hr> -->
          <ul class="list-unstyled product_info">
            <li>
              <label>경매시작일 : </label>
              <span> ${auction.start_date }</span></li>
            <li>
              <label>경매종료일 :</label>
              <span> ${auction.end_date }</span></li>
            <li>
              <label>상한가 :</label>
              <span> ${auction.auction_up}</span></li>
            <li>
              <label>히한가 :</label>
              <span> ${auction.auction_down}</span></li>
            <li>
              <label>현재가 :</label>
              <span> ${current_price }</span></li>
            <li>
              <label>입찰수 :</label>
              <span> 입찰수 적는 곳 </span></li>
            <li>
              <label><a href="#">경매내역보기</a></label>
              <span> </span></li>
            <li>
              <label>남은시간 :</label>
              <span id="tend_time"></span></li>
    
          </ul>
          <hr>
          <p class="product-desc"></p>
          <div id="product">
            <div class="form-group">
		       <c:choose>
		       <c:when test="${ current_price == auction.auction_up}">
		         <p class="end">경매가 완료되었습니다.<p><br>
		       </c:when>
		       <c:when test="${visitingTime==0 }">
		         <p class="end">경매가 종료되었습니다.</p>
		       </c:when>
		       <c:otherwise>
              <label class="control-label qty-label" for="input-quantity">입찰가격</label>
              <input type="number" name="tender_price" size=20 id="input-quantity" class="form-control productpage-qty" />
              <input type="hidden" name="product_id" value="48" />
              
              <!-- <div class="btn-group"> -->
               <!--  <button type="button" data-toggle="tooltip" class="btn btn-default wishlist" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button> -->
               
               <!-- 입찰버튼 -->
                <input type="submit" id="button-cart" data-loading-text="Loading..." class="btn btn-primary btn-lg btn-block addtocart" value="입찰하기">
               
               </c:otherwise>    
       			</c:choose>
                <!-- <button type="button" data-toggle="tooltip" class="btn btn-default compare" title="Compare this Product" ><i class="fa fa-exchange"></i></button> -->
              </div>
             
            </div>
          </div>
        </div>
       </form>
      </div>
      
      <div class="productinfo-tab">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-description" data-toggle="tab">Description</a></li>
          <li><a href="#tab-review" data-toggle="tab">Reviews (1)</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-description">
            <div class="cpt_product_description ">
              <div>
                <p> <strong>More room to move.</strong></p>
                <p> With 80GB or 160GB of storage and up to 40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.</p>
                <p> <strong>Cover Flow.</strong></p>
                <p> Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.</p>
                <p> <strong>Enhanced interface.</strong></p>
                <p> Experience a whole new way to browse and view your music and video.</p>
                <p> <strong>Sleeker design.</strong></p>
                <p> Beautiful, durable, and sleeker than ever, lorem ippsum dolor dummy now features an anodized aluminum and polished stainless steel enclosure with rounded edges.</p>
              </div>
            </div>
            <!-- cpt_container_end --></div>
          <div class="tab-pane" id="tab-review">
            <form class="form-horizontal">
              <div id="review"></div>
              <h2>Write a review</h2>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-name">Your Name</label>
                  <input type="text" name="name" value="" id="input-name" class="form-control" />
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review">Your Review</label>
                  <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                  <div class="help-block"><span class="text-danger">Note:</span> HTML is not translated!</div>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label">Rating</label>
                  &nbsp;&nbsp;&nbsp; Bad&nbsp;
                  <input type="radio" name="rating" value="1" />
                  &nbsp;
                  <input type="radio" name="rating" value="2" />
                  &nbsp;
                  <input type="radio" name="rating" value="3" />
                  &nbsp;
                  <input type="radio" name="rating" value="4" />
                  &nbsp;
                  <input type="radio" name="rating" value="5" />
                  &nbsp;Good</div>
              </div>
              <div class="buttons clearfix">
                <div class="pull-right">
                  <button type="button" id="button-review" data-loading-text="Loading..." class="btn btn-primary">Continue</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <h3 class="productblock-title">Related Products</h3>
      <div class="box">
        <div id="related-slidertab" class="row owl-carousel product-slider">
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-1-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-2-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-3-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-4-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-5-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-6-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
              </div>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="product-thumb transition">
              <div class="image product-imageblock"> <a href="#"> <img src="image/product/pro-7-220x294.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail">
                <h4 class="product-name"><a href="product.html" title="women's clothing">women's clothing</a></h4>
                <p class="price product-price"> <span class="price-new">$254.00</span> <span class="price-old">$272.00</span> <span class="price-tax">Ex Tax: $210.00</span> </p>
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
</div>

<%@include file="../include/footer.jsp"%>
</body>
</html>