$(function(){
	//좋아요 선택 여부와 선택한 총 개수 읽기
	function selectData(news_num){
		$.ajax({
			url:'newsGetFav.do',
			type:'post',
			data:{news_num:news_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				displayNewsFav(param);
			},
			error:function(){
				alert('네트워크 오류');
			}
		});
	}
	
	//좋아요 등록
	$('#output_fav').click(function(){
		$.ajax({
			url:'newsWriteFav.do',
			type:'post',
			data:{news_num:$('#news_num').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인 후 좋아요를 놀러주세요!');
				}else if(param.result == 'success'){
					displayNewsFav(param);
				}else{
					alert('등록시 오류 발생!');
				}
			},
			error:function(){
				alert('네트워크 오류!');
			}
		});
	});
	//좋아요 표시
	function displayNewsFav(param){
		let output;
		if(param.status == 'noFav'){
			output = '../images/heart1.svg';
		}else{
			output = '../images/heart2.svg';
		}
		//문서 객체에 추가
		$('#output_fav').attr('src',output);
		$('#output_fcount').text(param.count);
	}
	
	//초기 데이터 표시
	selectData($('#news_num').val());
	
});