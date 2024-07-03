<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE WRITE" />

<%@ include file="../../common/head.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css" />
<script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>

	<script>	
		const { Editor } = toastui;
		const { colorSyntax } = Editor.plugin;

		$(function(){
		  $('.toast-ui-editor').each(function(index, item) {
		    const items = $(item);

		    const editor = new Editor({
		      el: item,
		      height: '300px',
		      initialEditType: 'markdown',
		      previewStyle: 'tab',
		      plugins: [colorSyntax]
		    });

		    items.data('data-toast-editor', editor);
		  });
		});

		function submitForm(form){
		  const editorData = $(form).find('.toast-ui-editor').data('data-toast-editor');
		  const markdown = editorData.getMarkdown().trim();
		  form.title.value = form.title.value.trim();
		  
		  if (form.title.value.length == 0) {
				alert('제목을 입력해주세요');
				form.title.focus();
				return;
			}
		  
		  if(markdown.length == 0){
		    alert('내용을 입력해주세요');
		    editorData.focus();
		    return;
		  }

		  form.body.value = markdown;
		  
		  form.submit();
		}

	</script>

	<section class="mt-8 text-lg">
		<div class="container mx-auto px-3">
			<form action="doWrite" method="post" onsubmit="submitForm(this); return false;">
				<div class="w-9/12 mx-auto">
					<table class="table table-lg">
						<tr>
							<th>게시판</th>
							<td>
								<div class="flex">
									<div>
										<label class="flex items-center">
											<input class="radio radio-sm" type="radio" name="boardId" value="1" checked />
											&nbsp;&nbsp;공지사항
										</label>
									</div>
									<div class="w-20"></div>
									<div>
										<label class="flex items-center">
											<input class="radio radio-sm" type="radio" name="boardId" value="2" />
											&nbsp;&nbsp;자유
										</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="input input-bordered w-full max-w-xs" type="text" name="title" /></td>
						</tr>
						<tr>
							<th>내용</th>
							  <td><input type="text" name="body" /></td>
							  <td><div class="toast-ui-editor"></div></td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="btns flex justify-center">
									<button class="btn btn-active btn-wide">작성</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
			<div class="mt-3 text-sm">
				<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../../common/foot.jsp" %>