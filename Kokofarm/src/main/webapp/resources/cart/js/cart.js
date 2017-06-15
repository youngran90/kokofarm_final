
				
				

				/* 
				 * 	index = 각 태그 인덱스 번호
				 * 	cnt = 각 버튼 인덱스 번호
				 * 
				*/

				$(function(){
					// ajax로 체크한 품목만 삭제하기
					//초기 로딩시 전 제품 선택이 되어 있는 상태
					$("input:checkbox[name=product_no]").prop("checked", true); //선택 체크박스
					
					$("input[name=product_no]").each(function(i){
						var index = i + 1;
						$("input:checkbox[class="+index+"dp]").prop("checked", true); // 각 제품 배송비
						$("input:checkbox[class="+index+"tp]").prop("checked", true); // 각 제품 총 금액
						$("input:checkbox[class="+index+"opa]").prop("checked", true); // 각 제품 총 수량
						$("input:checkbox[class="+index+"pn]").prop("checked",true); // 각 제품 품명
						$("input:checkbox[class="+index+"pp]").prop("checked",true); // 각각의 제품 금액
					})
					
						$("#deleteall").on('click',function(event){
							event.preventDefault();
							
							var data=[];
							
							$("input[name=product_no]:checked").each(function(){
								data.push($(this).val());
							})
							
							var url = "/cart/cart";
							if(data.length == 0){
								alert('체크한 품목이 없습니다.');
							}else{
								var sendData = {
										"data" : data
								};
								
								$.ajax({
									type : 'GET',
									url : '/cart/deleteall', 
									data : sendData,
									dataType : 'text',
									success : function(data){
										alert("해당 품목을 삭제하였습니다.");
										$(location).attr("href",url);
									}
								})  
							}
						})
				///////////////////////////////////////////////////////////////////////////	
					
						
						
						//체크박스 전체 선택 / 선택 해제 이벤트
						 $('#all').on('click', function(){
							var cnt = $('input[name=product_no]:checked').length;
							var size = $("input[name=product_no]").length;
							for(var i=0; i<size; i++){
								var index = i + 1;
								if(cnt == 0){
									$("input[id="+index+"ac]").prop("checked",true);
									$("input[class="+index+"dp]").prop("checked",true); //배송비
									$("input[class="+index+"tp]").prop("checked",true); // 금액
									$("input[class="+index+"opa]").prop("checked",true); // 수량
									$("input[class="+index+"pn]").prop("checked",true); // 품명
									$("input[class="+index+"pp]").prop("checked",true); // 각각의 제품 금액
								}else if(cnt >= 0){
									$("input[id="+index+"ac]").prop("checked",false);
									$("input[class="+index+"dp]").prop("checked",false); //배송비
									$("input[class="+index+"tp]").prop("checked",false); // 금액
									$("input[class="+index+"opa]").prop("checked",false); // 수량
									$("input[class="+index+"pn]").prop("checked",false); // 품명
									$("input[class="+index+"pp]").prop("checked",false); // 각각의 제품 금액
								} 
							}  
						}); // 선택 이벤트 종료 
					
					//재고 여부 확인
						$("em[id=p_amount]").each(function(i){
							var index = i + 1;
							var amount = $("em[class="+index+"p_amount]").text(); // 재고량
							var name = $("a[class="+index+"name]").text();
							if( amount == 0){
								alert("제품명 : "+name+"\n현재 재고량 : "+amount+"\n죄송합니다. 재고가 부족하여 구매하실수 없습니다. \n해당 품목을 삭제하여 주세요.");
								$("input[class="+index+"dp]").val(0);
								$("a[class="+index+"name]").css("text-decoration","line-through");
								$("em[id="+index+"dp]").css("text-decoration","line-through");
								$("em[id="+index+"pp]").css("text-decoration","line-through");
								$("input[class="+index+"pa]").css("text-decoration","line-through");
								$("input[class="+index+"pa]").attr("disabled",true);
								$("button[id="+index+"bu]").attr("disabled",true);
								$("button[id="+index+"bd]").attr("disabled",true);
								$("button[id="+index+"bc]").attr("disabled",true);
								$("em[id="+index+"tp]").css("text-decoration","line-through");
								$("input[id="+index+"ac]").prop("checked",false);
								$("input[class="+index+"dp]").prop("checked",false); //배송비
								$("input[class="+index+"tp]").prop("checked",false); // 금액
								$("input[class="+index+"opa]").prop("checked",false); // 수량
								$("input[class="+index+"pn]").prop("checked",false); // 품명
								$("input[class="+index+"pp]").prop("checked",false); // 각각의 제품 금액
							}
						})
					
						//체크박스 선택 없이 주문하기 눌렀을때...
						$(".btn-primary").on('click',function(event) {
							event.preventDefault();
							var checked = $("input:checkbox[name=product_no]:checked").length;
									if(checked > 0 ){
										// ajax로 form submit하기
										$("#cartForm").submit();
									}else{
										alert("상품을 선택해주세요.");
									}
						}); //체크박스 선택없이 주문하기... 종료 
						
						$("input:checkbox[name=product_no]").on("click",function(){ // 숨겨진 체크박스 같이 선택
								var size = $("input[name=product_no]").length;
								for(var i=1; i<=size; i++){
									if($('input:checkbox[id='+i+'ac]').is(":checked") == true){
										$("input[class="+i+"dp]").prop("checked",true); //배송비
										$("input[class="+i+"tp]").prop("checked",true); // 금액
										$("input[class="+i+"opa]").prop("checked",true); // 수량
										$("input[class="+i+"pn]").prop("checked",true); // 품명
										$("input[class="+i+"pp]").prop("checked",true); // 각각의 제품 금액
									}else if($('input:checkbox[id='+i+'ac]').is(":checked") == false){
										$("input[class="+i+"dp]").prop("checked",false); //배송비
										$("input[class="+i+"tp]").prop("checked",false); // 금액
										$("input[class="+i+"opa]").prop("checked",false); // 금액
										$("input[class="+i+"pn]").prop("checked",false); // 품명
										$("input[class="+i+"pp]").prop("checked",false); // 각각의 제품 금액
									}
								}
							})
						/////////////////////////////////////////////////////////////	
							
						
						var size = $("input[name=product_no]").length; //행의 총 개수 ( 1부터 시작한다.)
						$("#cart_amount_count").text(size);
						
						////////////////////////////////////////////////////////////////
						/* 수량 / 증가 / 감소 / 변경 */
						$(".product_price").each(function(i){
							var index = i+1; // 반복문 인덱스 (each메소드는 0번째부터 시작한다)
							var price = $(this).text(); // 각 해당하는 제품 값 불러온다.
							var price_format = numberFormat(price); //정규화 조건으로 캐스팅
							
							$(this).text(price_format); // 가격표 캐스팅
							$('em[id='+index+'tp]').text(price_format); //각 품목에 해당하는 총 금액(로딩 될때 초기 화면)
							
							///////////////////////////////////////////////////////////
							$(document).on("click",".amount_up", function(){ //증가버튼
								var cnt = $(this).attr("value"); // 각 버튼 인덱스
								var amount = $("input[class="+index+"pa]").val(); // 각 해당하는 제품수량
								if(index+"bu" == cnt){
									amount++;
									$('input[class='+index+'pa]').val(amount); // 증가되는 수량 입력
									$('input[class='+index+'opa]').val(amount);
									
									var product_price = price_format.replace(/[^0-9]/g,"");
									var total = product_price * amount; // 수량 적용 된 총 금액 ( 제품 가격 * 수량)
									var total_price = numberFormat(total); // 총 금액 3자리마다 , 로 다시 정규화
									$('em[id='+index+'tp]').text(total_price); // 증가할때마다 해당하는 각제품의 총합을 출력한다. (각 제품 총합)
									$('input[class='+index+'tp]').val(total_price);
									
									hidden_tp(index, total); // hidden 폼에 값 연동
									
									deliveryPrice(index,cnt,total);
									totalSum(size);//윈도우 로딩시 계산 되는 함수 호출	
									/*submit(index_1,total);//금액
									submit_amount(index_1,amount);//수량*/
								}
							}); // 증가버튼 종료 
							
							///////////////////////////////////////////////////////////
							
							$(document).on("click",".amount_down", function(){ //감소버튼
								var cnt = $(this).attr("value"); // 각 버튼 인덱스
								var amount = $('input[class='+index+'pa]').val(); // 각 해당하는 제품수량
							
								if(index+"bd" == cnt){ //index  = 각 행 index
									if( amount < 1){
										alert("0 이하 입력 불가");
									}else{
										amount--;
									}
									var product_price = price_format.replace(/[^0-9]/g,""); //숫자로 정규화 - 제품 가격
									$('input[class='+index+'pa]').val(amount); // 감소하는 수량 입력
									$('input[class='+index+'opa]').val(amount);
									
									var total = product_price * amount; // 총 금액 ( 제품 가격 * 수량)
									var total_price = numberFormat(total); // 총 금액 3자리마다 , 로 다시 정규화 
									
									$('em[id='+index+'tp]').text(total_price); // 감소할때마다 해당하는 각제품의 총합을 출력한다. (각 제품 총합)
									$('input[class='+index+'tp]').val(total_price);
									
									hidden_tp(index, total); // hidden 폼에 값 연동
									
									deliveryPrice(index,cnt,total);
									totalSum(size);//윈도우 로딩시 계산 되는 함수 호출
									
									/*submit_1(index_2,total);//금액
									submit_amount(index_2,amount);//수량*/				
								}
							});//감소버튼 종료
							
							///////////////////////////////////////////////////////////	
								
							$(document).on("click",".change",function(){ // 수량 변경으로 값 구하기
								var cnt = $(this).attr("value"); // 각 버튼 인덱스
								var amount = $('input[class='+index+'pa]').val(); // 각 해당하는 제품수량
								$("input[class="+index+"opa]").val(amount);
								if(index+"bc" == cnt ){
									if(amount <1){
										alert("0이하 입력 불가");
										$('em[id='+index+'tp]').text(0);
										$('input[class='+index+'opa]').val(0);
									}else{
										var product_amount = parseInt(amount); //  각 제품 수량 정수형으로 캐스팅
										var num_casting = price.replace(/[^0-9]/g,""); //천 단위 제거 
										var product_price = parseInt(num_casting); // 각 제품 가격 정수형으로 캐스팅
				 
										var total = product_amount * product_price;
										var total_casting = numberFormat(total);
										$('em[id='+index+'tp]').text(total_casting);
										$('input[class='+index+'tp]').val(total_casting);
										
										hidden_tp(index, total); // hidden 폼에 값 연동
										
										deliveryPrice(index,cnt,total);
										totalSum(size); //윈도우 로딩시 계산 되는 함수 호출
										/*submit_2(index_3,total);//금액
										submit_amount(index_3,amount);//수량*/					
									}
								}
							});//수량 변경버튼		
						}); // 수량변경 & 금액 구하는거 종료 
						
						/////////////////////////////////////////////////////////////////////////////
						// 정규화 함수 
						function numberFormat(x) { //3 자리수 마다 , 표시
							return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
						
						/////////////////////////////////////////////////////////////////////////////
						// 증가 + 감소 + 수량 변경 버튼을 통해 금액값 폼이랑 연동
						function hidden_tp(index, price){
							$("input[class="+index+"tp]").val(price);// 금액값폼에 hidden
						}
						
						///////////////////////////////////////////////////////////////////////////////
						// 버튼 입력시... 배송비 연동
						function deliveryPrice(index,cnt,total){ //cnt = 버튼 인덱스 , total = 수량 반영된 제품 가격
							var delivery_sum = 0; // 배달비 총합을 담을 변수1
									if(index+"bu" == cnt){
										if(total >= 50000){
				 							$("em[id="+index+"dp]").text("무료배송");
				 							$("b[id="+index+"dp_unit]").text("");
				 							$("input[class="+index+"dp]").val(0);
					 					}else{
					 						$("em[id="+index+"dp]").text(numberFormat(2500));
					 						$("b[id="+index+"dp_unit]").text("원");
					 						$("input[class="+index+"dp]").val(2500);
					 					}
									}else if(index+"bd" == cnt){
										if(total >= 50000){
											$("em[id="+index+"dp]").text("무료배송");
				 							$("b[id="+index+"dp_unit]").text("");
				 							$("input[class="+index+"dp]").val(0);
					 					}else{
					 						$("em[id="+index+"dp]").text(numberFormat(2500));
					 						$("b[id="+index+"dp_unit]").text("원");
					 						$("input[class="+index+"dp]").val(2500);
					 					}
									}else if(index+"bc" == cnt){
										if(total >= 50000){
											$("em[id="+index+"dp]").text("무료배송");
				 							$("b[id="+index+"dp_unit]").text("");
				 							$("input[class="+index+"dp]").val(0);
					 					}else{
					 						$("em[id="+index+"dp]").text(numberFormat(2500));
					 						$("b[id="+index+"dp_unit]").text("원");
					 						$("input[class="+index+"dp]").val(2500);
					 					}
									}
									
					 				$(".delivery_price").each(function(i){
					 					var index = i + 1;
					 					var price = $("input[class="+index+"dp]").val(); //배송비
						 				var price_casting = price.replace(/[^0-9]/g,"");
					 					
						 				if(index <= size){
											delivery_sum += parseInt(price_casting);
										}
					 				})
									
								var delivery_casting = numberFormat(delivery_sum);
								$(".result_delivery").text(delivery_casting);
						}// 윈도우 호출시 자동으로 각 제품의 합을 구해주는 함수 종료2
						
						///////////////////////////////////////////////////////////////////////////////
						// 수량 변경시 총합 연동
						function totalSum(size){// 윈도우 호출시 자동으로 각 제품의 합을 구해주는 함수(size는 각 행의 개수를 파라미터로 받아온다)
							var sum = 0;	// 각 제품의 총합을 담을 변수
							$(".total_price").each(function(i){
								var index = i + 1; // 각 행의 인덱스(0번부터 시작해서 1번으로 맞추기 위해 1을 더해준다)
								var price = $(this).text(); // 이벤트 안에서의 this는 이벤트 대상을 가르킨다 이때 this는 각 행의 제품 값을 해당한다.
								var price_casting = price.replace(/[^0-9]/g,""); 
								
								if(index <= size){
									sum += parseInt(price_casting);
								}
							})
							var sum_casting = numberFormat(sum);
							$(".result_price").text(sum_casting);
							
							var delivery = $(".result_delivery").text();
							var delivery_casting = delivery.replace(/[^0-9]/g,"");
							
							var result_total = sum + parseInt(delivery_casting);
							var result_total_casting = numberFormat(result_total);
							
							$(".result_total").text(result_total_casting);
						}// 윈도우 호출시 자동으로 각 제품의 합을 구해주는 함수 종료
						
						///////////////////////////////////////////////////////////////////////////////
						// 로딩 각 제품 총 합 로딩 시키기
						var loading_sum = 0;
						$('.product_price').each(function(i) {
							var index = i + 1;
							var cnt = $(this).attr("id");
							
							var product_price = $(this).text();
							var product_price_casting = product_price.replace(/[^0-9]/g,"");
							var price = parseInt(product_price_casting); // 제품가격뽑아오기
							
							var product_amount = $("input[class="+index+"pa]").val();
							
							var product_amount_casting = product_amount.replace(/[]^0-9]/g,"");
							var amount = parseInt(product_amount_casting);
							
							if(index+"pp" == cnt){
								loading_sum = price * amount;
								var total_price = numberFormat(loading_sum);
								$('em[id='+index+'tp]').text(total_price);
								$("input[class="+index+"tp]").val(loading_sum); 
							}
						})
						
						///////////////////////////////////////////////////////////////////////////////
						// 제품  가격 배송비 안내 박스  ////////////////////////////////////////////////////
						// 로딩시 배송비 구하기
						var result_delivery = 0; //배송비 총합 구하기 위한 변수
						$(".delivery_price").each(function(i){
							var index = i + 1;
							var product_price = $("em[id="+index+"tp]").text();
							var product_price_casting = product_price.replace(/[^0-9]/g,"");
							var delivery_price = 0; // 배송비 담을 변수
							
							var amount = $("em[class="+index+"p_amount]").text(); // 재고량
							
							if(amount == 0){
								
								delivery_price = 0;
								
								if(index <= size){
									result_delivery += delivery_price;
								}
								
								$(".result_delivery").text(numberFormat(result_delivery)); // 배송비 총합 출력delivery_casting
								
							}else{
								
								if(parseInt(product_price_casting) >= 50000){
									$(this).text("무료배송");
									$("b[id="+index+"dp_unit]").text("");
									delivery_price = 0;
									$("input[class="+index+"dp]").val(delivery_price);
								}else{
									$(this).text(numberFormat("2500"));
									delivery_price = 2500;
									$("input[class="+index+"dp]").val(delivery_price);
								}
								if(index <= size){
									result_delivery += delivery_price;
								}
							}
							
						})
						$(".result_delivery").text(numberFormat(result_delivery)); // 배송비 총합 출력delivery_casting
						///////////////////////////////////////////////////////////////////////////////
						// 로딩시 제품 총 합 구하기
						var result_sum = 0 ; // 모든 총합을 담을 변수
						$(".total_price").each(function(i){
							var index = i + 1; //각 해당 인덱스 
							var tp = $("em[id="+index+"tp]").text(); // 각 품목에대한 총 금액(문자열)
							var tp_casting = tp.replace(/[^0-9]/g,""); //각 품목 총합의 천단위를 제거한다 
							
							var amount = $("em[class="+index+"p_amount]").text(); // 재고량
							
							if(amount == 0 ){
								
								tp_casting = 0;
								
								if(index <= size){
									result_sum += parseInt(tp_casting); // 총합구하는 구문
								}
								
								$(".result_price").text(numberFormat(result_sum)); //주문금액 총합 출력
							}else{
								if(index <= size){
									result_sum += parseInt(tp_casting); // 총합구하는 구문
								}
							}
							
						});
						
					    $(".result_price").text(numberFormat(result_sum)); //주문금액 총합 출력
					    ///////////////////////////////////////////////////////////////////////////////
						// 로딩시 제품 총 합 + 배송비 총 합
						var result_total = parseInt(result_delivery) + parseInt(result_sum); // 총 예상 결제금액 변수
						var total_casting = numberFormat(result_total); // 총 결제금액 변환
						$(".result_total").text(total_casting); // 총 예상 결제금액 (로딩)
				});














































				/*

				$(".btn-primary").on('click',function(event){
					 
					 
					 event.preventDefault();
					
					var formData;
					$("input[name=order]").each(function(i){
						var index = i + 1;
						var cnt = $("input[name=order]:checked").attr("id");
						if(index+"ac"==cnt){
							formData = {
									order_product_no : $(this).val(), // 각 제품 제품번호
									product_amount : $("input[class="+index+"pa]").val(), // 각 제품 수량
									order_delivery_price :$("input[class="+index+"dp]").val(), // 각 제품 배송비
									order_total_price : $("input[class="+index+"tp]").val(), // 각 제품 총 금액
							};
							alert(formData.order_product_no);
							alert(formData.product_amount);
							alert(formData.order_delivery_price);
							alert(formData.order_total_price);
						}
						alert(formData.order_product_no);
						alert(formData.product_amount);
						alert(formData.order_delivery_price);
						alert(formData.order_total_price);
							
						
						
						 $.ajax({
							type : 'POST',
							url : '/orderproduct/orderproduct',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							data : JSON.stringify(formData),
							dataType : 'text',
							success : function(data){
								$(location).attr("href","/orderproduct/orderproduct");
							},
							error : function(request,status,error){
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								alert("실패");
							}
						
						}) 
					})
					
					 
				}); */