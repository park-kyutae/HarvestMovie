// Example starter JavaScript for disabling form submissions if there are invalid fields
$(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()


//
// $(function () {
//
//
//     // $.urlParam = function (name) {
//     //     varresults = newRegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
//     //     if (results == null) {
//     //         return null;
//     //     } else {
//     //         return results[1] || 0;
//     //     }
//     // }
//     //
//
//
//     $('#mv_trailer_btn').click(function () {
//         $('#show_mv_trailer').children().remove();
//
//         let mv_trailer = $('#mv_trailer').val().split(',');
//         for (let i = 0; i < mv_trailer.length; i++) {
//             $('#show_mv_trailer').append($('<iframe>').attr({
//                     width: "560",
//                     height: "315",
//                     src: "https://www.youtube.com/embed/" + mv_trailer[i],
//                     title: "YouTube video player",
//                     frameBorder: "0",
//                     allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
//                 }
//             ))
//
//         }
//
//     });
//
//     $('input[type="file"]').change(function () {
//
//         let img_id = '#'+this.getAttribute('name');
//
//         let origin_path = $(img_id).attr('src');
//         let pic = this.files[0];
//         if (pic.size > (1024*2) * 1024) {
//             alert(Math.round(poster.size / 1024) + 'kbytes(2MB까지만 업로드 가능)');
//             $(img_id).attr('src', origin_path);
//             $(this).val('');
//             return;
//         }
//         var reader = new FileReader();
//         reader.readAsDataURL(pic);
//
//         reader.onload = function () {
//             $(img_id).attr('src', reader.result);
//         }
//
//
//     })
//
//
//
// })