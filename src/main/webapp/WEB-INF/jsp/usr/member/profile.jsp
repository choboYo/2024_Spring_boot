<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="PROFILE" />
<%@ include file="../../common/head.jsp" %>

<section class="mt-8 text-lg">
		<div class="container mx-auto px-3">
			<div class="table-box-type">
				<table class="table table-lg">
					<tr>
						<th>이름</th>
						<td>${member.name }</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${member.updateDate.substring(2, 16) }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${member.loginId }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>${member.loginPw }</td>  <td><a href="/usr/member/loginPw" class="btn btn-active btn-sm">비밀번호 변경</a></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${member.cellphoneNum }</td>
					</tr>
				</table>
			</div>
			
			<div class="mt-3 text-sm">
				<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
