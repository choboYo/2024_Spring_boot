<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 데이지UI, 테일윈드 -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.8/dist/full.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 공통 css -->
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
</head>
<body>
	<div class="h-20 flex container mx-auto text-3xl">
		<div><a class="h-full px-3 flex items-center" href="/"><span>로고</span></a></div>
		<div class="grow"></div>
		<ul class="flex">
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/"><span>HOME</span></a></li>
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=1"><span>NOTICE</span></a></li>
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=2"><span>FREE</span></a></li>
				<c:if test="${rq.getLoginedMemberId() == 0 }">
					<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/login"><span>LOGIN</span></a></li>
				</c:if>
				
		  <c:if test="${rq.getLoginedMemberId() != 0 }">
			<div class="dropdown dropdown-end">
		      <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar mt-4 ml-5">
		        <div class="w-10 rounded-full">
		          <img 
		            alt="Tailwind CSS Navbar component"
		            src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.jpg" />
		        </div>
		      </div>
			     <ul tabindex="0" class="menu menu-sm dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow">
		        	<li>
		        		 <a class="justify-between" href="/usr/member/profile" >Profile
		        		<span class="badge">New</span>
		       			 </a>
		            </li>
		       		<li><a>Settings</a></li>
						<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/doLogout"><span>LOGOUT</span></a></li>
			    </ul>
		      </div>
		  	</c:if>		
		</ul>
	</div>
	
	<section class="my-3 text-2xl">
		<div class="container mx-auto px-3">
			<div>${pageTitle }</div>
		</div>
	</section>