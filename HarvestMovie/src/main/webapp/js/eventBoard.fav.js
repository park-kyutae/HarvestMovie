$(function(){
	let status;
	
	//좋아요 수 읽기
	function selectData(event_board_num){
		$.ajax({
			url:'eventGetFav.do',
			type:'post',
			data:{event_board_num:event_board_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				displayFav(param);
			},
			error:function(){
				alert('네트워크 오류@');
			}
		});
	}
	//좋아요 등록
	$('#output_fav').click(function(){
		$.ajax({
			url:'eventWriteFav.do',
			type:'post',
			data:{event_board_num:$('#event_board_num').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인 후 좋아요를 눌러주세요!');
				}else if(param.result == 'success'){
					displayFav(param);
				}else{
					alert('등록시 오류 발생!@');
				}
			},
			error:function(){
				alert('네트워크 오류!');
			}
			
		});
	});
	//좋아요 표시
	function displayFav(param){
		let output;
		if(param.status =='noFav'){
			output = '../images/likes.png';
		}else{
			output = '../images/fav02.gif';
		}
		//문서 객체에 추가
		$('#output_fav').attr('src',output);
		$('#output_fcount').text(param.count);
	}
	//초기 데이터 표시
	selectData($('#event_board_num').val());
	
});