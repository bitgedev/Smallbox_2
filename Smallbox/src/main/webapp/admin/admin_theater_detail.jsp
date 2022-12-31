<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상영 영화관 상세정보</title>
<script type="text/javascript">
	function confirmDelete(theater_idx, theater_title) {
		let a = ${theater_title};
		var result = confirm(a + "삭제하시겠습니까?");
		
		if(result) {
			location.href = "AdminTheaterDeletePro.ad?theater_idx=" + theater_idx;
		}
	}

</script>
</head>
<body>
	<h1>관리자 - 상영 영화관 상세정보</h1>
		<table border="1">
			<tr>
				<td>상영 영화명</td>
				<td>${theater.theater_title }</td>
			</tr>
			<tr>
				<td>상영 날짜</td>
				<td>${theater.theater_date }</td>
			</tr>
			<tr>
				<td>영화 상영시각</td>
				<td>${theater.theater_time }</td>
			</tr>
			<tr>
				<td>예매 현황</td>
				<td>${theater.theater_reserved }</td>
			</tr>
			<tr>
				<td>좌석 수</td>
				<td>${theater.theater_seat }</td>
			</tr>
		</table>
			<input type="button" value="상영 영화관 수정" onclick="location.href='AdminTheaterModifyForm.ad?theater_idx=${theater.theater_idx}'">
			<input type="button" value="상영 영화관 삭제" 
					onclick="confirmDelete('${theater.theater_idx}, ${theater.theater_title }')">
			<input type="button" value="목록" onclick="location.href='AdminTheaterList.ad'">
</body>
</html>