<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title> 본인인증 </title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/domino/pc/css/common.css">
<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/d2CommonUtil.js?ver=1.5"></script>
	 
</head>
<body>
<div style="text-align:center; font-size: large; padding: 10px"><strong>본인인증</strong></div>
   <form name="auth_form" id="auth_form" style="padding: 10px; line-height: 30px">
      <dl>
         <dt class="center">이름</dt>
         <dd>
            <div class="form-item name">
               <input type="text" placeholder="이름을 입력하세요" id="name" name="name">
            </div>
         </dd>
      </dl>
      <dl>
         <dt class="top">전화번호</dt>
         <dd>
            <div class="form-group v2">
               <select name="tel_agency" id="tel_agency" title="휴대전화번호">
                  <option value="none">통신사</option>
                  <option value="skt">skt</option>
                  <option value="kt">kt</option>
                  <option value="lg">lg</option>
                  <option value="ss">알뜰폰</option>
               </select> <select name="tel1" id="tel1" title="휴대전화번호">
                  <option value="010">010</option>
               </select> 
               <input type="text" name="tel2" id="tel2" maxlength="4" class="i_text" title="휴대전화번호"> 
               <input type="text" name="tel3" id="tel3" maxlength="4" class="i_text" title="휴대전화번호">
            </div>
         </dd>
      </dl>
      <dl>
         <dt class="center">주민등록번호</dt>
         <dd>
            <div class="form-group v2">
                  <input type="text" name="rrn1" id="rrn1" maxlength="6" class="i_text" title="주민등록번호">
                  <span style="font-size: 30px; margin: 5px; padding: 2px;">-</span>
                  <input type="text" name="rrn2" id="rrn2" maxlength="1" class="i_text" title="주민등록번호">
                  <span style="font-size: 20px; margin: 5px; padding: 2px;">******</span>
               <br>
            </div>
         </dd>
      </dl>
      <br>
      <input type="button" onclick="javascript:goSubmit();" value="인증하기">
   </form>
<body>

<script type="text/javascript">

function goSubmit() {
	
	var name = $("#name").val();
	var tel_agency = $("#tel_agency").val();
	var tel1 = $("#tel1").val();
	var tel2 = $("#tel2").val();
	var tel3 = $("#tel3").val();
	var rrn1 = $("#rrn1").val();
	var rrn2 = $("#rrn2").val();
	
	
	if ( name.isBlank() ){
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return;
	}

	if ( tel_agency == "none" ){
		alert("통신사를 선택해주세요.");
		$("#tel_agency").focus();
		return;
	}

 	if ( tel2.isBlank() ){
 		alert("전화번호를 입력해주세요.");
		$("#tel2").focus();
		return;
	}
	
	if ( tel3.isBlank() ){
		alert("전화번호를 입력해주세요.");
		$("#tel3").focus();
		return;
	}
	
	if ( rrn1.isBlank() ){
		alert("주민번호를 입력해주세요.");
		$("#rrn1").focus();
		return;
	}
	
	if ( rrn2.isBlank() ){
		alert("주민번호를 입력해주세요.");
		$("#rrn2").focus();
		return;
	}

	var tel = [tel1, tel2, tel3].join('-');
	
	$.ajax({
		type:"POST",
		url:"/auth/phoneAuth",
		data:{"tel" : tel},
		dataType:"text",
		cache:false,
		success:function(data) {
			
				if (data == "success") {
					$("#name", window.opener.document).val(name);
					$("#tel2", window.opener.document).val(tel2);
					$("#tel3", window.opener.document).val(tel3);
					$("#rrn1", window.opener.document).val(rrn1);
					$("#rrn2", window.opener.document).val(rrn2);
					window.opener.nextStep();
					self.close();
				} else if (data == "fail") {
					window.opener.location.href = "/member/regStep1";
					alert("이미 회원가입이 되어있습니다.");
					self.close();
				}
				
		},
		error:function() {
			alert("에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.");
			$("#auth_form")[0].reset();
		}
		
	});
}
</script>