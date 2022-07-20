$(function () {

    function getContextPath() {
        var hostIndex = location.href.indexOf(location.host) + location.host.length;
        return location.href.substring(hostIndex, location.href.indexOf('/'));
    }

    function get_rating() {
        $.ajax({
            url: 'movieGetRating.do',
            type: 'post',
            data: {
                mv_num: $('#mv_num').val()
            },
            dataType: 'json',
            cache: false,
            timeout: 30000,
            success: function (param) {
                var ctx = getContextPath();
                var index = 0;
                $('.mv_star').each(function () {
                    if (index % 1 == 0.5 && index < param.mv_rating) {
                        $(this).attr('src', ctx + '/images/star_reverse.jpg');

                    } else if (index < param.mv_rating && index < param.mv_rating) {
                        $(this).attr('src', ctx + '/images/star.jpg');

                    } else if (index % 1 == 0.5) {
                        $(this).attr('src', ctx + '/images/start_blank_reverse.jpg');

                    } else {
                        $(this).attr('src', ctx + '/images/start_blank.jpg');

                    }
                    index += 0.5;
                })


                mv_rating = param.mv_rating;

            },
            error: function (request, status, error) {
                alert('네트워크 오류 발생');
                console.log("code: " + request.status)
                console.log("message: " + request.responseText)
                console.log("error: " + error);
            }
        });
    }

    get_rating();
    $('.mv_star').click(function () {

        var rating = this.getAttribute('id');

        $.ajax({
            url: 'movieRating.do',
            type: 'post',
            data: {
                mv_num: $('#mv_num').val(),
                mv_rating: rating
            },
            dataType: 'json',
            cache: false,
            timeout: 30000,
            success: function (param) {
                if (param.isSucess == 'false') {
                    alert('오류 발생')
                } else {
                    get_rating();
                }

            },
            error: function (request, status, error) {
                alert('네트워크 오류 발생');
                console.log("code: " + request.status)
                console.log("message: " + request.responseText)
                console.log("error: " + error);
            }
        });
    })

    function get_will_watch() {
        $.ajax({
            url: 'movieGetWillWatchAction.do',
            type: 'post',
            data: {
                mv_num: $('#mv_num').val()
            },
            dataType: 'json',
            cache: false,
            timeout: 30000,
            success: function (param) {
                var ctx = getContextPath();

                if (param.mv_will_watch_num == '0') {
                    ctx += '/images/will_watch.png'
                } else {
                    ctx += '/images/will_watch_checked.png';
                }
                $('#mv_will_watch').attr('src', ctx)
                mv_will_watch_num = param.mv_will_watch_num;

            },
            error: function (request, status, error) {
                alert('네트워크 오류 발생');
                console.log("code: " + request.status)
                console.log("message: " + request.responseText)
                console.log("error: " + error);
            }
        });
    }

    get_will_watch();
    $('#mv_will_watch').click(function () {
        $.ajax({
            url: 'movieWillWatch.do',
            type: 'post',
            data: {
                mv_num: $('#mv_num').val()
            },
            dataType: 'json',
            cache: false,
            timeout: 30000,
            success: function (param) {

                if (param.isSucess == 'false') {
                    alert('오류 발생');
                } else {
                    get_will_watch();

                }

            },
            error: function (request, status, error) {
                alert('네트워크 오류 발생');
                console.log("code: " + request.status)
                console.log("message: " + request.responseText)
                console.log("error: " + error);
            }
        });
    })


})