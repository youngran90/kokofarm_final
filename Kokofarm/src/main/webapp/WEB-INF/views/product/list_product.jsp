<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file= "../include/header.jsp" %>	

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
            <li><a href="#" onclick="selectCategoryTwo('fs')" class="activSub">과일</a>
              <ul>
                <li value="fs_1"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_1')">딸기</a></li>
                <li value="fs_2"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_2')">한라봉</a></li>
                <li value="fs_3"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_3')">수박</a></li>
                <li value="fs_4"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_4')">참외</a></li>
                <li value="fs_5"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_5')">포도</a></li>
                <li value="fs_6"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_6')">복숭아</a></li>
                <li value="fs_7"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_7')">배</a></li>
                <li value="fs_8"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_8')">사과</a></li>
                <li value="fs_9"  class="ca3" ><a href="#" onclick="selectCategoryThree('fs_9')">귤</a></li>
                <li value="fs_10"  class="ca3"><a href="#" onclick="selectCategoryThree('fs_10')">바나나</a></li>
                <li value="fs_11" class="ca3"><a href="#" onclick="selectCategoryThree('fs_11')">복분자</a></li>
                <li value="fs_12" class="ca3"><a href="#" onclick="selectCategoryThree('fs_12')">블루베리</a></li>
                <li value="fs_13"  class="ca3"><a href="#" onclick="selectCategoryThree('fs_13')">기타</a></li>
               </ul>
            </li>
          </ul>
          </div>
        
        
        <div class="columnblock-title">채소(Vegetable)</div>
        <div class="category_block">
        <ul class="box-category treeview-list treeview">
            <li><a href="#" onclick="selectCategoryTwo('vs')" class="activSub">쌈/야채</a>
              <ul>
                <li><a href="#" onclick="selectCategoryThree('vs_1')">상추/깻잎</a></li>
                <li ><a href="#" onclick="selectCategoryThree('vs_2')">치커리/케일</a></li>
                <li ><a href="#" onclick="selectCategoryThree('vs_3')">쑥갓/청겨자</a></li>
              </ul>
            </li>
            <li><a href="#" onclick="selectCategoryTwo('vf')" class="activSub">열매채소</a>
              <ul>
                <li value="vf_1" ><a href="#" onclick="selectCategoryThree('vf_1')">가지/오이</a></li>
                <li value="vf_2" ><a href="#" onclick="selectCategoryThree('vf_2')">고추/파프리카</a></li>
                <li value="vf_3" ><a href="#" onclick="selectCategoryThree('vf_3')">옥수수/호박</a></li>
              </ul>
            </li>
            <li><a href="#" onclick="selectCategoryTwo('vr')" class="activSub">뿌리채소</a>
              <ul>
	                <li><a href="#" onclick="selectCategoryThree('vr_1')">양파/당근</a></li>
	                <li><a href="#" onclick="selectCategoryThree('vr_2')">무/파</a></li>
	                <li><a href="#" onclick="selectCategoryThree('vr_3')">생각/마늘</a></li>
	                <li><a href="#" onclick="selectCategoryThree('vr_4')">고구마/감자</a></li>
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
          <!-- <label class="control-label" for="input-sort">정렬 :</label> -->
          <div class="sort-inner">
          <span class="control-label">정렬 :</span>
	      	<select  id="input_sort" name="input_sort" onchange="doInput_sort(this.value)">
				<option value="" <c:if test="${empty pageMaker.input_sort }">selected="selected"</c:if> >-----</option>
				<option value="ph" <c:if test="${pageMaker.input_sort eq 'ph'}">selected="selected"</c:if>>가격 높은순</option>
	            <option value="pl" <c:if test="${pageMaker.input_sort eq 'pl'}">selected="selected"</c:if> >가격 낮은순</option>
	        	<option value="vc" <c:if test="${pageMaker.input_sort eq 'vc'}">selected="selected"</c:if> >판매인기순</option>
			</select>
			
			<select  id="searchType" name="searchType" style="width: 75px; height:27px; margin-left: 15px;">
				<option value="product_name" selected="selected">이름</option>
				<option value="seller">판매자</option>
			</select>
			
			<input type="text" name="keyword" id="keyword" value="${pageMaker.searchText }">
			<input type="button" value="검색" onclick="doSearch('1')" data-loading-text="Loading..." class="btn btn-primary">
			<c:if test="${not empty pageMaker.searchText }">
				<input type="button" id="allButton" value="전체보기" onclick="showAll()">
			</c:if>
			<input type="hidden" id="ca1" value="${pageMaker.ca1 }">
			<input type="hidden" id="ca2" value="${pageMaker.ca2 }">
			<input type="hidden" id="ca3" value="${pageMaker.ca3 }">
          </div>
        </div>
      </div>
      <br />
      
      <c:choose>
      	<c:when test="${empty list}">
      		<div class="product-layout product-list col-xs-12" style="margin-left: 40%; margin-top: 15px;">
      		 	<h3>게시물이 존재하지 않습니다.</h3>
      		</div>
      	</c:when>
      	<c:otherwise>
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
					<li><a href="#" onclick="doMove(1)">처음</a></li>
					<c:if test="${pageMaker.prev}">
						<li><a href="#" onclick="doMove(${pageMaker.startPage - 1})">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.lastPage}" var="idx">
						 <li <c:out value="${pageMaker.page == idx?'class =active':''}"/>>
							 <a href="#" onclick="doMove(${idx})">${idx}</a>
						</li>
					</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="#" onclick="doMove(${pageMaker.endPage +1})">&raquo;</a></li>
						</c:if>
						<li><a href="#" onclick="doMove(${pageMaker.lastPage})">마지막</a></li>
					</ul>
		        </div>
		      </div>
		    </c:otherwise>  
      </c:choose>
    </div>
  </div>
    <div>
  </div>
</div>


<script>

	function showAll(){
		$("#keyword").val('');
		doSearch('1');
	}
	function doMove(page){
		var input_sort = $("#input_sort").val();
		var searchOption = $("#searchType").val();
		var searchText = $("#keyword").val();
		var ca3 = $("#ca3").val();
		var ca2 = $("#ca2").val();
		doPaging(page,searchOption,searchText,input_sort, ca2, ca3);
	}
	function pay(product_no){
		location.href="/cart/cart_detail?num=1&product_no="+ product_no;
	}

	function doInput_sort(input_sort){
		var searchOption = $("#searchType").val();
		var searchText = $("#keyword").val();
		var ca2 = $("#ca2").val();
		var ca3 = $("#ca3").val();
		doPaging("1",searchOption,searchText,input_sort, ca2, ca3);
		
	}
	
	function doSearch(page){
		var searchOption = $("#searchType").val();
		var searchText = $("#keyword").val();
		var input_sort = $("#input_sort").val();
		var ca2 = $("#ca2").val();
		var ca3 = $("#ca3").val();
		
		doPaging(page,searchOption,searchText,input_sort, ca2, ca3);
	}
	
	
	function doPaging(page,searchOption,searchText,input_sort, ca2, ca3){
		 location.href="/product/list_product?searchOption="+ searchOption+"&searchText="+searchText+"&page="+page+"&input_sort="+input_sort+"&ca2="+ca2+"&ca3="+ca3; 
	}
   
	
	function selectCategoryTwo(ca2){
		$("#ca2").val(ca2);
		$("#ca3").val("1");
		doSearch("1");
	}
	
	function selectCategoryThree(ca3){
		$("#ca3").val(ca3);
		$("#ca2").val("1");
		doSearch("1");
	}
	
</script>


<%@include file="../include/footer.jsp"%>



 