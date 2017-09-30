package kagoyume;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ユーザー情報を持ちまわるJavaBeans データベースのカラムと型に対応させている(DTO)。データの挿入、取り出しどちらにも便利
 *
 * @author guest1Day
 */
public class UserDataDTO implements Serializable {

    private int userID;
    private String name;
    private String password;
    private String email;
    private String address;
    private int total;
    private Timestamp newDate;
    private int deleteFlag;

    UserDataDTO() {
    }

    public int getUserID() {
        return this.userID;
    }

    public void setUserID(int id) {
        this.userID = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        if (!(name == null)) {
            this.name = name;
        } else {
            this.name = "";
        }
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        if (!(password == null)) {
            this.password = password;
        } else {
            this.password = "";
        }
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        if (!(email == null)) {
            this.email = email;
        } else {
            this.email = "";
        }
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        if (!(address == null)) {
            this.address = address;
        } else {
            this.address = "";
        }
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Timestamp getNewDate() {
        return this.newDate;
    }

    public void setNewDate(Timestamp newDate) {
        this.newDate = newDate;
    }

    public int getDeleteFlag() {
        return this.deleteFlag;
    }

    public void setDeleteFlag(int deleteFlag) {
        this.deleteFlag = deleteFlag;
    }
}
