package kr.movie.review.action;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.movie.review.dao.ReviewDAO;
import kr.movie.review.vo.ReviewVO;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewMoreAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        int reviewCount = Integer.parseInt(request.getParameter("review_count"));

        MemberDAO memberDAO = MemberDAO.getInstance();
        MemberVO memberVO = new MemberVO();
        if (user_num != null) {
            memberVO = memberDAO.getMember(user_num);
        }

        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        List<ReviewVO> reviewVOList = reviewDAO.getReviewList(mv_num, reviewCount*10+1,(reviewCount+1)*10);

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> mapAjax = new HashMap<>();
        mapAjax.put("reviewVOList", reviewVOList);
        mapAjax.put("memberVO", memberVO);
        String ajaxData = mapper.writeValueAsString(mapAjax);
        request.setAttribute("ajaxData", ajaxData);



        return "/WEB-INF/views/common/ajax_view.jsp";
    }
}
