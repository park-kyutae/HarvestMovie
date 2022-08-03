$(function () {
    let review_count = 1;
    $('#review_more').click(function () {


        $.ajax({
            url: 'reviewMore.do',
            type: 'post',
            data: {
                mv_num: $('#mv_num').val(),
                review_count : review_count
            },
            dataType: 'json',
            cache: false,
            timeout: 30000,
            success: function (param) {
                if (param.reviewVOList.length > 0) {
                    $(param.reviewVOList).each(function (index, item) {
                        let output =
                            '<div class="row d-flex justify-content-center mb-3">' +
                            '<div class="card col col-sm-6 ">' +
                            '<div class="card-body">' +
                            '<h5 class="card-title">' + item.mem_name;
                        if (item.isCritic == true) {
                            output += '<img src="../../images/critic.svg" width="4%">';
                        }
                        output += '</h5>' +
                            '<p class="card-text">' + item.review_message + '</p>' +
                            '<div class="d-flex justify-content-end">';
                        if (param.memberVO.auth == 9) {
                            output += '<input type="button" value="삭제" class="btn btn-secondary' +
                                'onClick="location.href=\'../movie/review/reviewDelete.do?mv_num=' +
                                item.mv_num +
                                '&rv_user_num=' + item.user_num + '\'">';
                        }

                        output += '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                        $('#test').before(output);
                    })
                    review_count += 1;

                } else {
                    alert('리뷰가 없습니다.')
                }


            },

            error: function (request, status, error) {
                alert('네트워크 오류 발생');
                console.log("code: " + request.status)
                console.log("message: " + request.responseText)
                console.log("error: " + error);
            }
        });
    });
})