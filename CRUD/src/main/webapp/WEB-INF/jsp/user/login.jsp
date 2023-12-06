<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
</head>
<body style="background-color: #242424; color: white;">
	<div class="container" style="width: 50vh; margin-top: 50px;">
		<form action="" method="post">
			<div class="mb-3">
				<label for="id" class="form-label">아이디</label> <input type="text"
					class="form-control" id="userId" name="userId" placeholder="Id" />
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호</label> <input
					type="password" class="form-control" id="userPass" name="userPass"
					placeholder="Password" />
			</div>
			<button type="submit" class="btn btn-light">로그인</button>
		</form>
		<button type="reset" class="btn btn-light"
			onclick="location.href='signup'"
			style="position: relative; left: 100px; bottom: 38px;">회원가입</button>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>