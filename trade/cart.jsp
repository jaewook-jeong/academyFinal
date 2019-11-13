<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href = "./css/cart.css" type = "text/css" rel = "stylesheet" />
</head>
<body>

<div id="payout">
   <form name="cartform" id="cartform" method="POST">
      <input type="hidden"  id="hidden" name="paylist" value=""/>
      <input type="hidden"  id="save" name ="savelist" value=""/>
       <input type="hidden" id="delete1" name="deletelist" value="" />
      
      <h1>장바구니</h1>
      
      <ul>
         <li>동일 주문 건이라도 2개 이상의 브랜드를 주문하신 경우,각각 배송됩니다.</li>
         <li>입금 확인 상태만 주문/취소 가능합니다.배송 준비 중부터 취소가 어려우며 반송 후 환불 처리 됩니다.</li>
         <li>구매 확정시 환불 및 교환이 불가능합니다.</li>
      </ul>
   
   
      <div id="payinfo">장바구니 목록</div>
      
         <div id="paylist">
            <div id="paylist_header">
               <span class="check_box">결제확인</span> 
               <span class="item_name">상품명</span>
               <span class="item_price">가격</span> 
               <span class="item_ea">수량</span>
               <span class="promotion">할인</span> 
               <span class="point">포인트</span> 
               <span class="cal_price">총가격</span>
            </div>
            
            <% int i = 0; int k= 0; int p =0; int c=0;%>
            <div class="datalist">
               <c:forEach var ='data' items='${list }'>
                  <div class="data" id="data">
                     <span class="check_box">
                        <input type="checkbox" name="chk" id="chk" onclick='for_info("hi")' >
                        <input type="button" value="삭제" name="del" id="del" onclick="for_del(<%=c++%>)" style="cursor: pointer;"/>
                     </span> 
                     <span class="product_img">
                        <img class="productimg" src="./supload/${data.cphoto }" style="cursor: pointer;" onclick="gogoviewview('${data.ccode}')" />
                        <span class="item_name">${data.cname }</span>
                        <span class="item_code" style="display: none;">${data.ccode }</span>  
                     </span> 
                     
                     <span class="item_price">${data.cprice }</span>
                     
                     <div class="item_ea">
                        <input type="button" name="up" onclick="change(<%=i++%>,1);" value="▲"/>
                        <span class="ea">${data.cea }</span>
                        <input type="button" name="down" onclick="change(<%=k++%>,-1);" value="▼"/>
                     </div>
                     
                     <span class="promotion">${data.cpromotion }</span>
                     <span class="point">Y</span>
                     <span class="cal_price"></span>
                  </div>
               </c:forEach>
               
            </div>
         </div>
   
   
      <div id="info_zone">
         상품원가 <span id="total_price">0</span> - 할인적용 <span id="total_promotion">0</span> = 총 가격 <span id="total_cal_price">0</span>
      </div>
      
      <div id="agree_zone">
         <input type="button" id="btn_agree" value="결제하기" onclick="for_json();" style="cursor: pointer;" />
         <input type="button" id="btn_save" value="저장하기" onclick="for_save();" style="cursor: pointer;"/>
      </div>
   </form>
</div>

   
  <script>
	
	// input type 안쓰고 innerHTML로 작업해서 Spring Mybatis 연동안됨다 JDBC 로 
// <get
	
var frm = document.cartform;
var price = document.getElementsByClassName("item_price");
var promotion = document.getElementsByClassName("promotion");
var point = document.getElementsByClassName("point");
var cal_price = document.getElementsByClassName("cal_price");
var ea =document.getElementsByClassName("ea");
var list =document.getElementsByClassName("data");
var checkbox =document.getElementsByName("chk");
var up =document.getElementsByClassName("up");
var down =document.getElementsByClassName("down");



for_cal_price();
function gogoviewview(code) {
	location.href = "index.jsp?content=view.shop&pCode="+code;
}


function change(index,num){
	
	var y= Number(ea[index].innerHTML)+num;

	if(y<1) y=1;
	ea[index].innerHTML =y;
	for_cal_price();
	for_info();
	}
	
	
	
function for_save(){
	var code = document.getElementsByClassName("item_code")
	 var name = document.getElementsByClassName("item_name")
	 
	 for_delete();


	var js_save = new Array(); // JSON의 전체를 가르키는 배열



	     for(var i=0; i<list.length; i++){
	    	 if(list[i].style.display!="none"){
	    			var js_save_in = new Object(); // JSON  데이터 객체 
	    	  //필요한것 상품코드 //상품이름 //수량// 상품원가//사용포인트//할인율//계산완료금액
	    	 
	    	
	    	 js_save_in['user_id'] ='${sessionScope.user_id}';
	    	 js_save_in['item_img'] = "";  //이미지 소스 넣어야함
	    	 js_save_in['item_code'] = code[i].innerHTML;
	    	 js_save_in['item_name'] = name[i+1].innerHTML;
	         js_save_in['ea'] = ea[i].innerHTML;
		     js_save_in['item_price'] = price[i+1].innerHTML;
	    	 js_save_in['point'] = point[i+1].innerHTML;
	         js_save_in['promote'] = promotion[i+1].innerHTML; 
	         
	         
	         
	         js_save.push(js_save_in);
	         
	      
	    	 } //end of if
	    	
	}// end of for
	   
	   var json_save = JSON.stringify(js_save);

	 		 // 세이브저장
	 	
	 var save = document.getElementById("save");
	 		 save.value = json_save;
	 	console.log("jsonsave"+json_save);
	 
		
    frm.action = 'index.jsp?content=merge.trade';
		
	frm.submit();
	
}//end of method

function for_delete(){
	
	var code = document.getElementsByClassName("item_code");
	 var name = document.getElementsByClassName("item_name");


	var js_delete = new Array(); // JSON의 전체를 가르키는 배열



	     for(var i=0; i<list.length; i++){
	    	 if(list[i].style.display=="none"){
	    			var js_delete_in = new Object(); // JSON  데이터 객체 
	    	  //필요한것 상품코드 //상품이름 //수량// 상품원가//사용포인트//할인율//계산완료금액
	    	 js_delete_in['user_id'] = '${sessionScope.user_id}';
	    	 js_delete_in['item_code'] = code[i].innerHTML;
	         js_delete.push(js_delete_in);
	    	 } //end of if
	    	
	}// end of for
	   
	   var json_delete = JSON.stringify(js_delete);

	 		 // 세이브저장
	 	
	 var delete1 = document.getElementById("delete1");
	 		 delete1.value = json_delete;
	 	console.log("jsondelete"+delete1.value);
	 
	
	
}


function for_json(){
var count_product = 0;

for(var j=0 ; j<list.length ; j++){
	if(checkbox[j].checked){
		count_product++;
	}
}
//
if(count_product >0){
	var code = document.getElementsByClassName("item_code")
	 var name = document.getElementsByClassName("item_name")
	;


	var js_list = new Array(); // JSON의 전체를 가르키는 배열


	     for(var i=0; i<list.length; i++){
	    	 if(list[i].style.display!="none"){
	    	 var js_list_in = new Object(); // JSON의 내부배열 MAP현태의 배열
	    	  //필요한것 상품코드 //상품이름 //수량// 상품원가//사용포인트//할인율//계산완료금액
	    	 
	    	 if(checkbox[i].checked){ 
	    	
	    	 
	         js_list_in['user_id'] = '${sessionScope.user_id}';
	    	 js_list_in['item_code'] = code[i].innerHTML;
	    	 js_list_in['item_name'] = name[i+1].innerHTML;
	         js_list_in['ea'] = ea[i].innerHTML;
		     js_list_in['item_price'] = price[i+1].innerHTML;
	    	 js_list_in['point'] = point[i+1].innerHTML;
	         js_list_in['promote'] = promotion[i+1].innerHTML; 
	         js_list_in['cal_price']	  = cal_price[i+1].innerHTML;
	         
	      
	         js_list.push(js_list_in);
	    	 } //end of if
	    	 
	}//end of if
	  
	     
	     } // end if for

	 
	var json_payout = JSON.stringify(js_list);

		console.log(js_list);	
		var hidden = document.getElementById("hidden");
		hidden.value=json_payout;
		console.log(hidden.value);
		
			frm.action = 'index.jsp?content=payout.pay';
			
		  frm.submit();
		
}else{
	alert("결제할 상품을 체크해주세요");
}
 
	
	
}
	
	



function for_del(index){
	
	var datalist = document.getElementsByClassName("data");
checkbox[index].checked = false;
for_info();
datalist[index].style.display = "none";
//삭제 메소드
	
}


	

function for_cal_price(){


	for(var i = 1; i <= list.length; i++){



	  var int_price = Number(price[i].innerHTML);
	  var int_promotion = Number(promotion[i].innerHTML);
	
	  var int_ea = Number(ea[i-1].innerHTML);
	  var section_price =(int_price/100*(100-int_promotion))*int_ea; 
	  
	  

	 cal_price[i].innerHTML = for_commas(section_price);
	 

	 console.log(int_promotion);

	}
	
}

function for_commas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}  //정규화 

function for_info(){
	var tprice =document.getElementById("total_price");
	var tpromotion = document.getElementById("total_promotion");
	var tcal_price = document.getElementById("total_cal_price");
	
	var t_price= 0;
	var result =0 ; //total price
	var result2=0;//total promotion
	var checked =0;
    var price_array = new Array();
    var promotion_array = new Array();
	
    for(var i=0; i<checkbox.length; i++){
    if(checkbox[i].checked){
    	
    	  price_array[i]=Number(price[i+1].innerHTML)*ea[i].innerHTML;
    	  
    	  promotion_array[i]=Number(price[i+1].innerHTML)*Number(promotion[i+1].innerHTML)*0.01*ea[i].innerHTML;
    	 
    }

    	    else{
    	    
    	    }
    	  
    	    if(isNaN(price_array[i])) price_array[i] = 0;
    	   
    	    result += Number(price_array[i]);
    	    if(isNaN(promotion_array[i]))promotion_array[i] = 0;
    	    result2 += Number(promotion_array[i]);
    		}
    	     
    	    tprice.innerHTML = for_commas(result);
    	    tpromotion.innerHTML = for_commas(result2);
    	    tcal_price.innerHTML = for_commas(result-result2);
    		}
    	
	



</script>
</body>
</html>