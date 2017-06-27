<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코팜::경매상품</title>
<style>
	.product-imageblock {
		width: 35%;
	}
	.product-name .rt_auction_name{
		font-size: 25px; 
		position: relative;
		top: 20px;
		
	}
	.product-name .rt_auction_name:hover{
		color: #F26B18;
	}
	.auction_part:hover{
		background: #F26B18;
		color: white;
	}
	#register_button{
		border: none;
		font-weight: bold;
		background: #F26B18;
		color: #FFFFFF;
		width: 100px;
		height: 30px;
		position: relative;
		left: 1079px;
		top: -27px;
	}
	#register_button:hover{
		border: solid 1px #F26B18;
		background: #FFFFFF;
		color: #F26B18;
		font-weight: bold;
	}
	#rt_reg_btn{
		border: none;
		width: 100px; 
		height: 50px; 
     	position: relative; 
  		bottom: 10px; 
  		left: 650px; 
  		font-weight: bold; 
  		font-size: 15px;"
  		
	}
	#rt_reg_btn2{
		border: none;
		width: 100px; 
		height: 50px; 
     	position: relative; 
  		bottom: 10px; 
  		left: 650px; 
  		font-weight: bold; 
  		font-size: 15px;"
  		
	}
	#auction_list{
		/* border: solid 1px red; */
		display: inline-block;
		position: relative;
		left: 300px;
		top: 150px;
		font-size: 25px;
		font-weight: bold;
		color: lightgray;
	}
	#timer_box:hover{
		color: #F26B18;
	}
</style>
<script>

window.onload = function(){
	tid=setInterval(timer, 1000);
	
	tid2=setInterval(timer2, 1000);
	
	$('#auction_list').hide();
	
	var seller_no = '${login.seller_no}'
	
	if(seller_no==""){
		$('#register_button').hide();
	}else{
		$('#register_button').show();
	}
	
	var count = '${count}'
	if(count==0){ 
		$('#auction_list').show();
	}else{
		$('#auction_list').hide();
	}
	
}


function move_register(){
	window.location.href="rt_auction_register";

}


//오전 타이머
	var	time = '${vistingTime}'
	//alert("오전남은시간"+time);
	
	
	function timer(){ 
		 if(-30<=time && time<=0){
			   time--;
			   document.getElementById('timer_box').innerHTML="경매가 시작되었습니다.";
			   $('#rt_reg_btn').show();
		   }else if(time<-30){
			   clearInterval(tid);
			   document.getElementById('timer_box').innerHTML="경매가 종료되었습니다.";
			   $('#rt_reg_btn').hide();
		   }else if(time>0){
			   m= Math.floor(time/(24*60*60))+"일"+Math.floor((time%(24*60*60)/(60*60)))+"시간"+Math.floor(((time%3600)/60))+"분"+time%60+"초";
			   	document.getElementById('timer_box').innerHTML=m;
			   	time--;
			    $('#rt_reg_btn').click(function(){
					  alert("입장 시간이 아닙니다.");
				  });
		   }
	} 
	
	//오후 타이머
	var	time2 = '${vistingTime2}'
		//alert("오후남은시간"+time2);

	
	function timer2(){ 
		if(-30<=time2 && time2<=0){
			   time2--;
			   document.getElementById('timer_box2').innerHTML="경매가 시작되었습니다.";
			   $('#rt_reg_btn2').show();
		   }else if(time2<-30){
			   clearInterval(tid2);
			   document.getElementById('timer_box2').innerHTML="경매가 종료되었습니다.";
			   $('#rt_reg_btn2').hide();
		   }else if(time2>0){
			   m= Math.floor(time2/(24*60*60))+"일"+Math.floor((time2%(24*60*60)/(60*60)))+"시간"+Math.floor(((time2%3600)/60))+"분"+time2%60+"초";
			   	document.getElementById('timer_box2').innerHTML=m;
			   	time2--;
			     $('#rt_reg_btn2').click(function(){
					  alert("입장 시간이 아닙니다.");
				  });
		   }
		} 

</script>


<%@include file="../include/header.jsp"%>

<!-- <div class="preloader loader" style="display: block; background:#f2f2f2;"> <img src="image/loader.gif"  alt="#"/></div> -->
<div class="container">
  <ul class="breadcrumb" style="padding-left: 15px;">
    <li><a href="http://localhost:8081/"><i class="fa fa-home"></i></a></li>
    <li><a href="/auction/rt_auction_list">실시간 경매</a></li>
    <li><a href="#">실시간 경매 상품</a></li>
  </ul>
  <div class="row">
    <div id="column-left" class="col-sm-3 hidden-xs column-left">
      <div class="column-block">
        <div class="column-block">
          <div class="columnblock-title">Categories</div>
          <div class="category_block">
            <ul class="box-category treeview-list treeview">
              <li><a href="../auction/rt_auction_list" class="activSub">실시간경매</a>
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
        <h3 class="productblock-title">마감임박상품</h3>
        <div class="row bestseller-grid product-grid">
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock" style="width:161px; margin-left: 8px;"> <a href="../tender/tenderform?auction_no=${pop_auction0.auction_no }&pay_state=null"> <img src="/resources/files/attach/${pop_auction0.auction_title_img }" alt="${pop_auction0.auction_name }" title="${pop_auction0.auction_name }" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail" style="margin-left:8px;">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${pop_auction0.auction_no }&pay_state=null" title="${pop_auction0.auction_name }" style="margin-left:10xp;">${pop_auction0.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${pop_auction0.auction_up }원</span></p>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${pop_auction0.auction_down }원</span> </p>
              </div>
             <!--  <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock" style="width:161px; margin-left: 8px;"> <a href="../tender/tenderform?auction_no=${pop_auction1.auction_no }&pay_state=null"> <img src="/resources/files/attach/${pop_auction1.auction_title_img }" alt="${pop_auction1.auction_name }" title="${pop_auction1.auction_name }" class="img-responsive" /> </a>
                <!-- <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div> -->
              </div>
              <div class="caption product-detail" style="margin-left:8px;">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${pop_auction1.auction_no }&pay_state=null" title="${pop_auction1.auction_name }">${pop_auction1.auction_name }</a></h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${pop_auction1.auction_up }원</span> </p>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${pop_auction1.auction_down }원</span> </p>
              </div>
              <!-- <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock" style="width:161px; margin-left: 8px;"> <a href="../tender/tenderform?auction_no=${pop_auction2.auction_no }&pay_state=null"> <img src="/resources/files/attach/${pop_auction2.auction_title_img }" alt="${pop_auction2.auction_name }" title="${pop_auction2.auction_name }" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail" style="margin-left:8px;">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${pop_auction2.auction_no }&pay_state=null" title="${pop_auction2.auction_name }">${pop_auction2.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${pop_auction2.auction_up }원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${pop_auction2.auction_down }원 </span> </p>               
              </div>
              <!-- <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock" style="width:161px; margin-left: 8px;"> <a href="../tender/tenderform?auction_no=${pop_auction3.auction_no }&pay_state=null"> <img src="/resources/files/attach/${pop_auction3.auction_title_img }" alt="${pop_auction3.auction_name }" title="${auctionbest3.auction_name }" class="img-responsive" /> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail" style="margin-left:8px;">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=${pop_auction3.auction_no }&pay_state=null" title="${pop_auction3.auction_name }">${pop_auction3.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${pop_auction3.auction_up }원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${pop_auction3.auction_down }원 </span> </p>               
              </div>
              <!-- <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 product-grid-item">
            <div class="product-thumb transition">
              <div class="image product-imageblock" style="width:161px; margin-left: 8px;"> <a href="../tender/tenderform?auction_no=${pop_auction4.auction_no }&pay_state=null"> <img src="/resources/files/attach/${pop_auction4.auction_title_img }" alt="${pop_auction4.auction_name }" title="${pop_auction4.auction_name }" class="img-responsive"/> </a>
                <div class="button-group">
                  <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                  <button type="button" class="addtocart-btn">Add to Cart</button>
                  <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
                </div>
              </div>
              <div class="caption product-detail" style="margin-left:8px;">
                <h4 class="product-name" style="width: 300px;"> <a href="../tender/tenderform?auction_no=$pop_auction4.auction_no }&pay_state=null" title="${pop_auction4.auction_name }">${pop_auction4.auction_name }</a> </h4>
                <p class="price product-price" style="width: 300px;"> <span class="price-new">상한가 : ${pop_auction4.auction_up }원 </span> </p>  <!-- </span><span class="price-tax"> -->
                <p class="price product-price" style="width: 300px;"> <span class="price-new">하한가 : ${pop_auction4.auction_down }원 </span> </p>               
              </div>
              <!-- <div class="button-group">
                <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fa fa-heart-o"></i></button>
                <button type="button" class="addtocart-btn">Add to Cart</button>
                <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fa fa-exchange"></i></button>
              </div> -->
            </div>
          </div>
        </div>
              
      </div>
    </div>
      <!-- LNB (Search) 시작 -->
      
      <!-- LNB (Search) 끝 -->
      <!-- Special 시작 -->
      
      <div id="content" class="col-sm-9">
      <h2 class="category-title" style="font-weight: bold; position: relative; top: 1px;">실시간 경매</h2>
      <input type="button" id="register_button" value="상품등록" onclick="move_register()" style="position: relative; top:-605px; left: 835px;">
      <!-- <div class="row category-banner">
        <div class="col-sm-12 category-image"><img src="image/banners/category-banner.jpg" alt="Desktops" title="Desktops" class="img-thumbnail" /></div>
        <div class="col-sm-12 category-desc">Lorem ipsum dolomagna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.</div>
      </div> -->
      <div class="category-page-wrapper" style="border-bottom: none; width: 940px; height: 600px;">
      <div id="auction_list" style="border: 1px solid red; "><p>오늘은 등록된 상품이 없습니다.</p></div>
        <div class="col-md-6 list-grid-wrapper" style="width: 936px;">
          <div class="btn-group btn-list-grid" style="position: relative; top: -10px;">
 			<button type="button" id="list-view" class="btn btn-default list" data-toggle="tooltip" title="List"><i class="fa fa-th-list" style="color: #F26B18;"></i></button>
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
        <div class="col-md-2 text-right sort-wrapper">
          <label class="control-label" for="input-sort"></label>
          <!-- <div class="sort-inner">
            <select id="input-sort" class="form-control" style="font-size: 12px; padding: 3px;">
              <option value="ASC">신규등록순</option>
              <option value="ASC">마감임박순</option>
              <option value="DESC">입찰자 (내림차순)</option>
              <option value="ASC">현재가 (내림차순)</option>
              <option value="DESC">현재가 (오름차순)</option>
            </select>
          </div> -->
         
        </div>
      </div>
      <br><br><br>
      
     <div class="grid-list-wrapper" id="am">
     <c:forEach items="${list}" var="RT_AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12" style="background: #FCFCFC; width: 960px; height: 200px; margin-bottom: 30px;">
     		<div class="product-thumb" style="border: none; margin: 0; padding: 0; width:936px;">
     			<div class="image product-imageblock" style="width: 300px; height: 200px;"><img src='/resources/files/attach/${RT_AuctionRegisterVO.rt_auction_title_img}' class="img-responsive"></div>
     			<p class="product-name" style="height: 50px;"><span class="rt_auction_name">${RT_AuctionRegisterVO.rt_auction_name}</span></p>
     			<p style="color: lightgray;">${RT_AuctionRegisterVO.rt_auction_content}</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${RT_AuctionRegisterVO.rt_auction_down}
     			</p>
     			<p style="font-size: 12px;">경매시작까지 남은시간</p>
     			<div id="timer_box" style="z-index: 1; position:absolute;
     			bottom: 25px; left: 350px; font-size: 30px; font-weight: bold;"></div>
     			<div id="timer" style="background:#FAFAFA; width: 300px; height: 50px;
     			position: absolute; bottom: 10px; left: 330px;"></div>
     			<input type="button" value="참여하기" id="rt_reg_btn" class="auction_part" onclick=location.href=".."/rt_auction/rt_auction?rt_auction_no=${RT_AuctionRegisterVO.rt_auction_no}" style="position: relative; left: 510px;">
     		</div>
     	</div>
     	</c:forEach>
       </div>
       
       <div class="grid-list-wrapper" id="pm">
     <c:forEach items="${list2}" var="RT_AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12" 
     	style="background: #FCFCFC; width: 960px; height: 200px;">
     		<div class="product-thumb" style="border: none; margin: 0; padding: 0; width:960px;">
     			<div class="image product-imageblock" style="width: 300px; height: 200px;"><img src='/resources/files/attach/${RT_AuctionRegisterVO.rt_auction_title_img}' class="img-responsive"></div>
     			<p class="product-name" style="height: 50px;"><span class="rt_auction_name">${RT_AuctionRegisterVO.rt_auction_name}</span></p>
     			<p style="color: lightgray;">${RT_AuctionRegisterVO.rt_auction_content}</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${RT_AuctionRegisterVO.rt_auction_down}
     			</p>
     			<p style="font-size: 12px;">경매시작까지 남은시간</p>
     			<div id="timer_box2" style="z-index: 1; position:absolute;
     			bottom: 25px; left: 350px; font-size: 30px; font-weight: bold;"></div>
     			<div id="timer2" style="background:#FAFAFA; width: 300px; height: 50px;
     			position: absolute; bottom: 10px; left: 330px;"></div>
     			<input type="button" value="참여하기" id="rt_reg_btn2" class="auction_part" onclick=location.href="../rt_auction/rt_auction?rt_auction_no=${RT_AuctionRegisterVO.rt_auction_no}" style="position: relative; left: 510px;">
     		</div>
     	</div>
     	</c:forEach>
       </div>
       
       <%-- <div class="grid-list-wrapper">
     
     <c:forEach items="${list}" var="RT_AuctionRegisterVO">
     	<div class="product-layout product-list col-xs-12" 
     	style="position: relative; left: 50px; background: #FCFCFC; width: 1100px; height: 200px;">
     		<div class="product-thumb" style="border: none; margin: 0; padding: 0;">
     			<div class="image product-imageblock" style="width: 300px; height: 200px;"><img src='/resources/files/attach/${RT_AuctionRegisterVO.rt_auction_title_img}' class="img-responsive"></div>
     			<p class="product-name" style="height: 50px;"><span class="rt_auction_name">${RT_AuctionRegisterVO.rt_auction_name}</span></p>
     			<p style="color: lightgray;">${RT_AuctionRegisterVO.rt_auction_content}</p>
     			<p class="price product-price">
     			<span style="font-size: 12px; color:#A6A6A6; font-weight: lighter; margin-right:5px;">하한가</span>${RT_AuctionRegisterVO.rt_auction_down}
     			</p>
     			<p style="font-size: 12px;">경매시작까지 남은시간</p>
     			<div id="timer_box" style="z-index: 1; position:absolute;
     			bottom: 25px; left: 350px; font-size: 30px; font-weight: bold;"></div>
     			<div id="timer" style="background:#FAFAFA; width: 300px; height: 50px;
     			position: absolute; bottom: 10px; left: 330px;"></div>
     			<input type="button" value="참여하기" id="rt_reg_btn" class="auction_part" onclick="move_detail()">
     		</div>
     	</div>
     	
     	</c:forEach>
      
       </div> --%>
      <!-- 페이징 처리 -->
      <!-- <div class="category-page-wrapper">
        <div class="result-inner"></div>
        <div class="pagination-inner">
          <ul class="pagination">
            <li class="active"><span>1</span></li>
            <li><a href="category.html">2</a></li>
            <li><a href="category.html">&gt;</a></li>
            <li><a href="category.html">&gt;|</a></li>
          </ul>
        </div>
      </div> -->
      <!-- 페이징 처리 끝 -->
    </div>
  </div>
</div>
      
      
      
      
      
      
      
      
      
      
    </div>
    <!-- Special 끝 -->
    <!-- 리스트 시작 -->
    
</div>
</div>
<%@include file="../include/footer.jsp"%>
</body>
