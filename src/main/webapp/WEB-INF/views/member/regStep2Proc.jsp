<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- container -->
<div id="container">
    <section id="content">
        <div class="sub-type member">
            <div class="inner-box">
                <div class="page-title-wrap v2">
                    <h2 class="page-title">회원가입</h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/">홈</a></li>
                            <li><strong>회원가입</strong></li>
                        </ol>
                    </div>
                </div>
                <article class="join-area">
                    <div class="join-step3">
                        <div class="step-list">
                            <ul>
                                <li>01 본인인증</li>
                                <li>02 개인정보입력</li>
                                <li class="active">03 가입완료</li>
                            </ul>
                        </div>
                        <div class="info-text-wrap">
                            <strong class="title">WELCOME TO<br>
                                DOMINO’S PIZZA!
                            </strong>
                            <p>
                                <span>
                                    <c:out value="${ param.name }"/> 고객님, 도미노피자 회원이 되신 것을 환영합니다.
                                </span>
                            </p>
                            <p class="sub-txt">
                                로그인 후 쿠폰함으로 제공된 선물을 확인하세요!
                            </p>
                            <div class="btn-wrap">
                                <a href="/" class="btn-type v4">HOME</a>
                                <a href="/global/login" class="btn-type v6">로그인</a>
                            </div>
                        </div>
						</div>
                </article>
            </div>
        </div>
    </section>
</div>
<!-- //container -->