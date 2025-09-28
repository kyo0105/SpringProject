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
							<li>${param.type eq 'N' ? '도미노뉴스' : '보도자료'}</li>
						</ol>
					</div>
				</div>
				<article class="notice-area">
					<div class="menu-nav-wrap">
						<div class="menu-nav">
							<ul>
								<li><a href="/notice/newsList?type=N">도미노뉴스</a></li>
								<li><a href="/notice/newsList?type=P">보도자료</a></li>
								<c:forEach var="dto" items="${ list }">
									<c:if test="${ dto.seq eq param.seq }">
										<c:set var="vDto" value="${ dto }"></c:set>
									</c:if>
								</c:forEach>
								<c:if test="${ not empty emp }">									
								<li><a href="#" onclick="noticeEdit('${vDto.notice_code}'); return false;">공지수정</a></li>
								<li><a href="/notice/newsDelete?type=${param.type}&notice_code=${vDto.notice_code}">공지삭제</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="news-view">
						<form id="newsForm" name="newsForm" method="post">
							<dl class="news-content">                            
                            <dt><strong>${vDto.title}</strong>
                                <ul>
                                    <li>${vDto.notice_date}</li>
                                    <li>조회 <span>${vDto.hits}</span></li>
                                </ul>
                            </dt>
                            <dd>${vDto.content}</dd>
                            </dl>
                            
							<ul class="news-button">
							<c:set var="pSeq" value="${ param.seq }"></c:set>
								<li>
									<span>이전</span> 
									<c:if test="${ pSeq eq 1 }"> 이전 글이 존재하지 않습니다</c:if> 
									<c:forEach var="dto" items="${ list }">
										<c:if test="${ dto.seq eq pSeq - 1  }">
											<a href="#" onclick="noticeView('${dto.seq}', '${dto.notice_code}'); return false;">${dto.title}</a>
										</c:if>
									</c:forEach>
								</li>
								<li>
									<span>다음</span> 
									<c:if test="${ pSeq eq param.totalRecords }"> 다음 글이 존재하지 않습니다</c:if> 
									<c:forEach var="dto" items="${ list }">
										<c:if test="${ dto.seq eq pSeq + 1  }">
											<a href="#" onclick="noticeView('${dto.seq}', '${dto.notice_code}'); return false;">${dto.title}</a>
										</c:if>
									</c:forEach>
								</li>
							</ul>
						</form>
					</div>
					<div class="btn-wrap">
						<a href="#" class="btn-type v2" onclick="noticeList(); return false;">목록</a>
					</div>
				</article>
			</div>
		</div>
	</section>
</div>
<!-- //container -->

<script type="text/javascript">

// 활성화된 메뉴
if('${param.type}' == 'N') $(".menu-nav li").eq(0).addClass("active");
else 					 $(".menu-nav li").eq(1).addClass("active");

// 게시글 상세보기 이동
function noticeView(pSeq, pNoticeCode){
	var pType = '${param.type}';
	var ptotalRecords = '${param.totalRecords}';

	var viewForm = $('<form></form>');
	viewForm.attr('action', '/notice/newsView?notice_code=' + pNoticeCode);
	viewForm.attr('method', 'post');
	
	viewForm.append($('<input/>', {type: 'hidden', name: 'type', value: pType}));
	viewForm.append($('<input/>', {type: 'hidden', name: 'seq', value: pSeq}));
	viewForm.append($('<input/>', {type: 'hidden', name: 'totalRecords', value: ptotalRecords}));
	
	if ('${!empty param.searchCondition}') {
		viewForm.append($('<input/>', {type: 'hidden', name: 'searchCondition', value: '${param.searchCondition}'}));
		viewForm.append($('<input/>', {type: 'hidden', name: 'searchWord', value: '${param.searchWord}'}));
	}
	
	viewForm.appendTo('body');
	
	viewForm.submit();
}

// 게시글 수정 이동
function noticeEdit(pNotice_code){
	location.href = '/notice/newsEdit?type=' + '${param.type}' + '&notice_code=' + pNotice_code + '&seq=' + '${param.seq}' +
					'&searchCondition=' + '${param.searchCondition}' + '&searchWord=' + 
					'${param.searchWord}' + '&totalRecords=' + '${param.totalRecords}';
}

// 게시글 목록 이동 
function noticeList(){
	var listForm = $('<form></form>');
	listForm.attr('action', '/notice/newsList?type=' + '${param.type}');
	listForm.attr('method', 'post');

	listForm.append($('<input/>', {type: 'hidden', name: 'currentPage', value: '${currentPage}'}));	
	listForm.append($('<input/>', {type: 'hidden', name: 'searchCondition', value: '${param.searchCondition}'}));
	listForm.append($('<input/>', {type: 'hidden', name: 'fSearchCondition', value: '${param.searchCondition}'}));
	listForm.append($('<input/>', {type: 'hidden', name: 'searchWord', value: '${param.searchWord}'}));
	listForm.append($('<input/>', {type: 'hidden', name: 'fSearchWord', value: '${param.searchWord}'}));
	
	listForm.appendTo('body');
	
	listForm.submit();
}
</script>