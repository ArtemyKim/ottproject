package ottproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OTTCommentDAO {

    public static List<OTTComment> selectCommentsByOttId(int ottId) {
        List<OTTComment> list = new ArrayList<>();
        String sql = "select comment_id, ott_id, user_name, user_comment, comment_time from ott_comment where ott_id = ? order by comment_time desc";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, ottId);

            try (ResultSet rs = psmt.executeQuery()) {
                while (rs.next()) {
                    OTTComment comment = new OTTComment();
                    comment.setCommentId(rs.getInt("comment_id"));
                    comment.setOttId(rs.getInt("ott_id"));
                    comment.setUserName(rs.getString("user_name"));
                    comment.setUserComment(rs.getString("user_comment"));
                    comment.setCommentTime(rs.getString("comment_time"));

                    list.add(comment);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int insertComment(OTTComment comment) {
        String sql = "insert into ott_comment (ott_id, user_name, user_comment, comment_time) values (?, ?, ?, now())";
        int result = 0;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, comment.ottId);
            psmt.setString(2, comment.userName);
            psmt.setString(3, comment.userComment);

            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int deleteComment(int commentId) {
        String sql = "delete from ott_comment where comment_id = ?";
        int result = 0;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, commentId);

            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}