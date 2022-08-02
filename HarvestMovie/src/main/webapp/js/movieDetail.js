$(function () {

    function getContextPath() {
        var hostIndex = location.href.indexOf(location.host) + location.host.length;
        return location.href.substring(hostIndex, location.href.indexOf('/'));
    }

    var curr_rating=0;
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
                        $(this).attr('src', ctx + '/images/star_reverse.png');

                    } else if (index %1 ==0&& index < param.mv_rating) {
                        $(this).attr('src', ctx + '/images/star.png');

                    } else if (index % 1 == 0.5) {
                        $(this).attr('src', ctx + '/images/star_blank_reverse.png');

                    } else {
                        $(this).attr('src', ctx + '/images/star_blank.png');

                    }
                    index += 0.5;
                })


                curr_rating = param.mv_rating;

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
                if (param.isSuccess == 'false') {
                    alert('오류 발생')
                } else if (param.isSuccess == 'try_login') {
                    alert('로그인이 필요합니다.');
                } else {
                    get_rating();
                    curr_rating = rating;
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
            url: 'movieGetWillWatch.do',
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
                    ctx += '/images/unchecked.svg'
                } else {
                    ctx += '/images/checked.svg';
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

                if (param.isSuccess == 'false') {
                    alert('오류 발생');
                } else if (param.isSuccess == 'try_login') {
                    alert('로그인이 필요합니다.');
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

    $('.mv_star').hover(function () {
        var ctx = getContextPath();
        let id = $(this).attr('id')-0.5;
        let index = 0;
        $('.mv_star').each(function () {
            if (index % 1 == 0 && index > id) {
                $(this).attr('src', ctx + '/images/star_blank.png');

            } else if (index%1==0.5  && index > id) {
                $(this).attr('src', ctx + '/images/star_blank_reverse.png');

            } else if (index % 1 == 0) {
                $(this).attr('src', ctx + '/images/star.png');

            } else {
                $(this).attr('src', ctx + '/images/star_reverse.png');

            }
            index += 0.5;
        })


    }, function () {
        var ctx = getContextPath();

        let index = 0;
        $('.mv_star').each(function () {
            if (index % 1 == 0 && index < curr_rating) {
                $(this).attr('src', ctx + '/images/star.png');

            } else if (index%1 == 0.5 && index < curr_rating) {
                $(this).attr('src', ctx + '/images/star_reverse.png');

            } else if (index % 1 == 0) {
                $(this).attr('src', ctx + '/images/star_blank.png');

            } else {
                $(this).attr('src', ctx + '/images/star_blank_reverse.png');

            }
            index += 0.5;
        })
    })




})