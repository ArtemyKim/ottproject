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
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        
        // 데이터 가져오기
        String userName = request.getParameter("userName");
        String userComment = request.getParameter("userComment");
        int ottId = Integer.parseInt(
                request.getParameter("ottId")
        );
        
        System.out.println("값 입력 : " + userName + userComment + ottId );
        
        // 전달받은 데이터를 이용해서 새로운 OTTComment 객체 생성
        OTTComment comment = new OTTComment();


        // 새 객체에 값들 저장해주고
        comment.setUserName(userName);
        comment.setUserComment(userComment);
        comment.setOttId(ottId);


        // DB 작업을 담당하는 DAO 객체 생성
        OTTCommentDAO dao = new OTTCommentDAO();


        // DAO의 insertComment()를 호출하여
        // 댓글을 MySQL에 INSERT
        //
        // INSERT가 성공하면 result에는 보통 1이 저장되고,
        // 실패하면 0이 저장됨
        int result = dao.insertComment(comment);

        // AJAX에서 받을 응답의 형식을 설정
        // 여기서는 단순한 문자열을 반환할 것이므로 text/plain 사용
        response.setContentType("text/plain; charset=UTF-8");


        // DB INSERT 성공 여부 확인
        if (result > 0) {
        	
        	System.out.println("댓글 입력 및 DB저장 성공");

            // AJAX의 success 함수로 "success" 전달
            response.getWriter().write("success");

        } else {

            // INSERT 실패 시 "fail" 전달
            response.getWriter().write("fail");

        }
    }
}

