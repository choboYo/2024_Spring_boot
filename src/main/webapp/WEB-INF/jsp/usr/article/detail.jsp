<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL" />

<%@ include file="../../common/head.jsp" %>
<body>
	<section class="mt-6 text-lg">
		<div class="container mx-auto px-3">
			<div class="table-box-type">
				<table>
					<tbody>
						<c:set var="article" value="${foundArticle}"/>
						<tr>
							<td>번호</td>
							<td>${article.getId()}</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${article.getRegDate().substring(2, 16)}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>${article.getTitle()}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${article.getBody()}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${article.getWriterName()}</td>
						</tr>
					</tbody>
				</table>
				<div class="btn">
					<button onclick="history.back();">뒤로가기</button>
					
					<c:if test="${loginedMemberId == foundArticle.memberId}">
						<a href="modify?id=${foundArticle.id}">수정</a>
						<a href="delete?id=${foundArticle.id}">삭제</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	
	
</body>
<%@ include file="../../common/foot.jsp" %>