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
});