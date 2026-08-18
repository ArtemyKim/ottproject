package ottproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OTTContentDAO {

    public static OTTContent selectContentById(int ottId) {
        OTTContent content = new OTTContent();
        String sql = "select ott_id, ott_Title, ott_day, ott_imageAddress, ott_description, ott_tag from ott_content where ott_id = ?";

        try (Connection conn = DBUtil.getConnection();
            PreparedStatement psmt = conn.prepareStatement(sql)) {
        	System.out.println("커넥션 완료"); //디버깅용

            psmt.setInt(1, ottId);

            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    content.setOttId(rs.getInt("ott_id"));
                    content.setOttTitle(rs.getString("ott_Title"));
                    content.setOttDay(rs.getString("ott_day"));
                    content.setOttImageAddress(rs.getString("ott_imageAddress"));
                    content.setOttDescription(rs.getString("ott_description"));
                    content.setOttTag(rs.getString("ott_tag"));
                    System.out.println("쿼리문 완료"); //디버깅용
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }
}