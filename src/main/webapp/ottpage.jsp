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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ottstyle.css">
<title>Insert title here</title>
   
</head>

<body>
	
<div class="content-container">

    <!-- OTT 제목 -->
    <h1>${ottContent.ottTitle}</h1>


		<div class="video-container">
			<!-- 유튜브 ID를 iframe src에 동적으로 삽입 -->
			<iframe
				src="https://www.youtube.com/embed/${ottContent.youTubeId}?autoplay=1&mute=1"
				title="${ottContent.ottTitle} 예고편" frameborder="0"
				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
				allowfullscreen> </iframe>
		</div>


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
			<div>
				<span class="comment-user"> ${comment.userName} </span> 
				<span class="comment-time"> ${comment.commentTime} </span> 
				<c:if test="${sessionScope.loginUser eq comment.userName}">
	            <button type="button" class="btn-delete" data-id="${comment.commentId}">삭제</button>
	        	</c:if>
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
    const userName = "${sessionScope.loginUser}";

    if (!userName || userName.trim() === "") {
        alert("댓글을 작성하려면 먼저 로그인해주세요.");
        location.href = "login.do";
        return;
    }

    const userComment = $("#commentInput").val();
    const ottId = ${ottContent.ottId};

    if (userComment.trim() === "") {
        alert("댓글을 입력해주세요.");
        return;
    }

    $.ajax({
        url: "OTTCommentController",
        type: "POST",
        data: {
            action: "insert",
            userName: userName,
            userComment: userComment,
            ottId: ottId
        },
        // 구조가 아래로 써서 잘 안보이지만 콜백함수에용
        success: function(response) {
            if (response === "success") {
                alert("댓글이 등록되었습니다.");
                location.reload(); // 등록 후 새로고침
            } else {
                alert("댓글 등록에 실패했습니다.");
            }
        },
        error: function() {
            alert("서버 통신 중 오류가 발생했습니다.");
        }
    });
});

// 댓글 삭제 (jQuery로 구현)
$(document).on("click", ".btn-delete", function() {
    const commentId = $(this).data("id");

    if (!confirm("댓글을 삭제하시겠습니까?")) return;

    $.ajax({
        url: "OTTCommentController",
        type: "POST",
        data: {
            action: "delete",
            commentId: commentId
        },
        success: function(response) {
            if (response === "success") {
                alert("댓글이 삭제되었습니다.");
                location.reload(); // 삭제 후 즉시 새로고침되어 목록에서 사라짐
            } else {
                alert("댓글 삭제에 실패했습니다.");
            }
        },
        error: function() {
            alert("서버 통신 중 오류가 발생했습니다.");
        }
    });
});
</script>

</script>

</body>

</html>