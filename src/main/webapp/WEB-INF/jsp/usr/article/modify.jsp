<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="pageTitle" value="MODIFY" />

<%@ include file="../../common/head.jsp" %>
	<section class="mt-8 text-lg">
		<div class="container mx-auto px-3">
			<form action="doModify" method="get">
				<div class="table-box-type">
					<table>
						<tr>
							<th>번호</th>
							<td>${article.id }</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${article.updateDate.substring(2, 16) }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${article.writerName }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" />${article.title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><input type="text" />${article.body }</td>
						</tr>
					</table>
				</div>
				<button>입력</button>
			</form>
		<div class="btns mt-3 text-sm">
				<button onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../../common/foot.jsp" %>