<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>게시글 제목</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<style>
.nav-item a {
	color: white !important;
}

.nav-item a.disabled {
	color: grey !important;
}
</style>
</head>
<body style="background-color: #242424; color: white">
	<div class="container">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="/board/lists">게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="#">${userName }</a></li>
			<c:if test="${userName eq null }">
				<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
			</c:if>
			<c:if test="${userName ne null }">
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</c:if>
		</ul>
		<table class="table">
			<tr>
				<th scope="col">글쓴이</th>
				<td>${view.writedid }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td>${view.title }</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>${view.content}</td>
			</tr>
			<tr>
				<th scope="row">조회수</th>
				<td>${view.hit }</td>
			</tr>
			<tr>
				<th scope="row">등록일</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value="${view.regdate}" /></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="2"><a href="/resources/upload/${view.filepath}">${fn:toUpperCase(view.filepath)}</a></td>
			</tr>
		</table>

		<div class="ma-t-1" style="margin-bottom: 20px">
			<c:if test="${rank eq 'Y' }">
				<input type="button" value="수정"
					onclick="location.href='modify?id=${view.content_id}'" class="f-l" />
				<input type="button" value="삭제"
					onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='boardDelete?id=${view.content_id}'"
					class="f-l" />
			</c:if>
			<input type="button" value="목록" onclick="location.href='lists'"
				class="f-r" />
		</div>

		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">글쓴이</th>
						<th scope="col">내용</th>
						<th scope="col">등록일</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<c:forEach var="co" items="${comment}">
					<tr id="${co.writedid}">
						<td scope="row">${co.writedid}</td>
						<td>${co.content}</td>
						<td scope="row"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${co.regdate}" /></td>
						<c:choose>
							<c:when test="${rank eq 'Y' or co.writedid eq userName}">
								<td><input type="button" value="삭제"
									onclick="location.href='commentDelete?id=${co.comment_id}'"></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
		</div>
		
				<div>
				<c:if test="${userName ne null}">
			<form action="" method="post" class="row row-cols-lg-auto g-3 align-items-center">
				<table>
					<tr>
						<td><input type="text" placeholder="댓글을 입력하세요."
							name="content"  style="width: 300px; height: 40px"/></td>
						<td><button type="submit" value=" 댓글저장" class="btn btn-light">저장</button></td>
					</tr>
				</table>
			</form>
				</c:if>
		</div>

	</div>
</body>
</html>