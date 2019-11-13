<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

#Payout{

width : 80%;
height : auto;
margin : 0 auto;
}

h1 {
	border-bottom: 2px solid;
	padding-bottom: 5px;
}


h2 {
 text-align : left;
}
h3{
text-align : left;
}

#receiver{

text-align : left;
width : 50%;
height : 400px;
float : left;
display : inline-block;
}
#receiver label{

font-size : 2em;
line-height: 2em;


}

#receiver input[type="text"]{
border : 0px solid white;
border-bottom : 2px solid black; 

font-size: 1em;
height : 2em;
}

#receiver input[name="address"]{

font-size 1em;

}

#receiver input[type="button"]{

height : 2rem;

}
#receiver_box{
width : 50%;
height : 400px;
float : right;
display : inline-block;
text-align : center;

}

ul {
	list-style: none;
	color: lightgray;
	margin-top: 1em;
	float : left;
	text-aliogn : left;
}
li{
text-aliogn : left;
}

#payinfo{

width : 100%;
height : 200px;
display : block;
}



#paylist {
	width: 90%;
	margin: 0 auto;
	text-align: center;
	display : block;
}

#paylist_header {
	width: 100%;
	height: fit-content;
	font-size: 0.8em;
	text-align: center;
	color: black;
	display: block;
	height: 30px;
}

#paylist_header span {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	line-height: 2.5em;
}

.serial {
	width: 5%;
	height: inherit;
	float: left;
}


.product_img {
	width: 15%;
	float: left;
	height: inherit;
}

.item_code {
	width: 10%;
	height: inherit;
	float: left;
}

.item_name {
	width: 15%;
	height: inherit;
	float: left;
}

.item_price {
	width: 15%;
	height: inherit;
	float: left;
}

 .item_ea {
	width: 5%;
	height: inherit;
	float: left;

}

.promotion {
	width: 5%;
	height: inherit;
	float: left;
}

.point {
	width: 10%;
	height: inherit;
	float: left;
}

.cal_price {
	width: 20%;
	height: inherit;
	float: left;
}

.datalist {
	display: block;
	width: 100%;
	height: 600px;
	overflow: auto;
	box-sizing: content-box;
}

.paylist_data span {
	height: 200px;
	line-height: 3em;
	border-bottom: 1px solid silver;
	overflow: hidden;
	display : inline;
}

.paylist_data .item_ea span {
	border-bottom: none;
}

.paylist_data {
	width: 100%;
	margin: 0;
}

.paylist_data .item_name {
	font-size: 1em;
}

.paylist_data .item_price {
	font-weight: bold;
}

.paylist_data img {
	margin-top: 0.2em;
}

.paylist_data .point {
	color: rgb(255, 128, 0);
	font-weight: bold;
}

.paylist_data  .point label {
	color: black;
	!
	important;
}


.paylist_data .item_ea{
width : 5%;
height : 200px;
border-bottom : 1px solid silver;
display : inline-block;
}

.item_ea. up{
       width : 100%;
 height : calc(200/3)px;

}


.paylist_data .cal_price {
	
	font-size: 3em;
	line-height: 3em;
	font-weight: bold;
}



.paylist_data .promotion {
	
	font-weight: bold;
}

#purchase{

width : 80%;
height : fit-content;
margin : 0 auto;
}

#payment{width : 100%;height : 80px;margin : 0 auto; font-size : 2em;  display : inline-block;}
#payment span{width : 18%; height :fit-content; border : 1px solid silver; float : left; text-align : center; padding-top : 3px; border-bottom: 0px;}
#payment span:hover{background : black; color : white;}

#payment_2{ width : 100%; height : fit-content; px; margin-top: 120px; background : silver; text-align : center; 
font-size : 2em;}

#payment_2 input{ width : 150px; height : 4em; text-align : center; border :none; background : silver; font-size : 2rem;
font-weight : bold;}

#payment2_sub{
font-size : 1rem;
}
#payment2_sub .sub{
width : 25%;
height : 30px;
float : left;}

</style>
<script src="../lib/jquery-3.4.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1e2baa63c39d18009fce247a26326c3&libraries=services"></script>
<body>
<div id="Payout">
<h1>결제페이지</h1>
	
	<div id="payinfo">
	<ul>
	<li>당신의 Purchase Action 감사합니다. But 우리 no responibility 당신의 life 하다.</li>
	<li>Maybe 당신의 life already Nullpoint Exception 이거나 Undefined로 정의되어있다.</li>
	<li> 당신의 Mother must Provoke 너의 Schooldays의 Black history Your Back은 broken and ruined 것이다</li>
	<li> Thank for your this judgement and I also 당신의 명복 ActionBeam</li>
	</ul>
	</div>
	<h2>구매목록</h2>
	<hr/>
			<div id="paylist">
				<div id="paylist_header">
					<span class="serial">번호</span> <span class="product_img">사진</span>
					<span class="item_code">코드</span> <span class="item_name">이름</span>
					<span class="item_price">가격</span> <span class="item_ea">개수</span>
					<span class="promotion">할인</span> <span class="point">포인트</span> 
					<span class="cal_price">총가격</span>
				</div>
				<div class="datalist">
					<%
						for (int i = 0; i < 10; i++) {
					%>
					<div class="paylist_data" id="list<%=i%>">
						<span class="serial"><input type="text" name="innerserial" value="<%=i+1%>" size = "10" readOnly/></span> 
							<span class="product_img" ></span> 
							<span class="item_code">#0019230</span> <span class="item_name">[FlorenceFled]
							여름 SS 바지 한정 존나 긴 이름의 바지</span> <span class="item_price">30000</span>
							
							 <div class="item_ea"><input type="button" class="up" onclick="$.fn.change(<%=i %>,1);" value="▲"/>
							
							<span class="ea">4</span>
							<input type="button" class="down" onclick="$.fn.change(<%=i %>,-1);" value="▼"/></div>
							 <span class="promotion">8</span> <span class="point">900</span> <span
							class="cal_price"></span>
					</div>
					<%
						}
					%>

				</div>
				</div>
				
		
         <div id="paylocation">
        <h2>배송</h2>
      <h3>배송지 설정</h3>
						  <div id="receiver">
						<span><label>받 는 분 : </label><input type="text" name="user_name" size="25"/> </span> <br/>
						
						<span> <label>연 락 처 : </label><input type="text" name="phone" size="25"/></span> <br/>
						 
						<span>  <label>우편번호: </label><input type="text" name="postal" id="postal" size="25" readOnly/></span>
						<input type="button" value="주소찾기" onclick="execDaumPostcode()"/> <br/>
						<span> <label>주  &nbsp; &nbsp; 소 : </label><input type="text" name="address" id="address" size="40" readOnly /></span> <br/>	
						 <span> <label>상세주소: </label><input type="text" name="addressatt" id="addressatt" size="50" onchange="map_change();"/></span><br/> 
						 
						 </div>
						 <div id="receiver_box">
						 hh
						 </div>
						 <div id="daumpostal" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative; margin-top : 400px; ">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>


</div>
                             
				
<h2>결제</h2>
<h3>결제수단 선택</h3>
<hr/>
<div id="purchase">
<div id="payment">
<span>상품권류 </span>
<span>신용카드</span>
<span>계좌이체 </span>
<span>가상계좌 </span>
<span>휴대폰 </span>
<br/><br/><br/>
<div id="payment_info">
결제정보 입니다
</div>
</div>


<div id="payment_2">
<span><input type="text" name="price" value="30,000" readOnly ></span>   
<span>+</span> 
<span><input type="text" name="delieve" value="0" readOnly/></span>   
<span>-</span>
<span><input type="text" name="promotion" value="2,500"readOnly/></span>
<span>=</span>
<span><input type="text" name="total_price" value="14,400"readOnly/></span>
<div id="payment2_sub">
<span class="sub"> 상품 총 금액</span>
<span class="sub"> 총 배송비 </span>
<span class="sub"> 총 할인금액 </span>
<span class="sub"> 총 주문금액</span>
</div>
</div>

</div>
<br/>
<h2>약관</h2>
<h3>약관동의</h3>	
<hr/>
<div id="agreement">
 
<input type="checkbox" name="mustagree"/><span>구매동의(필수)</span><span>약관보기▼</span><br/>
<div id="agree1">
주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의하시겠습니까?(전자상거래법 8조 2항)</div>
<input type="checkbox" name="subagree"><span>주소정보 수집 및 이용 동의</span><span>약관보기▼</span><br/>
<div id="agree2"></div>
</div>
	</div>
	  </div>
</body>
<script>


var mapContainer = document.getElementById('receiver_box'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
   position: new daum.maps.LatLng(37.537187, 127.005476),
   map: map
});

$(document).ready(function(){

	$.fn.total_cal();
	$.fn.listcal();
	 

});



var element_wrap = document.getElementById('daumpostal');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function execDaumPostcode() {
	        // 현재 scroll 위치를 저장해놓는다.
	        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = data.address; // 주소 최종변수
	                var extraAddr = ''; // 참고항목 변수
	                document.getElementById("address").value = addr;// 변수넣은다음
	                
	                geocoder.addressSearch(data.address, function(results, status){
	                	if(status === daum.maps.services.Status.OK){
	                		var result = results[0];
	                		 var coords = new daum.maps.LatLng(result.y, result.x);
	                         // 지도를 보여준다.
	                         mapContainer.style.display = "block";
	                         map.relayout();
	                         // 지도 중심을 변경한다.
	                         map.setCenter(coords);
	                         // 마커를 결과값으로 받은 위치로 옮긴다.
	                         marker.setPosition(coords)
	                     }
	                 });
	                		
	                	         	
	                
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("addressatt").value = extraAddr;
	                
	                } else {
	                    document.getElementById("addressatt").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postal').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addressatt").focus();

	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';

	                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	            },
	            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	            onresize : function(size) {
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);

	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
	    }
	
	



$.fn.total_cal = function(){
	
var tprice = 0;
var tpromotion= 0;
var tpoint = 0;
var tsale = 0;
	for(i=1; i<=$('.paylist_data').length; i++){
		 
		 var price = Number($('.item_price')[i].innerHTML);
		 var promotion =Number($('.promotion')[i].innerHTML);
		 var point = Number($('.point')[i].innerHTML);
	     var ea =Number($('.ea')[i-1].innerHTML);
	     var cal_price = (price *(100-promotion)/100)*ea

	 tprice  += price *ea;  // 2*2
	 tpromotion += price*promotion/100*ea;
     tpoint += Number(point);
    
     
	}
	 tsale = tpromotion + tpoint;
	 
	 $("input[name=price]").val( $.fn.for_commas(tprice))
	 $("input[name=promotion]").val( $.fn.for_commas(tsale));
	 $("input[name=total_price]").val( $.fn.for_commas(tprice-tsale)); 
}



$.fn.change =function(index,num){
		
		var y= Number($('.ea')[index].innerHTML)+num;

		if(y<1) y=1;
		$('.ea')[index].innerHTML =y;
	    $.fn.listcal();
	    $.fn.total_cal();
		}


$.fn.for_commas = function(x){
	
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$.fn.listcal = function(){
	
 for(i=1; i<=$('.paylist_data').length; i++){
	 
	 var price = Number($('.item_price')[i].innerHTML);
	 var promotion =Number($('.promotion')[i].innerHTML);
	 var point = Number($('.point')[i].innerHTML);
     var ea =Number($('.ea')[i-1].innerHTML);
     var cal_price = (price *(100-promotion)/100)*ea-point*ea;

     $('.cal_price')[i].innerHTML =    $.fn.for_commas(cal_price);
     
 
 }



}

$('#agree1').click(function(){
	
	$.fn.listcal();

	
});


</script>
</html>