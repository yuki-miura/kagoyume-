package kagoyume;

import base.DBManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * 商品情報を格納するテーブルに対しての操作処理を包括する DB接続系はDBManagerクラスに一任 基本的にはやりたい1種類の動作に対して1メソッド
 *
 * @author guest1Day
 */
public class ProductDataDAO {

    //インスタンスオブジェクトを返却させてコードの簡略化
    public static ProductDataDAO getInstance() {
        return new ProductDataDAO();
    }

    public ArrayList<ProductDataDTO> history(int userID) throws SQLException {
        Connection con = null;
        PreparedStatement st = null;
        ArrayList<ProductDataDTO> pddArray = new ArrayList();
        try {
            con = DBManager.getConnection();

            String sql = "SELECT itemCode,type,buyDate FROM buy_t WHERE userID = ?";

            st = con.prepareStatement(sql);
            st.setInt(1, userID);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                ProductDataDTO resultPd = new ProductDataDTO();
                resultPd.setItemCode(rs.getString("itemCode"));
                resultPd.setType(rs.getInt("type"));
                resultPd.setBuyDate(rs.getTimestamp("buyDate"));
                pddArray.add(resultPd);
            }

            return pddArray;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new SQLException(e);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public void buy(ArrayList<ProductBeans> pdd, UserDataDTO ud, int type) throws SQLException {
        Connection con = null;
        PreparedStatement st = null;

        try {

            con = DBManager.getConnection();
            st = con.prepareStatement("INSERT INTO buy_t(userID,itemCode,type,buyDate) VALUES(?,?,?,?)");
            for (ProductBeans value : pdd) {
                st.setInt(1, ud.getUserID());
                st.setString(2, value.getCode());
                st.setInt(3, type);
                st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                st.executeUpdate();
            }
            System.out.println("insert completed");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new SQLException(e);
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }
}
