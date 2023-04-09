/**
 * 아이디 중복체크
 */
function idCheck(id) {
	
	if ($('#id').val() == ""){
		$("#id_alert").text("아이디를 입력해 주세요.");
		$('#id_alert').show();
		$('#id').focus();
		return;
	}

	if (!isValid($('#id').val())) {
		$("#idDupChk").val("N");
		$("#id").focus();
		return;
	}

	$.ajax({
		type:"POST",
		url:"/auth/idChkAjax",
		data:{"id" : id.val()},
		dataType:"json",
		cache:false,
		success:function(data) {
			
				if(data.status == "success") {
					$('#id_alert').text("사용 가능한 아이디입니다.");
					$('#id_alert').show();
					$('#idDupChk').val(data.msg);
				} else if (data.status == "fail") {
					$('#id_alert').text("이미 사용중인 아이디입니다.\n다른 아이디를 입력해주세요.");
					$('#id_alert').show();
					$('#idDupChk').val("N");
				}
				 
		},
		error:function() {
			alert("에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.");
			$('#id').val("");
			$('#id_alert').text("");
			$("#id_alert").hide();
			$('#id').focus();
			$('#idDupChk').val("N");
		}
		
	});

}


/**
 * 아이디 유효성 체크
 */
function isValid(userid){	
	
	if (userid.length < 4 || userid.length > 16){
		$("#id_alert").text("이용자ID의 길이는 4 ~ 16자 입니다.");
		$('#id_alert').show();
		return false;
	}
	
	let idRegExp = /^[a-z]/;
	
	if (!idRegExp.test(userid)) {
		$("#id_alert").text("이용자ID의 첫글자는 영문자만 가능합니다.");
		$('#id_alert').show();
		return false;
	}
	
	idRegExp = /^[a-zA-Z\d_]*$/; 
	
	if (!idRegExp.test(userid)){
		$("#id_alert").text("이용자ID는 영문, 숫자, '_'만 가능합니다.");
		$('#id_alert').show();
		return false;
	}
	
		return true;	
}

/**
 * 비밀번호 유효성 체크
 */
function isPwd(passwd){
	
	if (passwd.length >= 8 && passwd.length <= 16){
		
		let pwdRegExp = /^(?=.*[a-zA-Z])(?=.*[\d])(?=.*[~!@#$%^&*_])[a-zA-Z\d~!@#$%^&*_]{8,16}$/;
		
		if(!pwdRegExp.test(passwd)) {
			$("#passwd_alert").text("비밀번호는 1개 이상의 영문/숫자/특수문자(~!@#$%^&*_) 조합으로만 가능합니다.");
			$("#passwd_alert").show();
			return false;
		} else if (/(\w|[~!@#$%^&*_])\1\1/.test(passwd)) {
			$("#passwd_alert").text("동일문자를 3번 이상 반복되게 사용할 수 없습니다.");
			$("#passwd_alert").show();
        	return false;
		} 
		
		let passCnt1 = 0;
		let passCnt2 = 0;
		
		let passTemp1 = "";
		let passTemp2 = "";
		let passTemp3 = "";
		
		for (let i = 0; i < passwd.length - 2; i++){			
			passTemp1 = passwd.charAt(i);
			passTemp2 = passwd.charAt(i + 1);
			passTemp3 = passwd.charAt(i + 2);
			
			if (passTemp1.charCodeAt(0) - passTemp2.charCodeAt(0) === 1 && passTemp2.charCodeAt(0) - passTemp3.charCodeAt(0) === 1)	passCnt1 += 1;
			else if (passTemp1.charCodeAt(0) - passTemp2.charCodeAt(0) === -1 && passTemp2.charCodeAt(0) - passTemp3.charCodeAt(0) === -1)	passCnt2 += 1;
		}
		
		if (passCnt1 + passCnt2 > 0){
			$("#passwd_alert").text("연속된 문자열(123 또는 321, abc, cba, #$%, %$# 등)을 3자 이상 사용 할 수 없습니다.");
			$("#passwd_alert").show();
        	return false;
		}
		
		return true;
		
	} else {
		$("#passwd_alert").text("비밀번호의 길이는 8 ~ 16자 입니다.");
		$("#passwd_alert").show();
		return false;
	}
	
}

/**
 * 이메일 셀렉박스
 */
function checkEmailState(obj, obj2) {
	if (obj.val() == "WRITE") {
		obj2.attr("readOnly", false);
		obj2.attr("disabled", false);
		obj2.val('');
	} else {
		obj2.val(obj.val());
		obj2.attr("readOnly", true);
	}
}

/**
 * 이메일 체크
 */
function doCheckEmail(){
	if($('#email1').val() == "" || $('#email2').val() == ""){
		$('#email1').focus();
		$("#email_alert").text("이메일을 입력해 주세요.");
		$("#email_alert").show();
		return;
	}else{
		$('#email').val($('#email1').val() + '@' + $('#email2').val());
	}
	
	//이메일 정규식 체크
	let emailRegExp = /^\w([-.]?\w)*@[a-zA-Z\d]+.[a-zA-Z]{2,3}$/i;
	if(!emailRegExp.test($('#email').val())){
		$('#email1').focus();
		$("#email_alert").text("이메일을 올바르게 입력해 주세요.");
		$("#email_alert").show();
		return;
	}
	
	// 이메일 중복 확인
	$.ajax({
		type:"POST",
		url:"/auth/emailChkAjax",
		data:{email : $('#email').val()},
		dataType:"json",
		cache:false,
		success:function(data) {
			
				if(data.status == "fail") {
					$("#email_alert").text("이미 사용중인 이메일입니다. 다른 이메일을 입력해주세요.");
					$("#email_alert").show();
				} else {
					$("#email_alert").text("사용 가능한 이메일입니다.");
					$("#email_alert").show();
					$("#emailChk").val("Y");
				}
				
		},
		error:function() {
			alert("에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.");
			$("#email1").val("");
			$("#email2").val("");
			checkEmailState($("#email3").val("WRITE"), $("#email2"));
			$("#email").val("");
			$("#email_alert").text("");
			$("#email_alert").hide();
			$('#email1').focus();
		}
		
	});
}

//회원가입
function goInsert() {
	reset();

	if ($('#id').val() == ""){
		$("#id_alert").text("아이디를 입력해 주세요.");
		$("#id_alert").show();
		$('#id').focus();
		return;
	}
	if (!isValid($('#id').val())) {
		$("#idDupChk").val("");
		$("#id").focus();
		return;
	}
	if ($("#idDupChk").val() != $("#id").val()) {
		$("#id_alert").text("아이디 중복확인 해주세요.");
		$("#id_alert").show();
		$("#id").focus();
		return;
	}

	if ($('#passwd').val() == ""){
		$("#passwd_alert").text("비밀번호를 입력해 주세요.");
		$("#passwd_alert").show();
		$('#passwd').focus();
	}
	if (!isPwd($("#passwd").val())) {
		$("#passwd").focus();
		return;
	}
	if ($('#passwd').val() != $('#confirmpw').val()) {
		$("#confirmpw_alert").text('비밀번호가 일치하지 않습니다.');
		$("#confirmpw_alert").show();
		$("#confirmpw").focus();
		return;
	}
	
	if($('#email1').val() == "" || $('#email2').val() == ""){
		$('#email1').focus();
		$("#email_alert").text("이메일을 입력해 주세요.");
		$("#email_alert").show();
		return;
	}else{
		$('#email').val($('#email1').val() + '@' + $('#email2').val());
	}

	//이메일 정규식 체크
	let emailRegExp = /^\w([-.]?\w)*@[a-zA-Z\d]+.[a-zA-Z]{2,3}$/i;
	if(!emailRegExp.test($('#email').val())){
		alert('이메일을 올바르게 입력해 주세요.');
		$('#email1').focus();
		return;
	}
	
	if($("#email").val().length > 50){
		alert('이메일을 50자 미만으로 작성해주세요.');
		$('#email1').focus();
		return;
	}
	
	if($("#emailChk").val() != "Y"){
		$('#email1').focus();
		$("#email_alert").text("이메일 중복확인을 해주세요.");
		$("#email_alert").show();
		return;
	}
	
	if ($("#chk_dm_fl").prop("checked")) $("#dm_fl").val("1");
	if ($("#chk_o_dm_fl").prop("checked")) $("#o_dm_fl").val("1");
	if ($("#chk_ds_fl").prop("checked")) $("#ds_fl").val("1");
	
	var agreeOption1 = $("input[name=agree_1]:checked").val();
	var agreeOption2 = $("input[name=agree_2]:checked").val();
	var locationOption = $("input[name=location_yn]:checked").val();
	if (agreeOption1 != "Y"  || agreeOption2 != "Y" || locationOption != "Y" ) {
		alert('회원가입은 개인정보 수집, 이용약관, 위치기반 서비스 약관에 동의하셔야 가능합니다.');
		return;
	}
	
	//공백제거
	$('#id').val($("#id").val().replace(/ /g, ''));
	$('#email1').val($("#email1").val().replace(/ /g, ''));
	$("#frm :input").prop("disabled", false);
	$('#frm').submit();
}

//알럿 메시지 reset
function reset(){
	$("#passwd_alert").text("");
	$("#confirmpw_alert").text("");
	$("#birth_alert").text("");
	$("#tel_alert").text("");
	$("#email_alert").text("");
	$("#security_alert").text("");
	$("#gender_alert").text("");
	$("#id_alert").text("");
	
	$("#passwd_alert").hide();
	$("#confirmpw_alert").hide();
	$("#birth_alert").hide();
	$("#tel_alert").hide();
	$("#email_alert").hide();
	$("#security_alert").hide();
	$("#gender_alert").hide();
	$("#id_alert").hide();
	
}
