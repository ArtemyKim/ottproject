package ottproject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.HttpSession;


@WebServlet("*.do")
public class OTTController extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = "otthome.jsp";
		String uri = req.getRequestURI(); //http://localhost:8080/empapp/list.do
		String requestUri = uri.substring(uri.lastIndexOf("/"), uri.length());
		System.out.println("requestUri=" + requestUri); // request 요청 확인용(주소창에 뭘 입력했는지)
		
		switch (requestUri) {
			case "/otthome.do" : {
				page = "otthome.jsp";
				break;
			}
			case "/ottpage.do" : {
				// otthome.jsp에서의 animationId 변수를 가져온 후 가공하여 숫자만 남김. 이 값은 DB의 OTT_id와 같도록 할 것.
				int ottid = Integer.parseInt(req.getParameter("ottId")); 
			    System.out.println(ottid);
			    
			    List<OTTComment> ottCommentList = OTTCommentDAO.selectCommentsByOttId(ottid);
			    OTTContent content = OTTContentDAO.selectContentById(ottid);
			    
			    System.out.println(content.ottTitle);
			    
			    req.setAttribute("curId", ottid); 
			    req.setAttribute("ottContent", content); // 내장객체 request에 "ottContent" 라는 이름으로 ott객체를 저장함
			    req.setAttribute("ottCommentList", ottCommentList); // 내장객체 request에 "ottContent" 라는 이름으로 ott객체를 저장함
			    
			    page = "ottpage.jsp";
			    break;
			}
			case "/login.do" : {
				String userId = req.getParameter("userId");
				String userPassword = req.getParameter("userPassword");
				
				if (userId == null || userId.trim().isEmpty()) {
					page = "login.jsp";
				} else {
					HttpSession session = req.getSession();
					session.setAttribute("loginUser", userId);
					
					page = "otthome.jsp";
				}
				break;
			}
			case "/logout.do" : {
				HttpSession session = req.getSession(false);
				if (session != null) {
			        session.invalidate(); // 세션 완전 제거
			    }
				page = "otthome.jsp";
				break;
			}
			default :
		}
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
		
	}
}