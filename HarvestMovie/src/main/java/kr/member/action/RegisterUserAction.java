package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class RegisterUserAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
				
		//자바빈(VO) 생성
		MemberVO member = new MemberVO();
		//전송된 데이터를 자바빈에 저장
		member.setId(request.getParameter("id"));
		member.setName(request.getParameter("name"));
		member.setPw(request.getParameter("pw"));
		member.setEmail(request.getParameter("email"));
		member.setZipcode(request.getParameter("zipcode"));
		member.setAddr1(request.getParameter("addr1"));
		member.setAddr2(request.getParameter("addr2"));
		
			  
		MemberDAO dao = MemberDAO.getInstance();
		dao.insertMember(member);
				
		return "/WEB-INF/views/member/registerUser.jsp";
	}
	
	

}
