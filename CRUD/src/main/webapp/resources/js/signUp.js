function createFrom(obj) {
	if (obj.userId.value == "") {
		alert("아이디를 반드시 입력하세요.");
		obj.id.focus();
		return false;
	}

	if (obj.userPass.value == "") {
		alert("비밀번호를 반드시 입력하세요.");
		obj.password.focus();
		return false;
	}

	if (obj.userPass.value.length < 7) {
		alert("비밀번호는 7글자 이상으로 만들어주세요.");
		obj.password.focus();
		return false;
	}

	if (obj.password2.value == "") {
		alert("비밀번호 확인란에 입력해주세요.");
		obj.passwordCheck.focus();
		return false;
	}

	if (obj.userPass.value != obj.password2.value) {
		alert("입력하신 비밀번호가 같지 않습니다.");
		obj.passwordCheck.focus();
		return false;
	}

	if (obj.userName.value == "") {
		alert("이름을 반드시 입력하세요.");
		obj.name.focus();
		return false;
	}

	if (obj.userEmail.value == "") {
		alert("이메일을 입력하세요.");
		obj.email.focus();
		return false;
	}
}
function idCheck() {
	let id = $("#userId").val();

	$.ajax({
		type: "POST",
		url: "/idCheck",
		data: { userId: id },
		success: function(result) {
			if (result == '0') {
				alert("사용 가능한 ID 입니다.")
			} else {
				alert("이미 사용중인 ID 입니다.")
			}
		}
	})
}