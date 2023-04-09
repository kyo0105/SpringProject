<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<div class="top-wrap">
		<div class="inner-box" id="tip-box-top">
			<a href="/" class="btn-logo"> 
				<i class="ico-logo"></i>
				<h1 class="hidden">도미노피자</h1>
			</a>

			<div class="location active">
				<a href="javascript:void(0);" id="myloc" onclick="gpsLsm(gps_yn);"></a>
			</div>
			<div class="util-nav">

				<c:if test="${ empty member and empty emp }">
					<a href="/global/login">로그인</a>
					<a href="/member/regStep1">회원가입</a>
				</c:if>
				<c:if test="${ not empty member }">
					<a href="/global/logout">로그아웃</a>
					<a href="#">나의정보</a>
					<a href="#" class="btn-cart"> <i class="ico-cart"></i> 
					<span class="hidden">장바구니</span>
					</a>
				</c:if>

				<c:if test="${ not empty emp }">
					<a>관리자</a>
					<a href="/global/logout">로그아웃</a>
					<a href="#">1:1 문의</a>
				</c:if>

				<a href="#" class="lang">
					<div class="select-type2 language">
						<select id="select-type2">
							<option>KOR</option>
						</select>
					</div>
				</a>
			</div>
		</div>
	</div>

	<!-- main 1dep menu -->
	<div id="gnb" class="gnb-wrap">
		<div class="gnb-inner">
			<ul>
				<li class="active"><a href="#"><span>메뉴</span></a></li>
				<li><a href="#"><span>e-쿠폰</span></a></li>
				<li><a href="#"><span>상품권 선물</span></a></li>
				<li><a href="#"><span>이벤트&middot;제휴</span></a>
				</li>
				<li><a href="#"><span>매장검색</span></a></li>
			</ul>
			<a href="#" class="snb-more">더보기</a>
		</div>

		<div class="snb-wrap">
			<div class="inner-box">
				<div class="mnu-wrap">
					<div class="mnu-box">
						<a href="#">도미노 서비스</a>
						<ul>
							<li><a href="#">매니아 혜택</a></li>
							<li><a href="#">도미노 모멘트</a></li>
							<li><a href="#">퀵오더</a></li>
							<li><a href="#">단체주문 서비스</a></li>
						</ul>
					</div>
					<div class="mnu-box">
						<a href="#">고객센터</a>
						<ul>
							<li><a href="#">자주하는 질문</a></li>
							<li><a href="#">온라인 신문고</a></li>
						</ul>
					</div>
					<div class="mnu-box">
						<a href="#">회사소개</a>
						<ul>
							<li><a href="#">한국도미노피자</a></li>
							<li><a href="#">광고갤러리</a></li>
							<li><a href="#">사회공헌활동</a></li>
							<li><a href="#">가맹점 모집</a></li>
							<li><a href="#">인재채용</a></li>
						</ul>
					</div>
				</div>
				<div class="notice-box">
					<a href="/notice/newsList?type=N">공지사항</a>
					<ul>
						<li><a href="/notice/newsList?type=N">도미노뉴스</a></li>
						<li><a href="/notice/newsList?type=P">보도자료</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //main 1dep menu -->
</header>
<!-- //header -->