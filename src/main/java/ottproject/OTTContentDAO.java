package ottproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OTTContentDAO {

    public static OTTContent selectContentById(int ottId) {
        OTTContent content = null;
        String sql = "select ott_id, ott_title, ott_day, ott_imageAddress, ott_description, ott_tag from ott_content where ott_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, ottId);

            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    content = new OTTContent();
                    content.setOttId(rs.getInt("ott_id"));
                    content.setOttTitle(rs.getString("ott_title"));
                    content.setOttDay(rs.getString("ott_day"));
                    content.setOttImageAddress(rs.getString("ott_imageAddress"));
                    content.setOttDescription(rs.getString("ott_description"));
                    content.setOttTag(rs.getString("ott_tag"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }
}