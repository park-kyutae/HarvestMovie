$(function() {
	'use strict'

	// Fetch all the forms we want to apply custom Bootstrap validation styles to
	var forms = document.querySelectorAll('.needs-validation')

	// Loop over them and prevent submission
	Array.prototype.slice.call(forms)
		.forEach(function(form) {
			form.addEventListener('submit', function(event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}

				form.classList.add('was-validated')
			}, false)
		})

	//이미지 미리 보기
	//처음 화면에 보여지는 이미지 읽기
	let photo_path = $('#my-photo').attr('src');
	let my_photo;
	$('#up_photo').change(function() {
		my_photo = this.files[0];
		if (!my_photo) {
			$('#my-photo').attr('src', photo_path);
			return;
		}

		//파일의 용량 체크
		if (my_photo.size > 1024 * 1024) {
			alert(Math.round(my_photo.size / 1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
			$('#my-photo').attr('src', photo_path);
			$(this).val('');
			return;
		}

		var reader = new FileReader();
		reader.readAsDataURL(my_photo);

		reader.onload = function() {
			$('#my-photo').attr('src', reader.result);
		}
	});//end of change
})