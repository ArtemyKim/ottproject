<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script type="text/javascript">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<div>
		<button id="loginBtn">로그인</button>
		<div>반갑습니다. ${sessionScope.loginUser}</div>
		<button id="logoutBtn">로그아웃</button>
	</div>


<div align="center"> 
<H2>애니메이션 목록 출력</H2>
<form>

	<img src ="images/prr.png" width = "10%" ottid = "1">
	<img src ="images/prr.png" width = "10%" ottid = "2">
	<img src ="images/prr.png" width = "10%" ottid = "3">
	<img src ="images/prr.png" width = "10%" ottid = "4">
	
</form>
</div>
<script type="text/javascript">

//위의 img태그들에서 가져온 animationid를 받아 저장할 것
$('img').on('click', function(){
    let ottId = $(this).attr('ottid');
    location.href = "ottpage.do?ottId=" + ottId;  
});

$('#loginBtn').click(function(){
	location.href = 'login.do';
})

$('#logoutBtn').click(function(){
	location.href = 'logout.do';
});


</script>
</body>
</html>