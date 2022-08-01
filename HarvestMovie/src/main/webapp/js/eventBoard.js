$(function(){
	//=============게시판 글쓰기============//
	$('#write_form').submit(function(){
		if($('#event_title').val().trim()==''){
			alert('제목을 입력하세요!');
			$('#event_title').val('').focus();
			return false;
		}
		if($('#event_content').val().trim()==''){
			alert('내용을 입력하세요!');
			$('#event_content').val('').focus();
			return false;
		}
	});
	
	//=============목록 검색창============//
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});
});





