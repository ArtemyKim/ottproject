<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>라프텔 - 애니메이션 추천</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <!-- 외부 CSS 연결 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ottstyle.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark border-bottom border-secondary" style="background-color: #0b0c0d;">
  <div class="container">
    <a class="navbar-brand" href="#">LXTV</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
        <li class="nav-item"><a class="nav-link" href="#">태그 검색</a></li>
      </ul>
      <form class="d-flex me-3">
        <input class="form-control form-control-sm bg-dark text-white border-secondary" type="search" placeholder="제목, 제작사 검색" aria-label="Search">
      </form>
      
      <!-- 🌟 JSTL 로직을 네비게이션 바 우측에 자연스럽게 배치 🌟 -->
      <div class="d-flex align-items-center">
        <c:choose>
            <c:when test="${empty sessionScope.loginUser}">
                <button class="btn btn-sm text-white" id="loginBtn" style="background-color: #816BFF; border-color: #816BFF;">로그인</button>
            </c:when>
            <c:otherwise>
                <span class="text-white me-3" style="font-size: 0.95rem;">${sessionScope.loginUser}님</span>
                <button class="btn btn-outline-danger btn-sm" id="logoutBtn">로그아웃</button>
            </c:otherwise>
        </c:choose>
      </div>

    </div>
  </div>
</nav>

<div class="container my-4">
    
    <!-- 캐러셀 (메인 배너) -->
    <div id="mainBannerCarousel" class="carousel slide carousel-fade mb-5" data-bs-ride="carousel" data-bs-interval="4000">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#mainBannerCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#mainBannerCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#mainBannerCarousel" data-bs-slide-to="2"></button>
      </div>
      <div class="carousel-inner rounded">
        <div class="carousel-item active banner-click" data-ottid="101">
          <img src="images/장송의 프리렌 포스터.jpg" class="d-block w-100" alt="배너 1">
          <div class="carousel-overlay"></div>
          <div class="carousel-caption d-none d-md-block">
            <span class="badge" style="background-color: #816BFF; margin-bottom: 10px;">주인장 엄선작</span>
            <h2>장송의 프리렌</h2>
            <p>사랑을 알아가는 이야기.</p>
          </div>
        </div>
        
        <div class="carousel-item banner-click" data-ottid="102">
          <img src="images/토리코 포스터.png" class="d-block w-100" alt="배너 2" style="object-position: center 12%;">
          <div class="carousel-overlay"></div>
          <div class="carousel-caption d-none d-md-block">
            <span class="badge bg-danger" style="margin-bottom: 10px;">한준서 추억작</span>
            <h2>토리코</h2>
            <p>미식 기행</p>
          </div>
        </div>

        <div class="carousel-item banner-click" data-ottid="103">
          <img src="images/스파이더맨 포스터.jpg" class="d-block w-100" alt="배너 3">
          <div class="carousel-overlay"></div>
          <div class="carousel-caption d-none d-md-block">
            <span class="badge bg-success" style="margin-bottom: 10px;">메타 반영</span>
            <h2>스파이더맨</h2>
            <p>거미 인간</p>
          </div>
        </div>
      </div>
      
      <button class="carousel-control-prev" type="button" data-bs-target="#mainBannerCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#mainBannerCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
      </button>
    </div>

    <h3 class="section-title"></h3>
    
    <!-- 애니메이션 카드 목록 -->
    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-4">
        
        <div class="col">
            <div class="card anime-card" data-ottid="1">
                <img src="images/페이트-제로.png" class="card-img-top" alt="애니메이션 1" onerror="this.src='https://via.placeholder.com/300x450?text=No+Image'">
                <div class="card-body p-0">
                    <h5 class="card-title">페이트 제로</h5>
                    <p class="card-text">TVA · 액션/다크판타지</p>
                </div>
            </div>
        </div>
        
        <div class="col">
            <div class="card anime-card" data-ottid="2">
                <img src="images/인셉션.png" class="card-img-top" alt="애니메이션 2" onerror="this.src='https://via.placeholder.com/300x450?text=No+Image'">
                <div class="card-body p-0">
                    <h5 class="card-title">인셉션</h5>
                    <p class="card-text">영화 · SF/꿈</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card anime-card" data-ottid="3">
                <img src="images/비긴 어게인.png" class="card-img-top" alt="애니메이션 3" onerror="this.src='https://via.placeholder.com/300x450?text=No+Image'">
                <div class="card-body p-0">
                    <h5 class="card-title">비긴 어게인</h5>
                    <p class="card-text">영화 · 음악/휴먼</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card anime-card" data-ottid="4">
                <img src="images/진격의 거인.png" class="card-img-top" alt="애니메이션 4" onerror="this.src='https://via.placeholder.com/300x450?text=No+Image'">
                <div class="card-body p-0">
                    <h5 class="card-title">진격의 거인</h5>
                    <p class="card-text">TVA · 다크판타지</p>
                </div>
            </div>
        </div>
        
        <div class="col">
            <div class="card anime-card" data-ottid="5">
                <img src="images/코노스바.png" class="card-img-top" alt="애니메이션 5" onerror="this.src='https://via.placeholder.com/300x450?text=No+Image'">
                <div class="card-body p-0">
                    <h5 class="card-title">이 멋진 세계에 축복을!</h5>
                    <p class="card-text">TVA · 코미디/판타지</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card anime-card" data-ottid="6">
                <img src="images/스파이더맨.jpg" class="card-img-top" alt="애니메이션 6" onerror="this.src='https://via.placeholder.com/300x450?text=No+Image'">
                <div class="card-body p-0">
                    <h5 class="card-title">스파이더맨 브랜드 뉴 데이</h5>
                    <p class="card-text">영화 · 히어로/일상</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card anime-card" data-ottid="7">
                <img src="images/짱구-극장판.png" class="card-img-top" alt="애니메이션 7" onerror="this.src='https://via.placeholder.com/300x450?text=No+Image'">
                <div class="card-body p-0">
                    <h5 class="card-title">짱구 극장판 : 어른 제국의 역습</h5>
                    <p class="card-text">극장판 · 일상/감동</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card anime-card" data-ottid="8">
                <img src="images/장송의 프리렌.png" class="card-img-top" alt="애니메이션 8" onerror="this.src='https://via.placeholder.com/300x450?text=No+Image'">
                <div class="card-body p-0">
                    <h5 class="card-title">장송의 프리렌</h5>
                    <p class="card-text">TVA · 힐링/판타지</p>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    // 1. 하단 포스터 카드 클릭 시 상세 페이지 이동
    $('.anime-card').on('click', function(){
        let ottId = $(this).data('ottid'); 
        if(ottId) location.href = "ottpage.do?ottId=" + ottId;
    });

    // 2. 상단 대형 배너 클릭 시 상세 페이지 이동
    $('.banner-click').on('click', function(){
        let ottId = $(this).data('ottid');
        if(ottId) location.href = "ottpage.do?ottId=" + ottId;
    });

    // 3. 로그인 / 로그아웃 버튼 이벤트
    $('#loginBtn').click(function(){ location.href = 'login.do'; });
    $('#logoutBtn').click(function(){ location.href = 'logout.do'; });
});
</script>

</body>
</html>