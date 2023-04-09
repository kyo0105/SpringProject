// 로그인 ajax
function doLogin() {
	
	var id = $('#id').val(); 
	var passwd = $('#passwd').val();
	var cid = $('input#idcheck').val();
			
	if (id.isBlank()){
		alert("아이디를 입력해주세요.");
		$('#id').focus();
		return;
	}
	if (passwd.isBlank()){
		alert("비밀번호를 입력해주세요.");
		$('#passwd').focus();
		return;
	}
	
	var data = {"id" : id, "passwd" : passwd, "cid" : cid};
	
	$.ajax({
		type:"POST",
		url:"/global/login",
		data:data,
		dataType:"text",
		cache:false,
		success:function(data) {
			
			if (data == "success"){
				location.href = "/";
			} else if (data == "fail") {
				alert("아이디 또는 비밀번호가 틀렸습니다.");
			} else {
				alert(data + " 간편 로그인 연동 회원입니다.");
			}
		
		},
		error:function() {
			alert("에러가 발생하였습니다. 같은 현상이 반복되면 관리자에게 문의바랍니다.");
			$('#passwd').val('');
		}
		
	});
		
}