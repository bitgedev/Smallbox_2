<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 날짜 선택</title>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	var locked = 0;
	var image;
	var el;
	
	function mouseover(star) {
		if (locked==1)
			return;
		
			image = 'image' + star;
			el = document.getElementById(image);
			el.src = "../image/seat1.jpg";
			
	} // ~~~~function mouseover end~~~~
	
	function mouseout(star) {
		if (locked==1)
			return;
		
			image = 'image'+star;
			el = document.getElementById(image);
			el.src = "../image/seat0.png";
		
	} // ~~~~function mouseout end~~~~
		
	function lock(star) {
		mouseover(star);
		locked=1;
	}  // ~~~~function lock end~~~~
	
	function onClk(star) {
		lock(star);
// 		alert("좌석 : " + star);
		document.seatForm.star.value=star;

		var strstar = star.toString();
		var line = strstar.substr(0, 1); 
		var seatno = strstar.substr(-2, 2); 
		
// 		alert("선택한 좌석 열 : " + line);
// 		alert("선택한 좌석 번호 : " + seatno);
		
		document.querySelector("#seatresult").innerHTML = "line : " + line + ", seatno : " + seatno;
	} // ~~~~function onClk end~~~~
		
	
	
</script>
</head>
<body>
<!-- 빈 좌석 파일 image폴더에 seat0 이라는 이름으로 덮어쓰기 하면 바로 반영 됩니다!! 지금은 걍 별모양임-->
<!-- 빈 좌석 파일 image폴더에 seat0 이라는 이름으로 덮어쓰기 하면 바로 반영 됩니다!! 지금은 걍 별모양임-->
<!-- 빈 좌석 파일 image폴더에 seat0 이라는 이름으로 덮어쓰기 하면 바로 반영 됩니다!! 지금은 걍 별모양임-->
<h2>reserve</h2>
	<form action="reservePro.jsp" method="post" name ="seatForm">
		<div id="info">
		<h3>영화 제목 : </h3>
		<h3>영화 포스터 영역</h3>
		<h3>예약 날짜 : </h3>
		<h3>상영 시간 : </h3>
		<h3>예약 한 id : </h3>
		
		</div>

		<div id="seat">
			<span>
				<img id="image101" onmouseover=mouseover(101) onclick=onClk(101) onmouseout=mouseout(101) src="../image/seat0.png" width="20" height="20">
				<img id="image102" onmouseover=mouseover(102) onclick=onClk(102) onmouseout=mouseout(102) src="../image/seat0.png" width="20" height="20">
				<img id="image103" onmouseover=mouseover(103) onclick=onClk(103) onmouseout=mouseout(103) src="../image/seat0.png" width="20" height="20">
				<img id="image104" onmouseover=mouseover(104) onclick=onClk(104) onmouseout=mouseout(104) src="../image/seat0.png" width="20" height="20">
				&nbsp;&nbsp;&nbsp;
				<img id="image105" onmouseover=mouseover(105) onclick=onClk(105) onmouseout=mouseout(105) src="../image/seat0.png" width="20" height="20">
				<img id="image106" onmouseover=mouseover(106) onclick=onClk(106) onmouseout=mouseout(106) src="../image/seat0.png" width="20" height="20">
				<img id="image107" onmouseover=mouseover(107) onclick=onClk(107) onmouseout=mouseout(107) src="../image/seat0.png" width="20" height="20">
				<img id="image108" onmouseover=mouseover(108) onclick=onClk(108) onmouseout=mouseout(108) src="../image/seat0.png" width="20" height="20">
			<!-- 	함수명 onclick 으로 하니까 인식을 못하네요; -->
			</span>
		</div>	
		<div>
			<span>
				<img id="image201" onmouseover=mouseover(201) onclick=onClk(201) onmouseout=mouseout(201) src="../image/seat0.png" width="20" height="20">
				<img id="image202" onmouseover=mouseover(202) onclick=onClk(202) onmouseout=mouseout(202) src="../image/seat0.png" width="20" height="20">
				<img id="image203" onmouseover=mouseover(203) onclick=onClk(203) onmouseout=mouseout(203) src="../image/seat0.png" width="20" height="20">
				<img id="image204" onmouseover=mouseover(204) onclick=onClk(204) onmouseout=mouseout(204) src="../image/seat0.png" width="20" height="20">
				&nbsp;&nbsp;&nbsp;
				<img id="image205" onmouseover=mouseover(205) onclick=onClk(205) onmouseout=mouseout(205) src="../image/seat0.png" width="20" height="20">
				<img id="image206" onmouseover=mouseover(206) onclick=onClk(206) onmouseout=mouseout(206) src="../image/seat0.png" width="20" height="20">
				<img id="image207" onmouseover=mouseover(207) onclick=onClk(207) onmouseout=mouseout(207) src="../image/seat0.png" width="20" height="20">
				<img id="image208" onmouseover=mouseover(208) onclick=onClk(208) onmouseout=mouseout(208) src="../image/seat0.png" width="20" height="20">
			<!-- 	함수명 onclick 으로 하니까 인식을 못하네요; -->
			</span>
		</div>
		<div>
			<span>
				<img id="image301" onmouseover=mouseover(301) onclick=onClk(301) onmouseout=mouseout(301) src="../image/seat0.png" width="20" height="20">
				<img id="image302" onmouseover=mouseover(302) onclick=onClk(302) onmouseout=mouseout(302) src="../image/seat0.png" width="20" height="20">
				<img id="image303" onmouseover=mouseover(303) onclick=onClk(303) onmouseout=mouseout(303) src="../image/seat0.png" width="20" height="20">
				<img id="image304" onmouseover=mouseover(304) onclick=onClk(304) onmouseout=mouseout(304) src="../image/seat0.png" width="20" height="20">
				&nbsp;&nbsp;&nbsp;
				<img id="image305" onmouseover=mouseover(305) onclick=onClk(305) onmouseout=mouseout(305) src="../image/seat0.png" width="20" height="20">
				<img id="image306" onmouseover=mouseover(306) onclick=onClk(306) onmouseout=mouseout(306) src="../image/seat0.png" width="20" height="20">
				<img id="image307" onmouseover=mouseover(307) onclick=onClk(307) onmouseout=mouseout(307) src="../image/seat0.png" width="20" height="20">
				<img id="image308" onmouseover=mouseover(308) onclick=onClk(308) onmouseout=mouseout(308) src="../image/seat0.png" width="20" height="20">
			<!-- 	함수명 onclick 으로 하니까 인식을 못하네요; -->
			</span>
		</div>				
		<div>
			<span>
				<img id="image401" onmouseover=mouseover(401) onclick=onClk(401) onmouseout=mouseout(401) src="../image/seat0.png" width="20" height="20">
				<img id="image402" onmouseover=mouseover(402) onclick=onClk(402) onmouseout=mouseout(402) src="../image/seat0.png" width="20" height="20">
				<img id="image403" onmouseover=mouseover(403) onclick=onClk(403) onmouseout=mouseout(403) src="../image/seat0.png" width="20" height="20">
				<img id="image404" onmouseover=mouseover(404) onclick=onClk(404) onmouseout=mouseout(404) src="../image/seat0.png" width="20" height="20">
				&nbsp;&nbsp;&nbsp;
				<img id="image405" onmouseover=mouseover(405) onclick=onClk(405) onmouseout=mouseout(405) src="../image/seat0.png" width="20" height="20">
				<img id="image406" onmouseover=mouseover(406) onclick=onClk(406) onmouseout=mouseout(406) src="../image/seat0.png" width="20" height="20">
				<img id="image407" onmouseover=mouseover(407) onclick=onClk(407) onmouseout=mouseout(407) src="../image/seat0.png" width="20" height="20">
				<img id="image408" onmouseover=mouseover(408) onclick=onClk(408) onmouseout=mouseout(408) src="../image/seat0.png" width="20" height="20">
			<!-- 	함수명 onclick 으로 하니까 인식을 못하네요; -->
			</span>
		</div>				
			<span id="seatresult"><!--선택한 좌석 정보 나오는 영역--></span>
			<input type="hidden" name="star" >
			<input type="submit" name="submit" value="reserve">
	</form>
	
</body>
</html>