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
        src="${ottContent.ottImageAddress}"
        alt="${ottContent.ottTitle}"
    >


    <!-- OTT 설명 -->
    <div class="description">
        ${ottContent.ottDescription}
    </div>


    <!-- 댓글 -->
    <div class="comment-container">

        <h2>댓글</h2>

        <c:forEach var="comment" items="${ottCommentList}">  

            <div class="comment">

                <div>
                    <span class="comment-user">
                        ${comment.userName}                 
                    </span>

                    <span class="comment-time">
                        ${comment.commentTime}
                    </span>
                </div>

                <div class="comment-content">
                    ${comment.userComment}
                </div>

            </div>

        </c:forEach>

    </div>

</div>

</body>

</html>