<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <div class="join-step1">
                        <div class="step-list">
                            <ul>
                                <li class="active">01 본인인증</li>
                                <li>02 개인정보입력</li>
                                <li>03 가입완료</li>
                            </ul>
                        </div>
                        <div class="info-text-wrap">
                            <a href="javascript:UI.layerPopUp({selId: '#pop-accredit'});" class="notice-text">본인인증 안내</a>
                            <strong class="title">반갑습니다.</strong>
                            <p>
				                                도미노피자 회원가입을 위해서는 본인인증이 필요합니다.<br>
				                                회원가입은 아동의 개인정보 보호를 위해 만 14세 이상만 가능합니다.
                            </p>
                            <div class="btn-wrap">
                                <a href="javascript:goCheckByPhone();" class="btn-type v4">휴대전화 인증</a>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>
</div>
<!-- //container -->
  <!-- 팝업 본인인증 안내 -->
<div class="pop-layer type2" id="pop-accredit">
    <div class="dim"></div>
    <div class="pop-wrap">
        <div class="pop-title-wrap">
            <h2 class="pop-title v2">본인인증 안내</h2>
        </div>
        <div class="pop-content">
            <div class="step-wrap">
                <div class="sub-type-text">만 14세 이상 회원가입 가능</div>
                <div class="sub-text">
			                    만 14세 미만 아동의 개인정보 보호를 위해 회원가입은
			                    만 14세 이상만 가능 합니다.
                    (단, 본인 명의의 금융거래가 있는 경우에 한하여 실명인증센터에 인증요청을 하실 수 있습니다.)
                </div>
            </div>
            <div class="step-wrap">
                <div class="sub-type-text">본인인증이란?</div>
                <div class="sub-text">
			                    도미노피자는 안전한 인터넷 서비스 이용을 위해 본인여부를
			                    확인하고 있습니다.
			                    인증대행사를 통해 본인인증을 받게 되므로,
			                    도미노피자에서는 회원님의 개인정보를 저장하지 않습니다.
                </div>
            </div>
        </div>
        <a href="#" class="btn-close"></a>
    </div>
</div>
<!--//팝업 본인인증 안내 -->

<form name="f" id="f" action="/member/regStep2" method="post">
	<input type="hidden"  id="name" name="name">
  	<input type="hidden"  id="tel2" name="tel2">
  	<input type="hidden"  id="tel3" name="tel3">
  	<input type="hidden"  id="rrn1" name="rrn1">
  	<input type="hidden"  id="rrn2" name="rrn2">
</form>

<script type="text/javascript">

//휴대폰 본인 인증
function goCheckByPhone() {
	window.open('/auth/phoneAuth', 'phoneAuth', 'width=500, height=450, left=700, top=0, toolbar=no, directories=no, scrollbars=no, resizable=no, status=no, menubar=no');
	return;
}

function nextStep(){ 
	$("#f").submit();
}

</script>