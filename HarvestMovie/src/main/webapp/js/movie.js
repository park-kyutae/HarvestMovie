$(function () {


    // $.urlParam = function (name) {
    //     varresults = newRegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    //     if (results == null) {
    //         return null;
    //     } else {
    //         return results[1] || 0;
    //     }
    // }
    //


    $('#mv_trailer_btn').click(function () {
        $('#show_mv_trailer').children().remove();

        let mv_trailer = $('#mv_trailer').val().split(',');
        for (let i = 0; i < mv_trailer.length; i++) {
            $('#show_mv_trailer').append($('<iframe>').attr({
                    width: "560",
                    height: "315",
                    src: "https://www.youtube.com/embed/" + mv_trailer[i],
                    title: "YouTube video player",
                    frameBorder: "0",
                    allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                }
            ))

        }

    });


    let main_pic_path = $('.mv_main_pic_img').attr('src');
    let main_pic;
    $('#mv_main_pic').change(function () {
        main_pic = this.files[0];
        if (main_pic.size > 1024 * 1024) {
            alert(Math.round(main_pic.size / 1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
            $('#mv_main_pic_img').attr('src', main_pic_path);
            $(this).val('');
            return;
        }

        var reader = new FileReader();
        reader.readAsDataURL(main_pic);

        reader.onload = function () {
            $('#mv_main_pic_img').attr('src', reader.result);
        }


    })
    let poster_path = $('.mv_poster_img').attr('src');
    let poster;
    $('#mv_poster').change(function () {
        poster = this.files[0];
        if (poster.size > 1024 * 1024) {
            alert(Math.round(poster.size / 1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
            $('#mv_poster_img').attr('src', poster_path);
            $(this).val('');
            return;
        }

        var reader = new FileReader();
        reader.readAsDataURL(poster);

        reader.onload = function () {
            $('#mv_poster_img').attr('src', reader.result);
        }


    })
    $('#mv_pic').change(function (e) {
        $('#mv_pic_span').children().remove();
        var sel_files = [];

        var files = e.target.files;
        var file_arr = Array.prototype.slice.call(files);

        var index = 0;
        file_arr.forEach(function (f) {
            sel_files.push(f);
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#mv_pic_span').append($('<img>').attr({
                    src: reader.result,
                    width: "300px",
                    height: "300px"
                }))
                index++;
            }
            reader.readAsDataURL(f);
        })
    })


})