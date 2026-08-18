<%@ page import="java.util.List"%>
<%@ page import="ottproject.OTTContent"%>
<%@ page import="ottproject.OTTComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
		crossorigin="anonymous">
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .content-container {
            width: 700px;
            margin: 50px auto;
        }

        .ott-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
            display: block;
        }

        .description {
            margin-top: 30px;
            padding: 20px;
            font-size: 18px;
            line-height: 1.6;
        }

        .comment-container {
            margin-top: 30px;
        }

        .comment {
            padding: 15px 0;
            border-bottom: 1px solid #ccc;
        }

        .comment-user {
            font-weight: bold;
        }

        .comment-time {
            margin-left: 10px;
            color: gray;
            font-size: 13px;
        }

        .comment-content {
            margin-top: 8px;
        }
    </style>
</head>

<body>
	<h1>출력 페이지</h1>
	<h1>${curId}</h1>
	
<div class="content-container">

    <!-- OTT 제목 -->
    <h1>${ottContent.ottTitle}</h1>


    <!-- OTT 이미지 -->
	<img
	    class="ott-image"
	    src="${pageContext.request.contextPath}/images/${ottContent.ottImageAddress}"
	    alt="${ottContent.ottTitle}"
	>


    <!-- OTT 설명 -->
    <div class="description">
        ${ottContent.ottDescription}
    </div>


<!-- 댓글 --> 
	<div class="comment-container"> 
	<h2>댓글</h2> 
	<!-- 댓글 입력 --> 
		<div class="comment-input-container"> 
			<input type="text" class="comment-input" id="commentInput" placeholder="댓글을 입력하세요." > 
			<button type="button" class="comment-button" id="commentButton"> 등록 </button> 
		</div> 
		<!-- 댓글 목록 --> 
		<c:forEach var="comment" items="${ottCommentList}"> 
		<div class="comment"> 
			<div> <span class="comment-user"> ${comment.userName} </span> 
			<span class="comment-time"> ${comment.commentTime} </span> 
			</div> 
			<div class="comment-content"> ${comment.userComment} 
			</div> 
		</div> 
		</c:forEach>

    </div>

</div>

<script type="text/javascript">

//댓글 등록 버튼(#commentButton)을 클릭했을 때 실행
$("#commentButton").click(function() {

 // 테스트용 이름. 실제로는 로그인 기능을 통해 받아올 것
 const userName = "UserName";


 // 댓글 입력창(#commentInput)에 사용자가 입력한 값을 가져옴
 // .val()은 input의 현재 입력값을 가져오는 jQuery 함수
 const userComment = $("#commentInput").val();


 const ottId = ${ottContent.ottId};


 // 댓글 내용이 비어 있는지 확인
 // trim()은 앞뒤의 공백을 제거한 문자열을 반환
 if (userComment.trim() === "") {

     // 댓글이 비어 있다면 경고창 출력
     alert("댓글을 입력해주세요.");

     // 이후 AJAX 요청을 실행하지 않고 함수 종료
     return;
 }


 // jQuery의 AJAX 기능을 이용해 서버에 데이터 전송
 $.ajax({

     // 요청을 보낼 Servlet의 URL
     // @WebServlet("/OTTCommentController")와 연결됨
     url: "OTTCommentController",

     // POST 방식으로 데이터를 전송
     type: "POST",

     // Servlet에 전달할 데이터
     data: {

         userName: userName,
         userComment: userComment,
         ottId: ottId
     },


     // Servlet에서 정상적으로 응답했을 때 실행
     success: function(response) {

         // Servlet이 "success"라는 문자열을 반환했는지 확인
         if (response === "success") {

             // 댓글 등록 성공 메시지
             alert("댓글이 등록되었습니다.");

             // 댓글 등록이 완료되었으므로 입력창을 비움
             $("#commentInput").val("");

         } else {

             // Servlet에서 "fail"을 반환한 경우
             alert("댓글 등록에 실패했습니다.");

         }
     },


     // 서버 통신 자체에 문제가 발생했을 때 실행
     error: function() {

         alert("서버 통신 중 오류가 발생했습니다.");

     }

 });

});

</script>

</body>

</html>