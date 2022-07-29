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
	
	//=============상품 주문================//
	$('#btn-order').on('click', function() {
		if(confirm("구매하시겠습니까?")){
			const data = {
				'pd_num': $('#pd_num').val()
			}
			$.ajax({
				url: 'checkOrder.do',
				method: 'post',
				dataType: 'json',
				data: data,
				cache: false,
	            timeout: 30000
			}).done(function(param) {
				     if (param.isSuccess =='false') {
	                    alert('1인당 1개만 구매할 수 있습니다.');
	                } else {
						$.ajax({
							url: 'ProductOrder.do',
							method: 'post',
							dataType: 'json',
							data: data,
							cache: false,
	            			timeout: 30000
						}).done(function(param) {
				     		if (param.isSuccess == 'false') {
	                    		alert('오류 발생');
	                		} else {
	                    		alert('구매에 성공하셨습니다.');
	                    		location.reload();
	                		}
						}).fail(function(error) {
							console.log(JSON.stringify(error));
						});
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
	
	//================= 주문 취소 ==========//
	$('.btn-cancel').on('click', function(){
		if(confirm('주문을 취소하시겠습니까?')){
			alert($('#pd_num').val());
			alert($(this).data('ord'));
			const data = {
				'pd_num': $('#pd_num').val(),
				'ord_num':$(this).data('ord')
			}
			$.ajax({
				url:'orderCancel.do',
				method:'post',
				data:data,
				dataType:'json',
				cache:false,
				timeoust:30000
			}).done(function(param){
				if(param.isSuccess == 'false'){
					alert('오류발생!@');
				}else{
					alert('주문취소에 성공했습니다.');
					location.reload();
				}
				
			}).fail(function(error) {
				console.log(JSON.stringify(error));
			});
			
			
		}else{
			return false;
		}
	});
	
	//================= 주문 취소 ==========//
});