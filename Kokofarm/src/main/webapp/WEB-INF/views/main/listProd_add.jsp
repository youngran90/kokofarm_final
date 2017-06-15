<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file= "../include/header.jsp" %>	

<script>
	$(function(){	
		 	$('.addtomain-btn').on("click",function(){
			
			var x =$(this).parent().parent().attr("class");
			alert(x);
		}) ;
	});
</script>

<div class="container">
  <ul class="breadcrumb">
    <li><a href="/"><i class="fa fa-home"></i></a></li>
    <li><a href="/main/listProd_add">과일/채소</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
      <div class="column-block">
        <div class="columnblock-title">과일(Fruit)</div>
        <div class="category_block">
        <ul class="box-category treeview-list treeview">
            <li><a href="/main/listProd_add?ca2=fs" class="activSub">과일</a>
              <ul>
                <li><a href="/main/listProd_add?ca3=fs_1" >딸기</a></li>
                <li><a href="/main/listProd_add?ca3=fs_2" >한라봉</a></li>
                <li><a href="/main/listProd_add?ca3=fs_3" >수박</a></li>
                <li><a href="/main/listProd_add?ca3=fs_4" >참외</a></li>
                <li><a href="/main/listProd_add?ca3=fs_5" >포도</a></li>
                <li><a href="/main/listProd_add?ca3=fs_6" >복숭아</a></li>
                <li><a href="/main/listProd_add?ca3=fs_7" >배</a></li>
                <li><a href="/main/listProd_add?ca3=fs_8" >사과</a></li>
                <li><a href="/main/listProd_add?ca3=fs_9" >귤</a></li>
                <li><a href="/main/listProd_add?ca3=fs_10" >바나나</a></li>
                <li><a href="/main/listProd_add?ca3=fs_11" >복분자</a></li>
                <li><a href="/main/listProd_add?ca3=fs_12" >블루베리</a></li>
                <li><a href="/main/listProd_add?ca3=fs_13" >기타</a></li>
               </ul>
            </li>
          </ul>
          </div>
        
        
        <div class="columnblock-title">채소(Vegetable)</div>
        <div class="category_block">
        <ul class="box-category treeview-list treeview">
            <li><a href="/main/listProd_add?ca2=vs" class="activSub">쌈/야채</a>
              <ul>
                <li><a href="/main/listProd_add?ca3=vs_1" >상추/깻잎</a></li>
                <li><a href="/main/listProd_add?ca3=vs_2" >치커리/케일</a></li>
                <li><a href="/main/listProd_add?ca3=vs_3" >쑥갓/청겨자</a></li>
              </ul>
            </li>
            <li><a href="/main/listProd_add?ca2=vf" class="activSub">열매채소</a>
              <ul>
                <li><a href="/main/listProd_add?ca3=vf_1" >가지/오이</a></li>
                <li><a href="/main/listProd_add?ca3=vf_2" >고추/파프리카</a></li>
                <li><a href="/main/listProd_add?ca3=vf_3" >옥수수/호박</a></li>
              </ul>
            </li>
            <li><a href="/main/listProd_add?ca2=vr" class="activSub">뿌리채소</a>
              <ul>
	                <li><a href="/main/listProd_add?ca3=vr_1" >양파/당근</a></li>
	                <li><a href="/main/listProd_add?ca3=vr_2" >무/파</a></li>
	                <li><a href="/main/listProd_add?ca3=vr_3" >생각/마늘</a></li>
	                <li><a href="/main/listProd_add?ca3=vr_4" >고구마/감자</a></li>
                  </ul>
            </li>
          </ul>
        
        
        
        </div>
      </div>
      <div class="panel panel-default filter">
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
      <div class="banner" >
        <div class="item"> <a href="#"><img src="/resources/image/banners/LeftBanner.jpg" alt="Left Banner" class="img-responsive" /></a> </div>
      </div>
     <!--  <h3 class="productblock-title">Specials</h3> -->
      <div class="row special-grid product-grid" style="display: none">
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
          <div class="product-thumb transition">
            <div class="image product-imageblock"> <a href="#"><img src="" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <button type="button" class="addtocart-btn" >Add to Cart</button>
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
            <div class="image product-imageblock"> <a href="#"><img src="" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
              <div class="button-group">
                <!-- <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" ><i class="fa fa-heart-o"></i></button> -->
                <button type="button" class="addtocart-btn" >Add to Cart</button>
               <!--  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" ><i class="fa fa-exchange"></i></button> -->
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
            <div class="image product-imageblock"> <a href="#"><img src="" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
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
            <div class="image product-imageblock"> <a href="#"><img src="" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
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
            <div class="image product-imageblock"> <a href="#"><img src="" alt="women's clothing" title="women's clothing" class="img-responsive" /></a>
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
    <div id="content" class="col-sm-9">
      <h2 class="category-title">과일/채소</h2>
      <div class="row category-banner">
        <div class="col-sm-12 category-image"><img src="" alt="product_banner" title="product_banner" class="img-thumbnail" style="width: 937px; height: 192px;" /></div>
        <div class="col-sm-12 category-desc">상품설명</div>
      </div>
      <div class='box'>
				
				<div class="box-header with-border">
					<h3 class="box-title">물품 리스트</h3>
				</div>


				<div class='search-box'>

					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
								
						
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>
					

				</div>
			</div>
           
    
      
      <div class="category-page-wrapper">
        <div class="col-md-6 list-grid-wrapper">
          <div class="btn-group btn-list-grid">
            <button type="button" id="list-view" class="btn btn-default list" data-toggle="tooltip" title="List"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default grid" data-toggle="tooltip" title="Grid"><i class="fa fa-th"></i></button>
          </div>
          <a href="#" id="compare-total">상품목록(0)</a> </div>
        
        <div class="col-md-2 text-right sort-wrapper">
          <label class="control-label" for="input-sort">Sort By :</label>
          <div class="sort-inner">
            <select id="input-sort" class="form-control">
              <option value="ASC" selected="selected">Default</option>
              <option value="ASC">Name (A - Z)</option>
              <option value="DESC">Name (Z - A)</option>
              <option value="ASC">Price (Low &gt; High)</option>
              <option value="DESC">Price (High &gt; Low)</option>
              <option value="DESC">Rating (Highest)</option>
              <option value="ASC">Rating (Lowest)</option>
              <option value="ASC">Model (A - Z)</option>
              <option value="DESC">Model (Z - A)</option>
            </select>
          </div>
        </div>
      </div>
      <br />
      
      
     <div class="grid-list-wrapper">
     <c:forEach var="product" items="${list}" varStatus="status">
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image product-imageblock"> 
       	     <a href="/product/detail_product?product_no=${product.product_no}"> 
        	   	 	<img src='/resources/files/attach/${product.product_mainimage}' alt="women's clothing stores" title="lorem ippsum dolor dummy" class="img-responsive" width="220" height="294"/>
          	  </a>
              <div class="button-group">
                <!-- <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button> -->
                <button type="button" class="addtomain-btn" value="${status.count}">메인화면 등록</button>
               <!--  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button> -->
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> <a href="product.html" title="lorem ippsum dolor dummy" style="font-size: 18px"><b>${product.product_name}</b></a> </h4>
               <p class="product-desc"> ${product.s_contents} </p>
              <p class="price product-price"><sub>(${product.product_unit}${product.unit}당)</sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</p>
              <p>
              <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> </div>
            </div>
            <div class="button-group">
              <button type="button" class="addtocart-btn">Add to Cart</button>
            </div>
          </div>
            </div>
              </c:forEach>
            </div>
            
            <div class='box' style="clear: both;position: relative;left: 40%">
				
				<div class="box-header with-border">
					<h3 class="box-title">물품 리스트</h3>
				</div>


				<div class='search-box'>

					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
								
						
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>
					

				</div>
			</div>
            
            
    
      <div class="category-page-wrapper">
        <div class="result-inner"></div>
        <div class="pagination-inner">
         <!--  <ul class="pagination">
            <li class="active"><span>1</span></li>
            <li><a href="category.html">2</a></li>
            <li><a href="category.html">&gt;</a></li>
            <li><a href="category.html">&gt;</a></li>
          </ul> -->
          <ul class="pagination">
							<li><a href="1">처음</a></li>
							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${pageMaker.makeQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>
							<li><a href="${pageMaker.lastPage}">끝</a></li>
						</ul>
        </div>
      </div>
    </div>
  </div>
</div>

<form id="jobForm">
  <input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
  <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>


<script>
	
	$(".pagination li a").on("click", function(event){
		event.preventDefault(); 
		alert("in")
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","/main/listProd_add").attr("method", "get");
		jobForm.submit();
	});
	
	
	
   
</script>


  


 