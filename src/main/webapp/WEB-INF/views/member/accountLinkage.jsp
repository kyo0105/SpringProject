<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- container -->
<div id="container">
	<section id="content">
		<div class="sub-type member">
			<div class="inner-box">
				<div class="page-title-wrap v2">
					<h2 class="page-title">도미노피자 아이디 연결  </h2>
				</div>
				<article class="join-area">
					<div class="join-confirm">
								<h3 class="title-type">이미 가입되어있는 회원정보입니다.</h3>
								<p class="desc">동일한 정보로 추가 회원가입 하실 수 없습니다.</p>
							<div class="result-list">
							<dl>
								   <dt>
								       <div class="chk-box">
								           <label for="id">${ snsInfo.get('member_id') }</label>
								       </div>
								   </dt>
								   <dd>
								       <div>가입 : ${ snsInfo.get('join_date') }</div>
								   </dd>
								</dl>
							</div>
						<div id="memberBlock" style="">
							<p class="sub">
								${ snsInfo.get('sns_name') }
								계정과 자동으로 연결을 원하시면 비밀번호 입력해주세요.</p>
							<div class="form-item">
								<input type="password" id="pop_passwd" value="" onkeydown="javascript:if(event.keyCode==13){connection(); return false;}" placeholder="비밀번호">
							</div>
							<div class="btn-wrap">
								<a href="javascript:connection();" class="btn-type1">자동 연결</a>
							</div>
						</div>						
						<div class="sub-text">
							비밀번호가 생각나지 않으세요?
							<a href="#none">비밀번호 찾기</a>
						</div>
					</div>
				</article>
			</div>
		</div>
	</section>
</div>

<script type="text/javascript">

function connection(){
	
	if($("#pop_passwd").val() == ""){
		alert("비밀번호를 입력해주세요.");
		$("#pop_passwd").focus();
		return;
	}
	
	$.ajax({
		type : "POST",
		url : "/member/accountLinkage",
		data : {"passwd" : $('#pop_passwd').val()},
		dataType : "text",
		cache : false,
		success : function(data) {
			
			if (data == "success") {
				location.href = "/";
			} else if (data == "fail") {
				alert("비밀번호가 일치하지 않습니다.");
			}
		},
		error:function(){
			alert("다시 시도해주세요. 같은 현상이 반복되면 관리자에게 문의바랍니다.");
		}
		
	});
	
}

</script>