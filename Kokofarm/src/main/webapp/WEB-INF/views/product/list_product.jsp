<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file= "../include/header.jsp" %>	
<script>
$(function(){

	$(".ca3").on("click", function(){
		var v = $(this).attr("value");
		alert(v);
	})
})


</script>

<div class="container">
  <ul class="breadcrumb">
    <li><a href="/"><i class="fa fa-home"></i></a></li>
    <li><a href="/product/list_product">과일/채소</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
      <div class="column-block">
        <div class="columnblock-title">과일(Fruit)</div>
        <div class="category_block">
        <ul class="box-category treeview-list treeview">
            <li><a href="/product/list_product?ca2=fs" class="activSub">과일</a>
              <ul>
                <li value="fs_1"  class="ca3">딸기</li>
                <li value="fs_2"  class="ca3">한라봉</li>
                <li value="fs_3"  class="ca3">수박</li>
                <li value="fs_4"  class="ca3" >참외</li>
                <li value="fs_5"  class="ca3" >포도</li>
                <li value="fs_6"  class="ca3" >복숭아</li>
                <li value="fs_7"  class="ca3" >배</li>
                <li value="fs_8"  class="ca3" >사과</li>
                <li value="fs_9"  class="ca3" >귤</li>
                <li value="fs_10"  class="ca3">바나나</li>
                <li value="fs_11" class="ca3">복분자</li>
                <li value="fs_12" class="ca3">블루베리</li>
                <li value="fs_13"  class="ca3">기타</li>
               </ul>
            </li>
          </ul>
          </div>
        
        
        <div class="columnblock-title">채소(Vegetable)</div>
        <div class="category_block">
        <ul class="box-category treeview-list treeview">
            <li><a href="/product/list_product?ca2=vs" class="activSub">쌈/야채</a>
              <ul>
                <li><a href="/product/list_product?ca2=vs_1" >상추/깻잎</a></li>
                <li ><a href="/product/list_product?ca2=vs_2" >치커리/케일</a></li>
                <li value="vs_3" >쑥갓/청겨자</a></li>
              </ul>
            </li>
            <li><a href="/product/list_product?ca2=vf" class="activSub">열매채소</a>
              <ul>
                <li value="vf_1" >가지/오이</a></li>
                <li value="vf_2" >고추/파프리카</a></li>
                <li value="vf_3" >옥수수/호박</a></li>
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
      
      <div class="banner" >
        <div class="item"> <a href="#"><img src="/resources/files/attach/banner.jpg" alt="Left Banner" class="img-responsive" /></a> </div>
      </div>
      
    </div>
    <div id="content" class="col-sm-9">
      <h2 class="category-title">과일/채소</h2>
      <div class="row category-banner">
        <!-- <div class="col-sm-12 category-image"><img src="/resources/files/attach/product_banner.jpg" alt="product_banner" title="product_banner" class="img-thumbnail" style="width: 937px; height: 192px;" /></div>
         -->
        <div class="col-sm-12 category-desc">상품설명</div>
      </div>
      <div class="category-page-wrapper">
        <div class="col-md-6 list-grid-wrapper">
          <div class="btn-group btn-list-grid">
            <button type="button" id="list-view" class="btn btn-default list" data-toggle="tooltip" title="List"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default grid" data-toggle="tooltip" title="Grid"><i class="fa fa-th"></i></button>
          </div>
          <span id="compare-total">상품목록(${count_product})</span> </div>
        
        <div class="col-md-2 text-right sort-wrapper">
          <label class="control-label" for="input-sort">Sort By :</label>
          <div class="sort-inner">
	      	<select  id="input_sort" name="input_sort" onchange="doInput_sort(this.value)">
				<option value="" selected="selected">-----</option>
				<option value="ph">가격 높은순</option>
	            <option value="pl">가격 낮은순</option>
	        	<option value="vc">판매인기순</option>
			</select>
			
			<select  id="searchType" name="searchType" style="width: 75px; height:27px; margin-left: 15px;">
				<option value="product_name" selected="selected">이름</option>
				<option value="seller">판매자</option>
			</select>
			
			<input type="text" name="keyword" id="keyword">
			<input type="button" value="검색" onclick="doSearch()">
			
          </div>
        </div>
      </div>
      <br />
      
      
     <div class="grid-list-wrapper">
     <c:forEach var="product" items="${list}">
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image product-imageblock"> <a href="/product/detail_product?product_no=${product.product_no}"> <img src='/resources/files/attach/${product.product_mainimage}' alt="women's clothing stores" title="lorem ippsum dolor dummy" class="img-responsive"  style="width: 220px; height: 165px;"/></a>
             <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" style="display: none"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" style="width: 200px" onclick="pay('${product.product_no}');"><b>장바구니 담기</b></button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" style="display: none"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
            <div class="caption product-detail">
              <h4 class="product-name"> 
              <a href="product.html" title="lorem ippsum dolor dummy" style="font-size: 18px"><b>${product.product_name}</b></a>
              </h4>
               <p class="product-desc"> ${product.s_contents} </p>
              <p class="price product-price" ><sub>${product.reply_count}reviews&nbsp;(${product.product_unit}${product.unit}당)</sub><span style="margin-left: 50px;"><font color="#38a9a5"><fmt:formatNumber value="${product.product_price}" pattern="#,###" />원</font></span></p>
              <p>
            </div>
              <div class="button-group" style="margin-top: 50px">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List" style="display: none"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn" style="width: 200px" onclick="pay('${product.product_no}');"><b>장바구니 담기</b></button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product" style="display: none"><i class="fa fa-exchange"></i></button>
              </div>
          </div>
            </div>
              </c:forEach>
            </div>
    
      <div class="category-page-wrapper">
        <div class="pagination-in" style="margin-left: 30%">
         <ul class="pagination" >
			<li><a href="/product/list_product${pageMaker.makeQuery(1) }">처음</a></li>
			<c:if test="${pageMaker.prev}">
				<li><a href="/product/list_product${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
				 <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					 <a href="/product/list_product?page=${idx }">${idx}</a>
				</li>
			</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="/product/list_product${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>
				<li><a href="/product/list_product${pageMaker.makeQuery(pageMaker.lastPage)}">마지막</a></li>
			</ul>
        </div>
      </div>
    </div>
  </div>
    <div>
  </div>
</div>
  <form id="ProductForm" name="ProductForm" action="list_product" method="get">
  <input type='hidden' name="page" value="${ProductForm.page }">
  <input type='hidden' name="perPageNum" value="${ProductForm.perPageNum}">
</form>


<script>
	function pay(product_no){
		alert(product_no);
		location.href="/cart/cart_detail?num=1&product_no="+ product_no;
	}

	function doInput_sort(input_sort){
		location.href="/product/list_product?input_sort="+ input_sort;
	}
	
	function doSearch(){
		
		var searchOption = $("#searchType").val();
		var searchText = $("#keyword").val();
		location.href="/product/list_product?searchOption="+ searchOption+"&searchText="+searchText;
	}
   
	function ca(v){
		alert(v);
	}
	
	
</script>


<%@include file="../include/footer.jsp"%>


  


 