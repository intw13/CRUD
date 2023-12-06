<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판</title>
    <script
      type="text/javascript"
      src="//code.jquery.com/jquery-3.6.0.min.js"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <script src="${root }/resources/js/summernote-lite.js"></script>
    <script src="${root }/resources/js/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${root }/resources/css/summernote-lite.css" />
    <style>
      .nav-item a {
        color: white !important;
      }
      .nav-item a.disabled {
        color: grey !important;
      }
    </style>
    <script>
      $(document).ready(function () {
        $(".summernote").summernote({
          minHeight: 300,
          maxHeight: 300,
          lang: "ko-KR",
        });
      });
    </script>
  </head>
  <body style="background-color: #242424; color: white">
    <div class="container">
      <ul class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">게시판</a>
        </li>
   		<li class="nav-item"><a class="nav-link" href="#">${userName }</a></li>
			<c:if test="${userName eq null }">
				<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
			</c:if>
			<c:if test="${userName ne null }">
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</c:if>
      </ul>
      <form action="" method="post" enctype="multipart/form-data">
        <table class="table">
          <tbody>
            <tr>
              <th scope="col">제목</th>
              <td><input type="text" style="border: none; background: transparent; width:500px"name="title"/></td>
            </tr>
            <tr>
              <th scope="row">글내용</th>
              <td>
                <textarea
                  class="summernote"
                  style="width: 100%; height: 300px"
                  class="form-control"
                  rows="3"
                  name="content"
                ></textarea>
              </td>
            </tr>
            <tr>
              <th>업로드</th>
              <td colspan="2"><input type="file" name="uploadFile" /></td>
            </tr>
          </tbody>
        </table>
        <button type="submit" class="btn btn-light">저장</button>
        <button type="button" class="btn btn-light" onclick="history.back()">
          취소
        </button>
        <button type="button" class="btn btn-light" onclick="location.href='/'">목록</button>
      </form>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </body>
</html>