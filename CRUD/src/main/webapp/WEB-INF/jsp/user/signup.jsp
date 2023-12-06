<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SignUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${root }/resources/js/signUp.js"></script>
</head>
<body style="background-color: #242424; color: white;">
    <div class="container" style="width: 50vh; margin-top: 50px;">
        <form action="" method="post" onsubmit="return createFrom(this)">
            <div class="row mb-3">
                <label for="userId" class="col-sm-3 col-form-label">아이디</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 넣어주세요">
                    <button type="button" onclick="idCheck()" class="btn btn-light" style="" >확인</button>
                </div>
            </div>
            <div class="row mb-3">
                <label for="userPass" class="col-sm-5 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="userPass" name="userPass" placeholder="비밀번호 (8자리 이상)">
                </div>
            </div>
            <div class="row mb-3">
                <label for="password2" class="col-sm-5 col-form-label">비밀번호 확인</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password2" name="password2">
                </div>
            </div>
            <div class="row mb-3">
                <label for="userName" class="col-sm-3 col-form-label">이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 넣어주세요">
                </div>
            </div>
            <div class="row mb-3">
                <label for="userEmail" class="col-sm-3 col-form-label">이메일</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="사용하실 이메일을 넣어주세요">
                </div>
            </div>
            <fieldset class="row mb-3">
                <legend class="col-form-label col-sm-3 pt-0">성별</legend>
                <div class="col-sm-10">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="M" id="radio1" checked>
                        <label class="form-check-label" for="radio1">
                            남자
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="F" id="radio2">
                        <label class="form-check-label" for= "radio2">
                            여자
                        </label>
                    </div>
                </div>
            </fieldset>
            <button type="submit" class="btn btn-light">가입</button>
        </form>
        <button type="reset" class="btn btn-light" onclick="location.href='login'" style="position: relative; left: 100px; bottom: 38px;">취소</button>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>