<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 뉴스 수정</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/news.js"></script>
<style type="text/css">
#label_text {
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="row d-flex justify-content-center">
				<div class="col col-sm my-5">
					<h4>영화 뉴스 작성</h4>
				</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col col-sm-9 my-4">
					<form class="row needs-validation" novalidate method="post"
						action="newsUpdate.do" enctype="multipart/form-data">
						<!-- 뉴스 제목 시작-->
						<div class="row my-2 d-flex justify-content-center">
							<div class="col col-sm ">
								<label for="news_title" class="form-label col-sm"
									id="label_text"> 뉴스 제목 </label> <input type="text"
									name="news_title" id="news_title" maxlength="50"
									class="form-control col-sm-7" placeholder="뉴스 제목 입력"
									onfocus="this.placeholder=''"
									onblur="this.placeholder='뉴스 제목 입력'" value="${news.news_title}"
									required>
								<div class="invalid-feedback">뉴스 제목을 입력해 주세요.</div>
							</div>
						</div>
						<!-- 뉴스 제목 끝 -->

						<!-- 뉴스 사진 시작-->
						<div class="row my-2 d-flex justify-content-center">
							<div class="col my-2 col-sm">
								<label for="news_photo" class="form-label col-sm-2"
									id="label_text"> 뉴스 사진 </label>
								<div class="row my-2 d-flex justify-content-center">
									<div class="col my-2 col-sm">
										<c:if test="${!empty news.news_photo}">
											<div class="pic">
												<img
													src="${pageContext.request.contextPath}/upload/${news.news_photo}"
													width="200px" height="200px" class="pic img-fluid"
													id="my-photo">
											</div>
										</c:if>
										<c:if test="${empty news.news_photo}">
											<div class="pic">
												<img
													src="${pageContext.request.contextPath}/images/blank.png"
													width="200px" height="200px" class="pic img-fluid"
													id="my-photo">
											</div>
										</c:if>
									</div>
								</div>
								<div class="row my-2 d-flex justify-content-center">
									<div class="col my-2 col-sm">
										<input type="file" accept="image/gif,image/jpeg"
											name="news_photo" class="form-control form-control-sm "
											required id="up_photo">
										<div class="invalid-feedback">사진을 첨부해 주세요.</div>
										<c:if test="${!empty news.news_photo}">
											<br>
											<span id="file_detail"> (${news.news_photo})파일이 등록되어
												있습니다. 다시 파일을 업로드하면 기r존 파일은 삭제됩니다. 
												<input type="button" value="파일삭제" id="file_del">
											</span>
											<script type="text/javascript">
					$(function(){
						//이벤트 연결
						$('#file_del').click(function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'newsDeleteFile.do',
									type:'post',
									data:{news_num:${news.news_num}},
									dataType:'json',
									cache:false,
									timeout:30000,
									success:function(param){
										if(param.result == 'logout'){
											alert('로그인 후 사용하세요!');
										}else if(param.result == 'success'){
											$('#file_detail').hide();
										}else if(param.result == 'wrongAccess'){
											alert('잘못된 접속입니다.');
										}else{
											alert('파일 삭제 오류 발생');
										}
									},
									error:function(){
										alert('네트워크 오류 발생');
									}
								});
							}
						});
					});
					</script>
										</c:if>
									</div>
								</div>
								<!-- 뉴스 사진 끝-->
								<!-- 뉴스 내용 시작-->
								<div class="row d-flex justify-content-center">
									<div class="col col-sm">
										<div class="row">
											<div class="col col-sm">
												<label for="news_content" class="form-label col-sm"
													id="label_text">뉴스 내용</label>
											</div>
										</div>
										<div class="row">
											<div class="col col-sm">
												<textarea rows="8" cols="30" name="news_content"
													id="news_content" class="form-control"
													aria-label="with textarea" placeholder="뉴스 내용 입력"
													onfocus="this.placeholder=''"
													onblur="this.placeholder='뉴스 내용 입력'" required>${news.news_content}</textarea>
												<div class="invalid-feedback">뉴스 내용을 입력해 주세요.</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 뉴스 내용 끝-->
							</div>
						</div>
						<div class="row">
							<div class="col d-flex justify-content-end">
								<div class="align-center">
									<input type="submit" value="수정"
										class="btn btn-primary btn-sm mx-2"> <input
										type="button" value="취소" onclick="location.href='newslist.do'"
										class="btn btn-dark btn-sm">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
