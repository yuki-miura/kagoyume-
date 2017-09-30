package kagoyume;

import base.DBManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 * ユーザー情報を格納するテーブルに対しての操作処理を包括する DB接続系はDBManagerクラスに一任 基本的にはやりたい1種類の動作に対して1メソッド
 * @author guest1Day
 */
public class UserDataDAO {

    //インスタンスオブジェクトを返却させてコードの簡略化
    public static UserDataDAO getInstance() {
        return new UserDataDAO();
    }

    /**
     * データの挿入処理を行う。現在時刻は挿入直前に生成
     *
     * @param ud 対応したデータを保持しているJavaBeans
     * @throws SQLException 呼び出し元にcatchさせるためにスロー
     */
    public void insert(UserDataDTO ud) throws SQLException {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = DBManager.getConnection();
            st = con.prepareStatement("INSERT INTO user_t(name,password,mail,address,newDate) VALUES(?,?,?,?,?)");
            st.setString(1, ud.getName());
            st.setString(2, ud.getPassword());
            st.setString(3, ud.getEmail());
            st.setString(4, ud.getAddress());
            st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            st.executeUpdate();
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

    public UserDataDTO login(UserDataDTO log) throws SQLException {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet da = null;
        try {
            con = DBManager.getConnection();
            st = con.prepareStatement("SELECT userID,name,password,mail,address,total,newDate,deleteFlag FROM user_t WHERE name=? and password=?");
            st.setString(1, log.getName());
            st.setString(2, log.getPassword());
            da = st.executeQuery();

            UserDataDTO login = new UserDataDTO();
            //DBに該当データがあれば、loginに要素を追加
            while (da.next()) {
                login.setUserID(da.getInt("userID"));
                login.setName(da.getString("name"));
                login.setPassword(da.getString("password"));
                login.setEmail(da.getString("mail"));
                login.setAddress(da.getString("address"));
                login.setTotal(da.getInt("total"));
                login.setNewDate(da.getTimestamp("newDate"));
                login.setDeleteFlag(da.getInt("deleteFlag"));
            }
            return login;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new SQLException(e);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * データの更新処理を行う。現在時刻は挿入直前に生成
     *
     * @param ud 対応したデータを保持しているJavaBeans
     * @throws SQLException 呼び出し元にcatchさせるためにスロー
     */
    public void update(UserDataDTO ud) throws SQLException {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = DBManager.getConnection();
            String sql = "UPDATE user_t SET name=?,password=?,mail=?,address=?,newDate=? WHERE userID = ?";

            st = con.prepareStatement(sql);
            st.setString(1, ud.getName());
            st.setString(2, ud.getPassword());
            st.setString(3, ud.getEmail());
            st.setString(4, ud.getAddress());
            st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            st.setInt(6, ud.getUserID());

            int i = st.executeUpdate();
            if (i == 0) {//更新失敗時のフォロー
                throw new Exception("更新に失敗しました。");
            }

        } catch (SQLException e_sql) {
            System.out.println(e_sql.getMessage());
            throw new SQLException(e_sql);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw new SQLException(e);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * ユーザーIDによる1件のデータの検索処理を行う。
     *
     * @param ud 対応したデータを保持しているJavaBeans
     * @throws SQLException 呼び出し元にcatchさせるためにスロー
     * @return 検索結果
     */
    public UserDataDTO searchByID(UserDataDTO ud) throws SQLException {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = DBManager.getConnection();

            String sql = "SELECT userID,name,password,mail,address,total,newDate FROM user_t WHERE userID = ?";

            st = con.prepareStatement(sql);
            st.setInt(1, ud.getUserID());

            ResultSet rs = st.executeQuery();
            rs.next();
            UserDataDTO resultUd = new UserDataDTO();
            resultUd.setUserID(rs.getInt(1));
            resultUd.setName(rs.getString(2));
            resultUd.setPassword(rs.getString(3));
            resultUd.setEmail(rs.getString(4));
            resultUd.setAddress(rs.getString(5));
            resultUd.setTotal(rs.getInt(6));
            resultUd.setNewDate(rs.getTimestamp(7));

            System.out.println("searchByID completed");

            return resultUd;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new SQLException(e);
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    /**
     * データの削除処理を行う。deleteFlagを１にする。
     *
     * @param ud 対応したデータを保持しているJavaBeans
     * @throws SQLException 呼び出し元にcatchさせるためにスロー
     */
    public void delete(UserDataDTO ud) throws SQLException {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = DBManager.getConnection();
            String sql = "UPDATE user_t SET deleteFlag=? WHERE userID = ?";

            st = con.prepareStatement(sql);
            st.setInt(1, 1);
            st.setInt(2, ud.getUserID());

            int i = st.executeUpdate();
            if (i == 0) {//更新失敗時のフォロー
                throw new Exception("更新に失敗しました。");
            }

        } catch (SQLException e_sql) {
            System.out.println(e_sql.getMessage());
            throw new SQLException(e_sql);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw new SQLException(e);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    
    public void totalUpdate(UserDataDTO ud,int totalPrice)throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try {
            
            UserDataDTO udd = searchByID(ud);
            int tp = udd.getTotal() + totalPrice;
            
            con = DBManager.getConnection();
            String sql = "UPDATE user_t SET total=? WHERE userID = ?";

            st = con.prepareStatement(sql);
            st.setInt(1, tp);
            st.setInt(2, ud.getUserID()); 
            
             int i = st.executeUpdate();
            if (i == 0) {//更新失敗時のフォロー
                throw new Exception("更新に失敗しました。");
            }
        
         } catch (Exception e) {
            System.out.println(e.getMessage());
            throw new SQLException(e);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
}
