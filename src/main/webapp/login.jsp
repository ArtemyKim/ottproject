<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>login page</title>
</head>
<body>
	<div align="center" style="margin-top: 100px;">
		<h2>로그인</h2>
		<form action="login.do" method="post" id="loginForm">
			<div style="margin-bottom: 10px;">
				<table>
					<tr>
			            <td>
			                <label>아이디: </label>
			                <input type="text" name="userId" id="userId" placeholder="아이디 입력">
			            </td>
			        </tr>
			        <tr>
			            <td>
			                <label>패스워드: </label>
			                <input type="password" name="userPassword" id="userPassword" placeholder="비밀번호 입력">
			            </td>
			        </tr>
				</table>
			</div>
			<div>
				<button type="submit">로그인하기</button>
				<button type="button" id="back">돌아가기</button>
				
			</div>		
		</form>
	
	</div>
	
	<script>
	
	$('#back').click(function(){
		location.href = 'otthome.do';
	})
	
	$('#loginForm').submit(function(e) {
		let userId = $('#userId').val().trim();
		let userPassword = $('#userPassword').val().trim();
		
		if (userId === '') {
			alert('아이디를 입력해주세요.');
			$('#userId').focus(); 
			e.preventDefault();
			return false;
		}

		if (userPassword === '') {
			alert('비밀번호를 입력해주세요.');
			$('#userPassword').focus(); 
			e.preventDefault();     
		}
	});
		
	</script>

</body>
</html>