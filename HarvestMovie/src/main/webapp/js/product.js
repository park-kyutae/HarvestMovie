$(function(){
	//==================상품추가 시작===============//
	$('#insertProduct_form').submit(function(){
		if($('#pd_name').val().trim()==''){
			alert('상품명을 입력해주셈~');
			$('#pd_name').val('').focus();
			return false;
		}
		if($('#pd_price').val().trim()==''){
			alert('가격을 입력해주셈~');
			$('#pd_price').val('').focus();
			return false;
		}
		if($('#pd_quantity').val().trim()==''){
			alert('수량을 입력해주셈~');
			$('#pd_quantity').val('').focus();
			return false;
		}
		if($('#pd_content').val().trim()==''){
			alert('소개글을 입력해주셈~');
			$('#pd_content').val('').focus();
			return false;
		}
	});
	//==================상품추가 끝 ===============//
	$('#productUpdate_form').submit(function(){
		if($('#pd_name').val().trim()==''){
			alert('상품명을 입력해주셈~');
			$('#pd_name').val('').focus();
			return false;
		}
		if($('#pd_price').val().trim()==''){
			alert('가격을 입력해주셈~');
			$('#pd_price').val('').focus();
			return false;
		}
		if($('#pd_quantity').val().trim()==''){
			alert('수량을 입력해주셈~');
			$('#pd_quantity').val('').focus();
			return false;
		}
		if($('#pd_content').val().trim()==''){
			alert('소개글을 입력해주셈~');
			$('#pd_content').val('').focus();
			return false;
		}
	});
	
	//
	$('#btn-order').on('click', function() {
		if(confirm("구매하시겠습니까?")){
			const data = {
				'pd_num': $('#pd_num').val()
			}
			/*$.ajax({
				url: 'ProductCheck.do',
				method: 'post',
			})*/
			$.ajax({
				url: 'ProductOrder.do',
				method: 'post',
				dataType: 'json',
				
				data: data,
				cache: false,
	            timeout: 30000
			}).done(function(param) {
				     if (param.isSucess == 'false') {
	                    alert('오류 발생');
	                } else {
	                    alert('구매성공!@!@!@!');
	                    location.reload();
	
	                }
			}).fail(function(error) {
				console.log(JSON.stringify(error));
			});
		}else{
			return false;
		}
	});
	
	$('#btn-disable').on('click', function() {
		alert('수량이 없습니다.');
	})
});