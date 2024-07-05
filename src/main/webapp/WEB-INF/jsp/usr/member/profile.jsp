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
						<td>${member.loginPw }</td>  <td><input type="button" id='btnOpen' class="btn btn-active btn-sm" value="비밀번호 변경"/></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${member.cellphoneNum }</td>
					</tr>
				</table>
			</div>
			
			<div id='modal'>
					<input type="text" name="check" />
				<form action="doProfile" type="Post">
					<div id='content' class="container pr-20">
						<input type='button' value='X' class="close" id='btnClose'/>
						<label>비밀번호를 입력하세요</label><br/>
						<input type='password' id='pwd' value='1234' />
						<input type='button' value='check' class="btn btn-active btn-sm" id='btnCheck' />
					</div>
				</form>
			</div>
			
			
			<div class="mt-3 text-sm">
				<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
	
	<script>
	var btnOpen  = document.getElementById('btnOpen');
	var btnCheck = document.getElementById('btnCheck');
	var btnClose = document.getElementById('btnClose');
	
	// modal 창을 감춤
	var closeRtn = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'none';
	}
	
	// modal 창을 보여줌
	btnOpen.onclick = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'block';
	}
	
	btnCheck.onclick = closeRtn;
	btnClose.onclick = closeRtn;
</script>
