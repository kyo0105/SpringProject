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
							<li><a href="/notice/newsList?type=N">공지사항</a></li>
							<li><strong>${param.type eq 'N' ? '도미노뉴스' : '보도자료'}</strong></li>
						</ol>
					</div>
				</div>
				<article class="notice-area">
					<div class="menu-nav-wrap">
						<div class="menu-nav">
							<ul>
								<li><a href="/notice/newsList?type=N">도미노뉴스</a></li>
								<li><a href="/notice/newsList?type=P">보도자료</a></li>
								<c:if test="${not empty emp}">
									<li><a href="/notice/newsWrite?type=${param.type}">공지작성</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="notice-wrap">
						<form id="searchForm" name="searchForm" action="/notice/newsList?type=${param.type}" method="post">
							<div class="form-group srch-type">
								<div class="form-item">
									<div class="select-type2">
										<select id="searchCondition" name="searchCondition">
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="all">제목+내용</option>
										</select>
									</div>
								</div>
								<div class="form-item">
									<input type="text" id="searchWord" name="searchWord">
								</div>
								<div class="form-item">
									<button type="submit" class="btn-search" onclick="fncSearch();">검색</button>
								</div>
							</div>
							<div class="table-type3">
								<p class="side">총 ${pageBlock.totalRecords}건</p>
								<table>
									<caption>news</caption>
									<colgroup>
										<col style="width: 106px">
										<col>
										<col style="width: 333px">
										<col style="width: 110px">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>등록일</th>
											<th>조회</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty list}">
											<tr>
												<td colspan="4">등록된 게시글이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${not empty list}">
											<c:forEach items="${list}" var="dto">
												<tr>
													<td>${dto.seq}</td>
													<td><a href="#" onclick="noticeView('${dto.type}', '${dto.seq}', '${dto.notice_code}'); return false;"><p>${dto.title}</p></a></td>
													<td>${dto.notice_date}</td>
													<td>${dto.hits}</td>
												<tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
							<div class="pagination">
								<c:if test="${pageBlock.prev}">
									<a href="#" class="pager-first" onclick="noticePage(1); return false;">처음</a>&nbsp
                        			<a href="#" class="pager-prev" onclick="noticePage('${pageBlock.start - 1}'); return false;">이전</a>
								</c:if>
								<ol>
									<c:forEach begin="${pageBlock.start}" end="${pageBlock.end}" step="1" var="i">
										<li><c:if test="${i == pageBlock.currentPage}">
												<strong>${i}</strong>
											</c:if> 
											<c:if test="${i != pageBlock.currentPage}">
												<a href="#" onclick="noticePage('${i}'); return false;">${i}</a>
											</c:if></li>
									</c:forEach>
								</ol>
								<c:if test="${pageBlock.next}">
									<a href="#" onclick="noticePage('${pageBlock.end + 1}'); return false;">다음</a>&nbsp
									<a href="#" onclick="noticePage('${pageBlock.totalPages}'); return false;">마지막</a>
							    </c:if>
							</div>
						</form>
					</div>
				</article>
			</div>
		</div>
	</section>
</div>
<!-- //container -->

<script type="text/javascript">

// 활성된 메뉴
if('${param.type}' == 'N')	$(".menu-nav li").eq(0).addClass("active");
else						$(".menu-nav li").eq(1).addClass("active");

function fncSearch() {
	if($('#searchWord').val().isBlank()) {
		alert('검색어를 입력해주세요');
		return;
	}
	
	var pagingForm = $('#searchForm');
	
	pagingForm.append($('<input/>', {type: 'hidden', name: 'fSearchCondition', value: $("#searchCondition").val()}));
	pagingForm.append($('<input/>', {type: 'hidden', name: 'fSearchWord', value: $("#searchWord").val()}));
}

// 검색조건, 검색어 상태관리
$("#searchCondition").val("${empty param.searchCondition?'title':param.searchCondition}");
$("#searchWord").val("${param.searchWord}");

// 게시글 상세보기 POST
function noticeView(pType, pSeq, pNoticeCode){
	var ptotalRecords = '${pageBlock.totalRecords}';
	
	var viewForm = $('<form></form>');
	viewForm.attr('action', '/notice/newsView?notice_code=' + pNoticeCode);
	viewForm.attr('method', 'post');
	
	viewForm.append($('<input/>', {type: 'hidden', name: 'type', value: pType}));
	viewForm.append($('<input/>', {type: 'hidden', name: 'seq', value: pSeq}));
	viewForm.append($('<input/>', {type: 'hidden', name: 'totalRecords', value: ptotalRecords}));
	
	if ('${!empty param.fSearchCondition}') {
		viewForm.append($('<input/>', {type: 'hidden', name: 'searchCondition', value: '${param.fSearchCondition}'}));
		viewForm.append($('<input/>', {type: 'hidden', name: 'searchWord', value: '${param.fSearchWord}'}));
	}
	
	viewForm.appendTo('body');
	
	viewForm.submit();
}

// 페이징 파라미터 POST
function noticePage(pCurrentPage){
	var pagingForm = $('#searchForm');
	
	pagingForm.append($('<input/>', {type: 'hidden', name: 'currentPage', value: pCurrentPage}));
	pagingForm.append($('<input/>', {type: 'hidden', name: 'fSearchCondition', value: '${param.fSearchCondition}'}));
	pagingForm.append($('<input/>', {type: 'hidden', name: 'fSearchWord', value: '${param.fSearchWord}'}));
	
	pagingForm.submit();
}
</script>