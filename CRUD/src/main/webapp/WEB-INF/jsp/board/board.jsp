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
<title>Board</title>
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
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">등록일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="li" items="${list}">
					<tr>
						<th scope="row">${li.content_id}</th>
						<td><a href="/board/view?id=${li.content_id}"
							style="text-decoration: none;">${li.title}</a></td>
						<td>${li.writedid}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${li.regdate}" /></td>
						<td class="a-c">${li.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 변수선언 -->
		<c:set var="page" value="${empty param.page?1:param.page}"></c:set>
		<c:set var="startNum" value="${page-(page-1)%5}"></c:set>
		<c:set var="lastNum"
			value="${fn:substringBefore(Math.ceil(count/10),'.')}"></c:set>

		<nav aria-label="...">
			<ul class="pagination justify-content-center">
				<c:if test="${startNum > 1 }">
					<c:set var="startPage" value="page-item" />
				</c:if>
				<c:if test="${startNum <= 1 }">
					<c:set var="startPage" value="page-item disabled" />
				</c:if>
				<li class="${startPage}"><a class="page-link"
					href="?page=${startNum-1}&keyword=${param.keyword}&type=${param.type}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
				<c:forEach var="i" begin="0" end="4">
					<c:choose>
						<c:when test="${param.page==(startNum+i)}">
							<c:set var="currentPage" value="page-item active" />
						</c:when>
						<c:otherwise>
							<c:set var="currentPage" value="page-item" />
						</c:otherwise>
					</c:choose>
					<c:if test="${(startNum+i) <=lastNum }">
						<li class="${currentPage}" aria-current="page"><a
							class="page-link"
							href="?page=${startNum+i}&keyword=${param.keyword}&type=${param.type}">${startNum+i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${startNum+5 <= lastNum }">
					<c:set var="endPage" value="page-item" />
				</c:if>
				<c:if test="${startNum+5 >lastNum }">
					<c:set var="endPage" value="page-item disabled" />
				</c:if>
				<li class="${endPage}"><a class="page-link"
					href="?page=${startNum+5}&keyword=${param.keyword}&type=${param.type}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
		<c:if test="${userName eq null }">
			<c:set var="write" value="alert('로그인 해주세요')" />
		</c:if>
		<c:if test="${userName ne null }">
			<c:set var="write" value="window.location.href='/board/write'" />
		</c:if>
		<button type="button" class="btn btn-light float-end"
			onclick="${write}">글쓰기</button>

		<form class="row row-cols-lg-auto g-3 align-items-center" action=""
			method="get">
			<div class="col-12">
				<label class="visually-hidden" for="form-select">옵션</label> <select
					class="form-select" name="type" id="form-select">
					<option value="title">제목</option>
					<option value="writedid">글쓴이</option>
				</select>
			</div>
			<div class="col-12">
				<div class="input-group">
					<input type="text" class="form-control" name="keyword">
				</div>
			</div>
			<div class="col-12">
				<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>