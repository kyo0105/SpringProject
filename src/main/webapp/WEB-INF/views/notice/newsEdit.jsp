<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- container -->
<div id="container">
    <section id="content">
        <div class="sub-type notice">
            <div class="inner-box">
                <div class="page-title-wrap">
                    <h2 class="page-title">공지사항</h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/">홈</a></li>
                            <li>공지사항</li>
                            <li>도미노뉴스</li>
                        </ol>
                    </div>
                </div>
                <article class="notice-area">
                    <div class="menu-nav-wrap">
                        <div class="menu-nav">
                            <ul>
                                <li><a href="/notice/newsList?type=N">도미노뉴스</a></li>
                                <li><a href="/notice/newsList?type=P">보도자료</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="news-view">
                    <form id="newsForm" name="newsForm" action="/notice/newsEdit" method="post" >
                    	<input type="hidden" id="emp_id" name="emp_id" value="${ emp.getEmp_id() }">
                    	<input type="hidden" id="type" name="type" value="${ param.type }">
                    	<input type="hidden" id="notice_code" name="notice_code" value="${ param.notice_code }">
                    	<input type="hidden" id="seq" name="seq" value="${ param.seq }">
                    	<input type="hidden" id="searchCondition" name="searchCondition" value="${ param.searchCondition }">
                    	<input type="hidden" id="searchWord" name="searchWord" value="${ param.searchWord }">
                    	<input type="hidden" id="totalRecords" name="totalRecords" value="${ param.totalRecords }">
                    	
                        <dl class="news-content">                            
                            <dt>
                            	<input type="text" autofocus="autofocus" id="title" name="title" value="${ vo.title }">
                            </dt>
                            <dd>
								<textarea id="content" name="content">${ vo.content }</textarea>
                            </dd>
                        </dl>
                        <input type="submit" value="수정완료">
                    </form>
                    </div>	
                </article>
            </div>
        </div>
    </section>
</div>
<!-- //container -->

<script type="text/javascript">

$(".menu-nav li").removeClass("active");
if('${param.type}' == 'N') $(".menu-nav li").first().addClass("active");
else $(".menu-nav li").eq(1).addClass("active");
</script>