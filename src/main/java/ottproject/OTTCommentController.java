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
import java.io.IOException;

// "/OTTCommentController"라는 URL 요청이 들어오면
// 이 Servlet이 처리하도록 설정
@WebServlet("/OTTCommentController")
public class OTTCommentController extends HttpServlet {

    // POST 방식의 요청을 처리하는 메서드
    // jQuery AJAX에서 type: "POST"로 보냈기 때문에
    // 이 메서드가 실행됨
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) action = "insert";

        OTTCommentDAO dao = new OTTCommentDAO();
        int result = 0;

        if ("insert".equals(action)) {
            String userName = request.getParameter("userName");
            String userComment = request.getParameter("userComment");
            int ottId = Integer.parseInt(request.getParameter("ottId"));

            OTTComment comment = new OTTComment();
            comment.setUserName(userName);
            comment.setUserComment(userComment);
            comment.setOttId(ottId);

            result = dao.insertComment(comment);

        } else if ("delete".equals(action)) {
            int commentId = Integer.parseInt(request.getParameter("commentId"));
            result = dao.deleteComment(commentId); // 이미 OTTCommentDAO에 존재하는 삭제 메서드 사용
        }

        if (result > 0) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}

