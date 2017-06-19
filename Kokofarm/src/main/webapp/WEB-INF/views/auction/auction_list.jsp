<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코팜::경매상품</title>

<%@include file="../include/header.jsp"%>
<style>
	.product-name .auction_name:hover{
		color: #F26B18;
	}
	#list_img{
		/* border: 1px solid red; */
		width: 650px;
		height: 150px;
	}
	#register_button{
		border: none;
		font-weight: bold;
		background: #F26B18;
		color: #FFFFFF;
		width: 100px;
		height: 30px;
		position: relative;
		left: 840px;
		top: -27px;
	}
	#register_button:hover{
		border: solid 1px #F26B18;
		background: #FFFFFF;
		color: #F26B18;
		font-weight: bold;
	}
</style>
<script>

	window.onload = function(){
		var seller_no= '${login.seller_no}'
		
		if(seller_no==''){
			$('#register_button').hide();
		}else{
			$('#register_button').show();
		}
	}
	
	function move_register(){
		window.location.href="auction_register";
	}

	function searchingAuction(){
				
					self.location = "auction_list"
					+ '${auctionPage.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
				
			};
</script>
<!-- <div class="preloader loader" style="display: block; background:#f2f2f2;"> <img src="image/loader.gif"  alt="#"/></div> -->
<div class="container">
  <ul class="breadcrumb">
    <li><a href="http://localhost:8081/"><i class="fa fa-home"></i></a></li>
    <li><a href="/auction/auction_list">일반 경매</a></li>
    <li><a href="#">경매 상품</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
    <!-- LNB 시작 -->
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
      <!-- LNB 끝 -->
      
      <!-- LNB (Search) 시작 -->
      <div class="panel panel-default filter" style="display: none;">
        <div class="panel-heading columnblock-title">Refine Search</div>
        <div class="filter-block">
          <div class="list-group"> <a class="list-group-item">Color</a>
            <div class="list-group-item">
              <div id="filter-group1">
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="1" />
                  Black (7)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="2" />
                  Blue (6)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="3" />
                  Red (6)</label>
              </div>
            </div>
            <a class="list-group-item">Price</a>
            <div class="list-group-item">
              <div id="filter-group2">
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="4" />
                  $100-$300 (6)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="5" />
                  $301-$1000 (6)</label>
              </div>
            </div>
            <a class="list-group-item">Size</a>
            <div class="list-group-item">
              <div id="filter-group3">
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="6" />
                  Big (3)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="7" />
                  Medium (3)</label>
                <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="8" />
                  Small (1)</label>
              </div>
            </div>
          </div>
          <div class="panel-footer text-right">
            <button type="button" id="button-filter" class="btn btn-primary">Refine Search</button>
          </div>
        </div>
      </div>
      <!-- LNB (Search) 끝 -->
      <!-- Special 시작 -->
      <div class="banner" style="display: none;">
        <div class="item"> <a href="#"><img src="image/banners/LeftBanner.jpg" alt="Left Banner" class="img-responsive" /></a> </div>
      </div>
      <h3 class="productblock-title" style="display: none;">Specials</h3>
      <div class="row special-grid product-grid" style="display: none;">
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/5product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/1product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div><div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/2product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div><div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/5product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="image/product/4product50x59.jpg" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" >Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="women's clothing">Clothing</a> </h4>
              <p class="price product-price"> <span class="price-new">$254.00</span><span class="price-tax">Ex Tax: $210.00</span> </p>
            </div>
            <div class="button-group">
              <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button>
              <button type="button" class="addtocart-btn" >Add to Cart</button>
              <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Special 끝 -->
    <!-- 리스트 시작 -->
    <div id="content" class="col-sm-9">
      <h2 class="category-title" style="font-weight: bold; position: relative; top: 1px;">일반 경매</h2>
      <button id="register_button" onclick="move_register()">상품 등록</button>
      <!-- <div class="row category-banner">
        <div class="col-sm-12 category-image"><img src="image/banners/category-banner.jpg" alt="Desktops" title="Desktops" class="img-thumbnail" /></div>
        <div class="col-sm-12 category-desc">Lorem ipsum dolomagna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.</div>
      </div> -->
      <div class="category-page-wrapper" style="border-bottom: none;">
        <div class="col-md-6 list-grid-wrapper">
          <div class="btn-group btn-list-grid">
            <button type="button" id="grid-view" class="btn btn-default grid" data-toggle="tooltip" title="Grid"><i class="fa fa-th"></i></button>
          </div>
          <!-- <a href="#" id="compare-total"></a> </div> -->
        <div class="col-md-1 text-right page-wrapper">
          <!-- <label class="control-label" for="input-limit">Show :</label>
          <div class="limit">
            <select id="input-limit" class="form-control">
              <option value="8" selected="selected">8</option>
              <option value="25">25</option>
              <option value="50">50</option>
              <option value="75">75</option>
              <option value="100">100</option>
            </select>
          </div>
        </div> -->
        <div>
        <select name="searchType" style="display: none;">
         	<option value="t" selected
         		<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
         		auction_name</option>
         </select>
         <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" style="border: 1px solid #EDEDED;">
		 <button id="search" onclick="searchingAuction()">검색</button>
        </div>
        <div class="col-md-2 text-right sort-wrapper">
          <label class="control-label" for="input-sort"></label>
          <div class="sort-inner">
            <select id="auction-sort" class="form-control" style="font-size: 13px; text-align: center; width: 226px;
            position: relative; left: 10px;">
	          <option id="fruits">과일</option>
	          <option id="vegetable">채소</option>
              <option id="new_reg">신규등록순</option>
              <option id="end_impend">마감임박순</option>
            </select>
          </div>
        </div>
      </div>
      <br><br><br>
      <script type="text/javascript">
      	
      </script>
      
     <div class="grid-list-wrapper" style="width: 960px;">
     <c:forEach items="${list}" var="AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12">
     		<div class="product-thumb">
     			<div class="image product-imageblock"><a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}"><img src='/resources/files/attach/${AuctionRegisterVO.auction_title_img}' class="img-responsive" id="list_img"></a></div>
     			<h4 class="product-name"> <a href="/tender/tenderform?auction_no=${AuctionRegisterVO.auction_no}"><span class="auction_name">${AuctionRegisterVO.auction_name}</span></a></h4>
     			<p class="price product-price" style="margin-right:10px;">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">상한가</span>${AuctionRegisterVO.auction_up}
     			</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${AuctionRegisterVO.auction_down}
     			</p>
     			
     		</div>
     	</div>
     	
     	</c:forEach>
      
       </div>
      <!-- 페이징 처리 -->
      <div class="category-page-wrapper" style="border-bottom: none;">
        <!-- <div class="result-inner"></div> -->
        <div class="pagination-inner">
          <ul class="pagination">
          <c:if test="${auctionPage.prev}">
          	<li><a href="auction_list${auctionPage.makeSearch(auctionPage.startPage - 1)}">&lt;</a></li> 
          </c:if>
          <c:forEach begin="${auctionPage.startPage}" end="${auctionPage.endPage}" var="idx">
          	<li <c:out value="${auctionPage.cri.page == idx?'class=active':''}"/>><a href="auction_list?page=${idx}">${idx}</a></li>
          </c:forEach>
          <c:if test="${auctionPage.next && auctionPage.endPage > 0}">
          	<li><a href="auction_list?page=${auctionPage.endPage + 1}">&gt;</a></li>
          </c:if>
            <!-- <li><a href="category.html">&gt;|</a></li> -->
          </ul>
        </div>
      </div>
      <!-- 페이징 처리 끝 -->
    </div>
  </div>
</div>
</div>

</div>

<%@include file="../include/footer.jsp"%>
</body>
